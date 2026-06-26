// Math Go AI chat edge function
import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const LOVABLE_API_KEY = Deno.env.get("LOVABLE_API_KEY");
const AI_GATEWAY_URL = "https://ai.gateway.lovable.dev/v1/chat/completions";
const MODEL = "google/gemini-3-flash-preview";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

interface OpenAIMessage {
  role: "system" | "user" | "assistant";
  content: string;
}

async function callAI(messages: OpenAIMessage[]): Promise<string> {
  if (!LOVABLE_API_KEY) {
    throw new Error("LOVABLE_API_KEY is not set");
  }

  const response = await fetch(AI_GATEWAY_URL, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Lovable-API-Key": LOVABLE_API_KEY,
      "X-Lovable-AIG-SDK": "edge-fetch",
    },
    body: JSON.stringify({
      model: MODEL,
      messages,
      temperature: 0.3,
    }),
  });

  if (response.status === 429) {
    throw new Error("RATE_LIMIT");
  }
  if (response.status === 402) {
    throw new Error("PAYMENT_REQUIRED");
  }
  if (!response.ok) {
    const errorText = await response.text();
    console.error("AI gateway error:", response.status, errorText);
    throw new Error(`AI gateway error: ${response.status}`);
  }

  const data = await response.json();
  const text =
    data?.choices?.[0]?.message?.content || "Javob olishda xatolik.";
  return text;
}

// System prompt for test analysis
const ANALYZE_SYSTEM_PROMPT = `Sen Math Go AI — matematika fani bo'yicha professional o'qituvchi va tahlilchisan. Sening vazifang test natijalarini batafsil tahlil qilish.

JAVOBNI QUYIDAGI TARTIBDA YOZ:

## 📊 Umumiy natija
- To'g'ri javoblar sonini va umumiy natijani FOIZDA ko'rsat (masalan: "7/10 — 70%").
- Daraja bahosini ber: 95%+ A+, 85%+ A, 75%+ B+, 65%+ B, 50%+ C+, aks holda C.
- Mavzular bo'yicha qaysi mavzularda kuchli, qaysilarida zaif ekanini qisqacha yoz.

## ✅ To'g'ri javoblar (mavzular bo'yicha)
Har bir to'g'ri javob uchun mavzu tegini (topic) va nima uchun to'g'ri ekanini qisqa yoz.

## ❌ Noto'g'ri javoblar (batafsil tahlil)
Har bir NOTO'G'RI javob uchun:
1. **Mavzu:** aniq topic teg (masalan: Trigonometriya, Hosila, Integral, Tenglama, Algebraik ifodalar)
2. **Ish jarayoni:** oraliq hisoblarni ketma-ket bosqichlarda ko'rsat
3. **Formula:** matematik formulalarni LaTeX bilan yoz: inline \\(...\\), alohida formula $...$
4. **Xatoning sababi:** foydalanuvchi qayerda xato qilgan bo'lishi mumkinligini tushuntir
5. **📚 Tavsiya:** Ushbu mavzuni o'rganish uchun darslik/kitob MAVZUSI nomini, taxminiy BETLAR oralig'ini va QAYSI TURDAGI MISOLLARDAN mashq qilish kerakligini ko'rsat. MUHIM: aniq misolning o'zini yozma — faqat mavzu, bet va misol turini umumiy ko'rsat (masalan: "Algebra darsligi, 'Qisqa ko'paytirish formulalari' mavzusi, ~45-52 betlar, shu mavzudagi 3-8 misollarni ishlang").

## 💡 Yakuniy maslahat
Zaif mavzular bo'yicha qaysi mavzularni takrorlash kerakligini qisqa ro'yxat qil.

O'zbek tilida javob ber. Markdown formatida yoz. Tushuntirishni aniq, sodda va oson tushuniladigan qil.`;


