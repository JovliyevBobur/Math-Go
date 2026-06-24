import { useState, useRef } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { supabase } from '@/integrations/supabase/client';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Textarea } from '@/components/ui/textarea';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Badge } from '@/components/ui/badge';
import { ImportProgressBar, type ImportStage } from './ImportProgressBar';
import { SUBJECTS } from '@/lib/constants';
import { Upload, Loader2, CheckCircle, AlertCircle, FileUp } from 'lucide-react';
import { toast } from 'sonner';

interface ImportJob {
  id: string;
  status: 'queued' | 'running' | 'done' | 'failed';
  progress: number;
  error_message?: string;
  questions_count?: number;
  result_test_id?: string;
}

export function PDFImportForm() {
  const { session } = useAuth();
  const fileInputRef = useRef<HTMLInputElement>(null);
  
  const [file, setFile] = useState<File | null>(null);
  const [title, setTitle] = useState('');
  const [subject, setSubject] = useState('');
  const [durationMinutes, setDurationMinutes] = useState('30');
  const [accessCode, setAccessCode] = useState('');
  const [topicStart, setTopicStart] = useState('0');
  const [topicEnd, setTopicEnd] = useState('999');
  const [maxQuestions, setMaxQuestions] = useState('9999');
  const [numGroups, setNumGroups] = useState('3');
  
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [job, setJob] = useState<ImportJob | null>(null);
  const [importStage, setImportStage] = useState<ImportStage>(0);
  const [showDialog, setShowDialog] = useState(false);

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFile = e.target.files?.[0];
    if (selectedFile) {
      if (!selectedFile.name.toLowerCase().endsWith('.pdf')) {
        toast.error('Faqat PDF formatdagi fayl yuklash mumkin');
        return;
      }
      if (selectedFile.size > 20 * 1024 * 1024) {
        toast.error('PDF fayli 20 MB dan kichik bo\'lishi kerak');
        return;
      }
      setFile(selectedFile);
    }
  };

  const pollJobStatus = async (jobId: string) => {
    let attempts = 0;
    const maxAttempts = 120; // 2 minutes

    const poll = async () => {
      if (attempts >= maxAttempts) {
        toast.error('Vaqt tugadi');
        setIsSubmitting(false);
        setImportStage(0);
        return;
      }

      try {
        const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
        const response = await fetch(
          `${supabaseUrl}/functions/v1/parse-pdf-to-test?job_id=${jobId}`,
          {
            method: 'GET',
            headers: {
              Authorization: `Bearer ${session?.access_token}`,
            },
          }
        );

        if (!response.ok) throw new Error('Status so\'rovi xatolik');

        const { job: jobData } = await response.json();
        setJob(jobData);

        // Update stage
        const stageMap: { [key: string]: ImportStage } = {
          'queued': 1,
          'running': 2,
          'done': 3,
          'failed': 0,
        };
        setImportStage((stageMap[jobData.status] || 0) as ImportStage);

        if (jobData.status === 'done') {
          setIsSubmitting(false);
          toast.success(`✓ ${jobData.questions_count} ta savol import qilindi`);
          // Reset form
          setFile(null);
          setTitle('');
          setSubject('');
          setAccessCode('');
          setTimeout(() => {
            setShowDialog(false);
            setJob(null);
            setImportStage(0);
          }, 2000);
          return;
        }

        if (jobData.status === 'failed') {
          setIsSubmitting(false);
          toast.error(`Xatolik: ${jobData.error_message || 'Noma\'lum xatolik'}`);
          setImportStage(0);
          return;
        }

        // Continue polling
        attempts++;
        setTimeout(poll, 1000);
      } catch (error) {
        console.error('Poll error:', error);
        attempts++;
        setTimeout(poll, 2000);
      }
    };

    poll();
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!file || !title || !subject) {
      toast.error('PDF, sarlavha va fanni tanlang');
      return;
    }

    if (title.length < 3 || title.length > 200) {
      toast.error('Sarlavha 3-200 belgi orasida bo\'lishi kerak');
      return;
    }

    const tStart = parseInt(topicStart);
    const tEnd = parseInt(topicEnd);
    const maxQ = parseInt(maxQuestions);
    const nGroups = parseInt(numGroups);

    if (isNaN(tStart) || tStart < 0) {
      toast.error('Mavzu boshlang\'ichi 0 yoki undan katta bo\'lishi kerak');
      return;
    }

    if (isNaN(tEnd) || tEnd < tStart) {
      toast.error('Mavzu tugallanishi boshlang\'ichdan katta yoki teng bo\'lishi kerak');
      return;
    }

    if (isNaN(maxQ) || maxQ < 1 || maxQ > 500) {
      toast.error('Savollar soni 1-500 orasida bo\'lishi kerak');
      return;
    }

    if (isNaN(nGroups) || (nGroups !== 3 && nGroups !== 4)) {
      toast.error('Guruhlar soni 3 yoki 4 bo\'lishi kerak');
      return;
    }

    setIsSubmitting(true);
    setImportStage(1);

    try {
      const formData = new FormData();
      formData.append('file', file);
      formData.append('title', title);
      formData.append('subject', subject);
      formData.append('duration_minutes', durationMinutes);
      if (accessCode) formData.append('access_code', accessCode);
      formData.append('num_groups', numGroups);
      formData.append('max_questions', maxQuestions);

      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
      const response = await fetch(
        `${supabaseUrl}/functions/v1/parse-pdf-to-test`,
        {
          method: 'POST',
          headers: {
            Authorization: `Bearer ${session?.access_token}`,
          },
          body: formData,
        }
      );

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Upload xatolik');
      }

      const { job_id } = await response.json();
      setImportStage(2);
      pollJobStatus(job_id);
    } catch (error) {
      console.error('Upload error:', error);
      toast.error(error instanceof Error ? error.message : 'Upload xatolik');
      setIsSubmitting(false);
      setImportStage(0);
    }
  };

  return (
    <>
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <FileUp className="w-5 h-5" />
            PDF dan Test Yaratish
          </CardTitle>
          <CardDescription>
            Kitobdan PDF tashlab, avtomatik savollar ajratib oling
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Button
            onClick={() => setShowDialog(true)}
            variant="outline"
            className="w-full"
          >
            <Upload className="w-4 h-4 mr-2" />
            PDF Tanlash va Import Qilish
          </Button>
        </CardContent>
      </Card>

      <Dialog open={showDialog} onOpenChange={setShowDialog}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>PDF dan Test Yaratish</DialogTitle>
          </DialogHeader>

          {importStage > 0 && (
            <ImportProgressBar stage={importStage} progress={job?.progress} />
          )}

          {job && job.status === 'done' && (
            <div className="flex items-center gap-3 p-4 bg-green-50 dark:bg-green-950 rounded-lg border border-green-200 dark:border-green-800">
              <CheckCircle className="w-5 h-5 text-green-600" />
              <div>
                <p className="font-medium text-green-900 dark:text-green-100">Muvaffaqiyatli!</p>
                <p className="text-sm text-green-800 dark:text-green-200">
                  {job.questions_count} ta savol import qilindi
                </p>
              </div>
            </div>
          )}

          {job && job.status === 'failed' && (
            <div className="flex items-center gap-3 p-4 bg-red-50 dark:bg-red-950 rounded-lg border border-red-200 dark:border-red-800">
              <AlertCircle className="w-5 h-5 text-red-600" />
              <div>
                <p className="font-medium text-red-900 dark:text-red-100">Xatolik</p>
                <p className="text-sm text-red-800 dark:text-red-200">
                  {job.error_message}
                </p>
              </div>
            </div>
          )}

          {!isSubmitting && importStage === 0 && (
            <form onSubmit={handleSubmit} className="space-y-6">
              {/* File Input */}
              <div>
                <Label htmlFor="pdf-file">PDF Fayli *</Label>
                <div className="mt-2">
                  <input
                    ref={fileInputRef}
                    id="pdf-file"
                    type="file"
                    accept=".pdf"
                    onChange={handleFileSelect}
                    className="hidden"
                    disabled={isSubmitting}
                  />
                  <Button
                    type="button"
                    variant="outline"
                    className="w-full"
                    onClick={() => fileInputRef.current?.click()}
                    disabled={isSubmitting}
                  >
                    <Upload className="w-4 h-4 mr-2" />
                    {file ? file.name : 'PDF Tanlang'}
                  </Button>
                  {file && (
                    <p className="text-sm text-muted-foreground mt-2">
                      Tanlangan: <Badge variant="secondary">{(file.size / 1024 / 1024).toFixed(1)} MB</Badge>
                    </p>
                  )}
                </div>
              </div>

              {/* Title */}
              <div>
                <Label htmlFor="title">Test Sarlavhasi *</Label>
                <Input
                  id="title"
                  placeholder="Masalan: Algebra Kitob - Fasl 1"
                  value={title}
                  onChange={(e) => setTitle(e.target.value)}
                  disabled={isSubmitting}
                  maxLength={200}
                />
                <p className="text-xs text-muted-foreground mt-1">
                  {title.length}/200
                </p>
              </div>

              {/* Subject */}
              <div>
                <Label htmlFor="subject">Fan *</Label>
                <Select value={subject} onValueChange={setSubject} disabled={isSubmitting}>
                  <SelectTrigger id="subject">
                    <SelectValue placeholder="Fan tanlang" />
                  </SelectTrigger>
                  <SelectContent>
                    {SUBJECTS.map((s) => (
                      <SelectItem key={s.id} value={s.id}>
                        {s.name}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              {/* Topic Range */}
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <Label htmlFor="num-groups">Kitobni Nechta Guruhga Bo'lish</Label>
                  <Select value={numGroups} onValueChange={setNumGroups} disabled={isSubmitting}>
                    <SelectTrigger id="num-groups">
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="3">
                        3 Guruh
                      </SelectItem>
                      <SelectItem value="4">
                        4 Guruh
                      </SelectItem>
                    </SelectContent>
                  </Select>
                  <p className="text-xs text-muted-foreground mt-1">
                    Kitob mavzularini nechta qismga bo'lib chiqsa kerak
                  </p>
                </div>
                <div>
                  <Label htmlFor="max-questions">Har Guruhdan Savollar Soni</Label>
                  <Input
                    id="max-questions"
                    type="number"
                    min="1"
                    max="500"
                    value={maxQuestions}
                    onChange={(e) => setMaxQuestions(e.target.value)}
                    disabled={isSubmitting}
                    placeholder="15"
                  />
                  <p className="text-xs text-muted-foreground mt-1">
                    1-500 orasida
                  </p>
                </div>
              </div>

              {/* Duration */}
              <div>
                <Label htmlFor="duration">Test Davomiyligi (Daqiqada)</Label>
                <Select value={durationMinutes} onValueChange={setDurationMinutes} disabled={isSubmitting}>
                  <SelectTrigger id="duration">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {[15, 30, 45, 60, 90, 120].map((mins) => (
                      <SelectItem key={mins} value={mins.toString()}>
                        {mins} daqiqa
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              {/* Access Code */}
              <div>
                <Label htmlFor="access-code">Kirish Kodi (Ixtiyoriy)</Label>
                <Input
                  id="access-code"
                  placeholder="Masalan: TEST123"
                  value={accessCode}
                  onChange={(e) => setAccessCode(e.target.value)}
                  disabled={isSubmitting}
                  maxLength={20}
                />
                <p className="text-xs text-muted-foreground mt-1">
                  4-20 belgi. Bo'sh qoldirsa, umum foydalanuvchilarga ochiq bo'ladi
                </p>
              </div>

              {/* Buttons */}
              <div className="flex gap-3 pt-4">
                <Button
                  type="submit"
                  disabled={isSubmitting || !file}
                  className="flex-1"
                >
                  {isSubmitting ? (
                    <>
                      <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                      Yuborilmoqda...
                    </>
                  ) : (
                    <>
                      <Upload className="w-4 h-4 mr-2" />
                      Import Qilish
                    </>
                  )}
                </Button>
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => setShowDialog(false)}
                  disabled={isSubmitting}
                >
                  Bekor Qilish
                </Button>
              </div>
            </form>
          )}
        </DialogContent>
      </Dialog>
    </>
  );
}
