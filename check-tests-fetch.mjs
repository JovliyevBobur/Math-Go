const url = "https://ekdkrysarlsbrnsgimsx.supabase.co/rest/v1/tests?select=id,title";
const key = "sb_publishable_EvNXcZgyd_QnnzoXBouXDA_cXpM-SFB";

fetch(url, {
  headers: {
    apikey: key,
    Authorization: `Bearer ${key}`
  }
})
.then(res => res.json())
.then(data => {
  console.log("Tests count:", data.length);
  if(data.length > 0) {
    console.log("First 3 tests:", data.slice(0, 3));
  } else {
    console.log("No tests found. The INSERT must have failed or was rolled back.");
  }
})
.catch(err => console.error(err));