// System prompt for Math Go AI chatbot
const ALKHORAZMIY_SYSTEM_PROMPT = `Sen Math Go AI — matematika bo'yicha aniq, sodda va bosqichma-bosqich javob beradigan sun'iy intellekt yordamchisisan.

Sen faqat matematika sohasiga ixtisoslashgansan. Sening mutaxassisliging:
- Algebra va arifmetika
- Geometriya va trigonometriya (sin, cos, tg, ctg, ayniyatlar, tenglamalar)
- Statistika va ehtimollar nazariyasi
- Sonlar nazariyasi
- Matematik mantiq
- Tenglamalar va tengsizliklar
- Funksiyalar va grafiklar
- Limitlar, hosilalar va integrallar (matematik analiz)
- Kombinatorika
- Matritsalar va determinantlar

ANIQLIK QOIDALARI (juda muhim):
- Har bir hisob-kitobni bosqichma-bosqich, e'tibor bilan bajar va yakuniy javobni tekshir.
- Hosila va integrallarni standart qoidalar (zanjir qoidasi, bo'laklab integrallash, almashtirish) bilan to'g'ri hisobla.
- Trigonometrik ayniyat va qiymatlarni (masalan sin30°=1/2, cos60°=1/2) aniq qo'lla.
- Aniqmas integralda doimo "+C" yoz.
- Agar javob noaniq bo'lsa, taxmin qilma — aniq yechimni ko'rsat.
- Formulalarni chiroyli chiqishi uchun LaTeX formatida yoz: inline \\(...\\), alohida formula $...$.

JAVOB BERISH USULI:
1. Faqat O'zbek tilida javob ber
2. Agar savol matematikaga aloqasi bo'lmasa, muloyimlik bilan "Men faqat matematika bo'yicha yordam bera olaman" deb javob ber
3. Javoblarni qisqa, sodda va bosqichma-bosqich tushuntir (oson tushuniladigan qilib)
4. Zarur formulalar va misollar keltir
5. Markdown formatida yoz, yakuniy javobni **qalin** qilib ajrat
6. Do'stona va rag'batlantiruvchi ohangda suhbatlash
7. O'zingni "Math Go AI" deb tanishtir

Salom berganlarida o'zingni qisqa tanishtir va qanday yordam bera olishing haqida ayt.`;

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const { mode, messages, questions } = await req.json();

    if (mode === "analyze") {
      if (!questions || !Array.isArray(questions) || questions.length === 0) {
        return new Response(
          JSON.stringify({ error: "Savollar topilmadi" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const correctCount = questions.filter((q: { is_correct: boolean | null }) => q.is_correct === true).length;
      const totalCount = questions.length;
      const percent = Math.round((correctCount / totalCount) * 100);
      let prompt = `Test natijasi: ${correctCount}/${totalCount} to'g'ri javob (${percent}%).\nQuyidagi test savollarini yuqoridagi tartibda tahlil qil:\n\n`;
      questions.forEach(
        (
          q: {
            index: number;
            question_text: string;
            choices: { text: string; is_correct: boolean }[];
            user_choice: string | null;
            is_correct: boolean | null;
          },
          i: number
        ) => {
          prompt += `### ${i + 1}-savol: ${q.question_text}\n`;
          prompt += `Javob variantlari:\n`;
          q.choices.forEach(
            (c: { text: string; is_correct: boolean }, ci: number) => {
              const letter = String.fromCharCode(65 + ci);
              const marker = c.is_correct ? " ✅ (to'g'ri javob)" : "";
              prompt += `  ${letter}) ${c.text}${marker}\n`;
            }
          );
          if (q.user_choice) {
            prompt += `Foydalanuvchi javobi: ${q.user_choice}\n`;
            prompt += `Natija: ${q.is_correct ? "✅ To'g'ri" : "❌ Noto'g'ri"}\n`;
          } else {
            prompt += `Foydalanuvchi javob bermagan\n`;
          }
          prompt += "\n";
        }
      );

      const analysis = await callAI([
        { role: "system", content: ANALYZE_SYSTEM_PROMPT },
        { role: "user", content: prompt },
      ]);

      return new Response(
        JSON.stringify({ analysis }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    } else if (mode === "chat") {
      if (!messages || !Array.isArray(messages) || messages.length === 0) {
        return new Response(
          JSON.stringify({ error: "Xabar topilmadi" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const aiMessages: OpenAIMessage[] = [
        { role: "system", content: ALKHORAZMIY_SYSTEM_PROMPT },
        ...messages.map((m: { role: string; content: string }) => ({
          role: (m.role === "user" ? "user" : "assistant") as "user" | "assistant",
          content: m.content,
        })),
      ];

      const reply = await callAI(aiMessages);

      return new Response(
        JSON.stringify({ reply }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    } else {
      return new Response(
        JSON.stringify({ error: "Noto'g'ri rejim. 'analyze' yoki 'chat' dan foydalaning" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }
  } catch (error: unknown) {
    const message = error instanceof Error ? error.message : "Noma'lum xatolik";
    console.error("AI function error:", message);
    let userMessage = message;
    let status = 500;
    if (message === "RATE_LIMIT") {
      userMessage = "So'rovlar limiti oshib ketdi. Iltimos biroz kuting va qayta urinib ko'ring.";
      status = 429;
    } else if (message === "PAYMENT_REQUIRED") {
      userMessage = "AI kreditlari tugadi. Iltimos balansni to'ldiring.";
      status = 402;
    }
    return new Response(
      JSON.stringify({ error: userMessage }),
      { status, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
