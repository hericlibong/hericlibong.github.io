// Cloudflare Worker - Data Stories AI (Version V4 - Localhost Fix)

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  // CONFIGURATION CORS (Autorise tout pour le debug)
  const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type"
  };

  if (request.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  if (request.method !== 'POST') {
    return new Response(JSON.stringify({ success: false, error: 'Method not allowed' }), { 
      status: 405, headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    });
  }

  let body = null;

  try {
    try {
      body = await request.json();
    } catch (e) {
      throw new Error("Invalid JSON body.");
    }

    if (!body || !body.message) {
      throw new Error("Message is required.");
    }

    // --- CORRECTION CRITIQUE ICI ---
    // Si l'URL envoyée est 'localhost', on force l'URL GitHub publique
    let corpusUrl = body.corpusUrl;
    const PUBLIC_CORPUS_URL = 'https://hericlibong.github.io/assets/data/ai_corpus.json';

    if (!corpusUrl || corpusUrl.includes('localhost') || corpusUrl.includes('127.0.0.1')) {
      corpusUrl = PUBLIC_CORPUS_URL;
    }
    // -------------------------------

    // 3. Récupérer la mémoire (Corpus)
    const corpusResponse = await fetch(corpusUrl, {
      headers: { 'User-Agent': 'DataStories-Worker' }
    });

    if (!corpusResponse.ok) {
      throw new Error(`Impossible de lire le fichier corpus (Erreur ${corpusResponse.status}) sur GitHub.`);
    }

    const corpusText = await corpusResponse.text();
    let corpusData;
    try {
      corpusData = JSON.parse(corpusText);
    } catch (e) {
      throw new Error(`Le fichier corpus n'est pas un JSON valide. Vérifiez 'assets/data/ai_corpus.json'.`);
    }

    // 4. Interroger Mistral
    const apiKey = env.MISTRAL_API_KEY;
    if (!apiKey) throw new Error("Clé API Mistral manquante.");

    const systemPrompt = `Tu es l'assistant du portfolio Data Stories. Base-toi UNIQUEMENT sur ce contexte :\n${JSON.stringify(corpusData)}`;

    const mistralResponse = await fetch("https://api.mistral.ai/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${apiKey}`
      },
      body: JSON.stringify({
        model: "mistral-tiny",
        messages: [
          { role: "system", content: systemPrompt },
          { role: "user", content: body.message }
        ]
      })
    });

    const mistralData = await mistralResponse.json();

    if (!mistralResponse.ok) {
      throw new Error(`Erreur Mistral: ${mistralData.message || JSON.stringify(mistralData)}`);
    }

    // 5. SUCCÈS
    return new Response(JSON.stringify({
      success: true,
      response: mistralData.choices[0].message.content
    }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    });

  } catch (error) {
    return new Response(JSON.stringify({
      success: false,
      error: error.message,
      debug_step: 'worker_catch'
    }), {
      status: 200,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    });
  }
}

export default { fetch: handleRequest };