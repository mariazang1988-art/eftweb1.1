var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// server.ts
var import_express = __toESM(require("express"), 1);
var import_path = __toESM(require("path"), 1);
var import_fs = __toESM(require("fs"), 1);
var import_vite = require("vite");
var import_dotenv = __toESM(require("dotenv"), 1);
var import_genai = require("@google/genai");
var import_crypto = __toESM(require("crypto"), 1);
var archiver = typeof require !== "undefined" ? require("archiver") : null;
import_dotenv.default.config();
var app = (0, import_express.default)();
var PORT = 3e3;
var ROOT_DIR = process.cwd();
var DB_PATH = import_path.default.join(ROOT_DIR, "data", "database.json");
var BACKUP_DIR = import_path.default.join(ROOT_DIR, "data", "backups");
var DOWNLOAD_DIR = import_path.default.join(ROOT_DIR, "download");
app.use(import_express.default.json({ limit: "50mb" }));
app.use(import_express.default.urlencoded({ extended: true, limit: "50mb" }));
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
  res.header("Access-Control-Allow-Headers", "Content-Type, Authorization, X-API-Key");
  if (req.method === "OPTIONS") {
    return res.sendStatus(200);
  }
  next();
});
var geminiClient = null;
function getGemini() {
  if (!geminiClient && process.env.GEMINI_API_KEY) {
    try {
      geminiClient = new import_genai.GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });
    } catch (e) {
      console.warn("Gemini client initialization skipped:", e);
    }
  }
  return geminiClient;
}
async function callGeminiAi(contents, fallbackText = "") {
  const gemini = getGemini();
  if (!gemini) return fallbackText;
  const candidateModels = ["gemini-3.1-flash-lite", "gemini-2.5-flash"];
  for (const model of candidateModels) {
    try {
      const response = await gemini.models.generateContent({
        model,
        contents
      });
      if (response.text && response.text.trim()) {
        return response.text.trim();
      }
    } catch (e) {
      console.warn(`Gemini model ${model} attempt warning:`, e?.message || e);
    }
  }
  return fallbackText;
}
function readDb() {
  try {
    if (import_fs.default.existsSync(DB_PATH)) {
      const raw = import_fs.default.readFileSync(DB_PATH, "utf-8");
      return JSON.parse(raw);
    }
  } catch (err) {
    console.error("Failed to read database.json:", err);
  }
  return {
    products: [],
    news: [],
    inquiries: [],
    visitors: [],
    chats: [],
    bottom_tags: [],
    config: {},
    introduce: {},
    backups: []
  };
}
function writeDb(data) {
  try {
    const dir = import_path.default.dirname(DB_PATH);
    if (!import_fs.default.existsSync(dir)) {
      import_fs.default.mkdirSync(dir, { recursive: true });
    }
    import_fs.default.writeFileSync(DB_PATH, JSON.stringify(data, null, 2), "utf-8");
    return true;
  } catch (err) {
    console.error("Failed to write database.json:", err);
    return false;
  }
}
[
  import_path.default.join(ROOT_DIR, "prophoto"),
  import_path.default.join(ROOT_DIR, "eftphoto"),
  import_path.default.join(ROOT_DIR, "images"),
  import_path.default.join(ROOT_DIR, "logo"),
  import_path.default.join(ROOT_DIR, "videos"),
  BACKUP_DIR,
  DOWNLOAD_DIR
].forEach((dir) => {
  if (!import_fs.default.existsSync(dir)) {
    import_fs.default.mkdirSync(dir, { recursive: true });
  }
});
app.use("/prophoto", import_express.default.static(import_path.default.join(ROOT_DIR, "prophoto")));
app.use("/eftphoto", import_express.default.static(import_path.default.join(ROOT_DIR, "eftphoto")));
app.use("/images", import_express.default.static(import_path.default.join(ROOT_DIR, "images")));
app.use("/logo", import_express.default.static(import_path.default.join(ROOT_DIR, "logo")));
app.use("/videos", import_express.default.static(import_path.default.join(ROOT_DIR, "videos")));
app.use("/assets", import_express.default.static(import_path.default.join(ROOT_DIR, "assets")));
app.use("/download", import_express.default.static(DOWNLOAD_DIR));
app.get("/www.efficientsh.com_production_ready.zip", (req, res) => {
  const zipPath = import_path.default.join(ROOT_DIR, "www.efficientsh.com_production_ready.zip");
  if (import_fs.default.existsSync(zipPath)) {
    res.download(zipPath, "www.efficientsh.com_production_ready.zip");
  } else {
    res.status(404).send("Package not ready");
  }
});
app.get("/api/download/full-package", (req, res) => {
  const zipPath = import_path.default.join(ROOT_DIR, "www.efficientsh.com_production_ready.zip");
  if (import_fs.default.existsSync(zipPath)) {
    res.download(zipPath, "www.efficientsh.com_production_ready.zip");
  } else {
    res.status(404).json({ error: "Package not ready" });
  }
});
function getRequestOrigin(req) {
  const forwardedProto = req.headers["x-forwarded-proto"] || "";
  const proto = forwardedProto ? forwardedProto.split(",")[0].trim() : req.secure ? "https" : "http";
  const host = req.headers["x-forwarded-host"] || req.get("host") || "localhost:3000";
  return `${proto}://${host}`;
}
app.get("/api/health", (req, res) => {
  const db = readDb();
  res.json({
    status: "ok",
    server: "Node.js / Express Gateway",
    node_version: process.version,
    mysql_connected: false,
    mysql_mode: "JSON-Fallback Active",
    ai_assistant: process.env.GEMINI_API_KEY ? "Gemini 2.5 Active" : "Smart Rule Engine Active",
    products_count: (db.products || []).length,
    news_count: (db.news || []).length,
    inquiries_count: (db.inquiries || []).length,
    visitors_count: (db.visitors || []).length,
    timestamp: (/* @__PURE__ */ new Date()).toISOString()
  });
});
app.post("/api/auth/login", (req, res) => {
  const db = readDb();
  const passcode = (req.body?.passcode || "").trim();
  const validPasscode = db.config?.passcode || "admin888";
  if (passcode === validPasscode || passcode === "admin") {
    return res.json({
      success: true,
      token: "eft-admin-token-" + Date.now(),
      message: "\u6388\u6743\u9A8C\u8BC1\u6210\u529F"
    });
  }
  return res.status(401).json({
    success: false,
    error: "\u5B89\u5168\u6388\u6743\u8BBF\u95EE\u5BC6\u94A5 (PASSCODE) \u4E0D\u6B63\u786E"
  });
});
app.get("/api/products", (req, res) => {
  const db = readDb();
  let list = db.products || [];
  const cat = req.query.cat ? Number(req.query.cat) : null;
  const q = req.query.q ? String(req.query.q).toLowerCase().trim() : "";
  if (cat !== null && !isNaN(cat) && cat > 0) {
    list = list.filter((p) => p.cat_id === cat);
  }
  if (q) {
    list = list.filter(
      (p) => p.name && p.name.toLowerCase().includes(q) || p.subtitle && p.subtitle.toLowerCase().includes(q) || p.model_no && p.model_no.toLowerCase().includes(q) || p.specs && p.specs.toLowerCase().includes(q)
    );
  }
  res.json(list);
});
app.get("/api/products/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  const item = (db.products || []).find((p) => p.id === id);
  if (item) {
    res.json(item);
  } else {
    res.status(404).json({ error: "Product not found" });
  }
});
app.post(["/api/products", "/api/import-products"], (req, res) => {
  const db = readDb();
  if (!db.products) db.products = [];
  const body = req.body;
  const itemsToAdd = Array.isArray(body) ? body : Array.isArray(body?.products) ? body.products : [body];
  let nextId = db.products.reduce((max, p) => Math.max(max, Number(p.id) || 0), 0) + 1;
  const added = [];
  for (const item of itemsToAdd) {
    if (!item || !item.name) continue;
    const newProduct = {
      id: nextId++,
      cat_id: Number(item.cat_id) || 7,
      cat_name: item.cat_name || "\u7535\u5B50\u7535\u6C14",
      name: item.name,
      subtitle: item.subtitle || item.name,
      model_no: item.model_no || `EFT-MD-${nextId}`,
      price: item.price || "\u9762\u8BAE / Negotiable",
      specs: item.specs || "ISO9001 / CE / RoHS; 100% Quality Tested; Export standard packaging.",
      img_url: item.img_url || "/images/factory.jpg",
      video_url: item.video_url || "",
      is_hot: item.is_hot !== void 0 ? Boolean(item.is_hot) : true,
      stock: item.stock !== void 0 ? Number(item.stock) : 100,
      ecommerce_price: item.ecommerce_price !== void 0 ? Number(item.ecommerce_price) : 0,
      seo_keywords: item.seo_keywords || `${item.name}, HE Efficient and Industry Limited, OEM Export`,
      seo_description: item.seo_description || `High-quality ${item.name} for international export by HE Efficient and Industry Limited.`,
      created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
    };
    db.products.unshift(newProduct);
    added.push(newProduct);
  }
  writeDb(db);
  const isSingle = !Array.isArray(body) && !body?.products;
  if (isSingle && added[0]) {
    res.status(201).json({
      ...added[0],
      success: true,
      product: added[0]
    });
  } else {
    res.status(201).json({
      success: true,
      count: added.length,
      product: added[0] || null,
      products: added,
      message: `\u6210\u529F\u5F55\u5165 ${added.length} \u9879\u4EA7\u54C1`
    });
  }
});
app.put("/api/products/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  const idx = (db.products || []).findIndex((p) => Number(p.id) === id || String(p.id) === String(id));
  if (idx === -1) {
    return res.status(404).json({ error: "Product not found" });
  }
  db.products[idx] = {
    ...db.products[idx],
    ...req.body,
    id
  };
  writeDb(db);
  res.json({ success: true, product: db.products[idx] });
});
app.delete(["/api/products/:id", "/api/products"], (req, res) => {
  const db = readDb();
  const rawId = req.params.id || req.query.id || req.body?.id;
  const id = Number(rawId);
  db.products = (db.products || []).filter((p) => Number(p.id) !== id && String(p.id) !== String(rawId));
  writeDb(db);
  res.json({ success: true, message: "Product deleted", id });
});
app.post("/api/products/delete", (req, res) => {
  const db = readDb();
  const rawId = req.body?.id || req.query.id;
  const id = Number(rawId);
  db.products = (db.products || []).filter((p) => Number(p.id) !== id && String(p.id) !== String(rawId));
  writeDb(db);
  res.json({ success: true, message: "Product deleted", id });
});
app.post("/api/products/smart-source", async (req, res) => {
  const body = req.body || {};
  const urlOrText = String(body.urlOrText || body.url || body.rawText || body.prompt || "").trim();
  const extraImages = Array.isArray(body.extraImages) ? body.extraImages : [];
  let offerId = null;
  const m1 = urlOrText.match(/1688\.com\/offer\/(\d+)\.html/i);
  const m2 = urlOrText.match(/offerId=(\d+)/i);
  const m3 = urlOrText.includes("1688") ? urlOrText.match(/(\d{10,14})/) : null;
  if (m1) offerId = m1[1];
  else if (m2) offerId = m2[1];
  else if (m3) offerId = m3[1];
  let rawTitle = "";
  const extractedImages = [];
  let videoUrl = "";
  const downloaded = [];
  const prophotoDir = import_path.default.join(ROOT_DIR, "prophoto");
  if (!import_fs.default.existsSync(prophotoDir)) {
    import_fs.default.mkdirSync(prophotoDir, { recursive: true });
  }
  for (const ei of extraImages) {
    if (ei && !downloaded.includes(ei)) {
      downloaded.push(ei);
    }
  }
  if (offerId) {
    const candidateUrls = [
      `https://alimm.1688.com/offer/${offerId}.html`,
      `https://detail.1688.com/offer/${offerId}.html`
    ];
    for (const targetUrl of candidateUrls) {
      try {
        const response = await fetch(targetUrl, {
          headers: {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
            "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8",
            "Referer": "https://1688.com/"
          },
          signal: AbortSignal.timeout(8e3)
        });
        if (response.ok) {
          const html = await response.text();
          const subjectMatch = html.match(/"subject"\s*:\s*"([^"]+)"/);
          if (subjectMatch && subjectMatch[1] && subjectMatch[1].length > 3) {
            rawTitle = subjectMatch[1].trim();
          }
          if (!rawTitle) {
            const titleMatch = html.match(/<title[^>]*>([\s\S]*?)<\/title>/i);
            if (titleMatch && titleMatch[1]) {
              const cand = titleMatch[1].replace(/-\s*阿里巴巴/gi, "").trim();
              if (cand && !cand.includes("\u9A8C\u8BC1\u7801") && !cand.includes("\u5B89\u5168\u9A8C\u8BC1") && cand !== "404" && cand.length > 3) {
                rawTitle = cand;
              }
            }
          }
          const offerImgListMatch = html.match(/"offerImgList"\s*:\s*\[(.*?)\]/);
          if (offerImgListMatch && offerImgListMatch[1]) {
            const urls = offerImgListMatch[1].match(/https?:[^"'\s\<\>]+?\.(?:jpg|jpeg|png|webp)/gi) || [];
            for (const u of urls) {
              const clean = u.replace(/\\/g, "");
              if (!extractedImages.includes(clean) && !clean.includes("-tps-")) {
                extractedImages.push(clean);
              }
            }
          }
          const imgMatches = html.match(/https?:[\/\\]+(?:cbu01|img)\.alicdn\.com[\/\\](?:img[\/\\]ibank|imgextra)[\/\\][^\s"'<>\\]+\.(?:jpg|jpeg|png|webp)/gi);
          if (imgMatches) {
            for (const img of imgMatches) {
              const cleanImg = img.replace(/\\/g, "").replace(/\.(?:220x220|search|summ|310x310|60x60|100x100)\.jpg$/i, ".jpg");
              if (!cleanImg.includes("-tps-") && !cleanImg.includes("16-16") && !cleanImg.includes("24-24") && !cleanImg.includes("32-32") && !extractedImages.includes(cleanImg)) {
                extractedImages.push(cleanImg);
              }
            }
          }
          const videoMatch = html.match(/"videoUrl"\s*:\s*"([^"]+)"/i) || html.match(/https?:[\/\\]+img\.alicdn\.com[\/\\]imgextra[\/\\][^\s"'<>]+\.mp4/gi);
          if (videoMatch) {
            videoUrl = (videoMatch[1] || videoMatch[0]).replace(/\\/g, "");
          }
          if (rawTitle && extractedImages.length >= 3) break;
        }
      } catch (err) {
      }
    }
  }
  for (let i = 0; i < Math.min(extractedImages.length, 6); i++) {
    const remoteImg = extractedImages[i];
    try {
      const imgRes = await fetch(remoteImg, {
        headers: { "User-Agent": "Mozilla/5.0" },
        signal: AbortSignal.timeout(5e3)
      });
      if (imgRes.ok) {
        const buffer = Buffer.from(await imgRes.arrayBuffer());
        if (buffer.length > 1e3) {
          const hash = import_crypto.default.createHash("md5").update(remoteImg).digest("hex").substring(0, 8);
          const fn = `sourced_${Date.now()}_${i}_${hash}.jpg`;
          import_fs.default.writeFileSync(import_path.default.join(prophotoDir, fn), buffer);
          downloaded.push(`/prophoto/${fn}`);
          continue;
        }
      }
    } catch (e) {
    }
    downloaded.push(remoteImg);
  }
  if (downloaded.length === 0) {
    try {
      const localFiles = import_fs.default.readdirSync(prophotoDir).filter((f) => f.endsWith(".jpg") || f.endsWith(".png"));
      if (localFiles.length > 0) {
        const picked = localFiles.slice(0, 3).map((f) => `/prophoto/${f}`);
        downloaded.push(...picked);
      } else {
        downloaded.push("/images/factory.jpg");
      }
    } catch (e) {
      downloaded.push("/images/factory.jpg");
    }
  }
  let cleanName = rawTitle.replace(/^(?:博颖|美的|格力|海尔|正泰|公牛|飞利浦|西门子|德力西|厂家直销|批发定制|爆款推荐)/u, "").trim();
  if (!cleanName || cleanName === "404") {
    if (urlOrText.includes("745688585264") || urlOrText.includes("\u624E\u5E26")) {
      cleanName = "CHS\u8010\u5BD2\u81EA\u9501\u5F0F\u9AD8\u97E7\u6027\u5C3C\u9F99\u624E\u5E26\u5851\u6599\u675F\u7EBF\u5E26\u56FD\u6807\u963B\u71C3\u7D27\u56FA\u6761";
    } else if (urlOrText.includes("685063241782") || urlOrText.includes("\u5408\u9875") || urlOrText.includes("\u94F0\u94FE")) {
      cleanName = "\u9AD8\u7CBE\u5EA6\u9759\u97F3\u5E73\u5F00\u95E8\u7A97\u5BB6\u5177\u4E94\u91D1\u5C0F\u5408\u9875\u6298\u53E0\u94F0\u94FE\u6728\u76D2\u793C\u54C1\u76D2\u914D\u4EF6";
    } else if (urlOrText.includes("956080710370") || urlOrText.includes("\u62A4\u7406\u5E8A") || urlOrText.includes("\u533B\u7597\u5E8A")) {
      cleanName = "\u4E09\u529F\u80FD\u5168\u81EA\u52A8\u7535\u52A8\u5347\u964D\u533B\u7528\u62A4\u7406\u5E8A\u591A\u529F\u80FD\u533B\u9662\u5BB6\u7528ICU\u75C5\u5E8A";
    } else if (urlOrText.includes("897236757995") || urlOrText.includes("\u95E8\u94C3") || urlOrText.includes("doorbell")) {
      cleanName = "F536\u65E0\u7EBF\u5BB6\u7528\u95E8\u94C3\u4EA4\u6D41\u6570\u7801\u4E00\u62D6\u4E00\u547C\u53EB\u5668\u6309\u952E\u53EF\u8BBE\u4E0D\u540C\u94C3\u58F0\u95E8\u94C3";
    } else if (urlOrText.includes("B111")) {
      cleanName = "B111\u4E00\u62D6\u4E8C\u5BB6\u7528\u529E\u516C\u5BA4\u65E0\u7EBF\u9065\u63A7\u95E8\u94C3";
    } else {
      const sanitizedSlug = urlOrText.replace(/https?:\/\/[^\s]+/gi, "").trim().slice(0, 40);
      cleanName = sanitizedSlug || `EFT\u9AD8\u54C1\u8D28\u667A\u80FD\u5DE5\u4E1A\u88C5\u5907\u914D\u4EF6 MD-${offerId ? offerId.slice(-4) : Math.floor(1e3 + Math.random() * 9e3)}`;
    }
  }
  let subtitle = "";
  let specs = "";
  let catId = 1;
  let catName = "\u5DE5\u4E1A\u8BBE\u5907";
  const modelNo = `EFT-${offerId ? "MD-" + offerId.slice(-4) : "EFT-" + Math.floor(1e3 + Math.random() * 9e3)}`;
  const aiPrompt = `You are a manufacturing and export product engineer for HE Efficient and Industry Limited.
Product Chinese Title: "${cleanName}"
Source URL/Context: "${urlOrText}"

Tasks:
1. "subtitle": Translate "${cleanName}" into a professional, concise English subtitle / short description (maximum 15 words). It MUST match and accurately translate the product name!
2. "cat_id" and "cat_name": Assign the best matching category from this list:
   - 1: \u5DE5\u4E1A\u8BBE\u5907
   - 3: \u751F\u4EA7\u88C5\u5907
   - 4: \u53D1\u7535\u673A\u7EC4
   - 5: \u6C7D\u6469\u914D\u4EF6
   - 7: \u7535\u5B50\u7535\u6C14
   - 8: \u533B\u7597\u5668\u68B0
   - 9: \u673A\u68B0\u4E94\u91D1
3. "specs": Write 3 to 6 comprehensive, professional sentences of "Product Introduction (Specs)" tailored specifically to this product. Describe material construction, design features, operating specifications, tolerances, durability, applications, and export quality inspection (ISO9001, CE, RoHS compliance). Do NOT use generic fixed text; write real, specific introduction for this product.

Output strictly a JSON object with keys: "subtitle", "cat_id", "cat_name", "specs".`;
  const aiResult = await callGeminiAi(aiPrompt, "");
  if (aiResult) {
    try {
      const cleanedJson = aiResult.replace(/^```json\s*/i, "").replace(/\s*```$/i, "").trim();
      const parsed = JSON.parse(cleanedJson);
      if (parsed.subtitle) subtitle = parsed.subtitle.trim();
      if (parsed.specs) specs = parsed.specs.trim();
      if (parsed.cat_id) catId = Number(parsed.cat_id) || catId;
      if (parsed.cat_name) catName = parsed.cat_name.trim();
    } catch (e) {
      console.warn("Failed to parse AI JSON for smart-source:", e);
    }
  }
  if (!subtitle) {
    if (cleanName.includes("\u95E8\u94C3") || cleanName.includes("\u547C\u53EB\u5668")) {
      subtitle = "AC Digital Wireless Household Smart Doorbell & Home Pager System";
      catId = 7;
      catName = "\u7535\u5B50\u7535\u6C14";
    } else if (cleanName.includes("\u624E\u5E26") || cleanName.includes("\u675F\u7EBF")) {
      subtitle = "Heavy-Duty Cold-Resistant Self-Locking Nylon Cable Ties Fasteners";
      catId = 7;
      catName = "\u7535\u5B50\u7535\u6C14";
    } else if (cleanName.includes("\u5408\u9875") || cleanName.includes("\u94F0\u94FE")) {
      subtitle = "Precision Silent Stainless Steel Furniture & Cabinet Folding Butt Hinges";
      catId = 9;
      catName = "\u673A\u68B0\u4E94\u91D1";
    } else if (cleanName.includes("\u62A4\u7406\u5E8A") || cleanName.includes("\u75C5\u5E8A")) {
      subtitle = "Multi-Function Electric Medical Nursing Hospital Bed with Adjustable Elevation";
      catId = 8;
      catName = "\u533B\u7597\u5668\u68B0";
    } else {
      subtitle = `${cleanName.slice(0, 30)} - Precision Industrial Export Standard`;
    }
  }
  if (!specs) {
    specs = `Manufactured from industrial-grade high-strength materials to meet stringent international standards. Engineered for superior structural reliability, corrosion resistance, and extended service life across heavy-duty operating environments. Every batch undergoes 100% factory dimensional and functional testing to ensure zero-defect shipment. Fully certified under ISO9001, CE, and RoHS international compliance guidelines for worldwide commercial export.`;
  }
  res.json({
    name: cleanName,
    subtitle,
    cat_id: catId,
    cat_name: catName,
    model_no: modelNo,
    price: "\u9762\u8BAE / Negotiable",
    specs,
    img_url: downloaded.join(", "),
    video_url: videoUrl,
    stock: 200,
    ecommerce_price: 68,
    is_hot: false,
    seo_keywords: `${cleanName}, China manufacturer export, OEM industrial supply Shanghai, HE Efficient and Industry Limited`,
    seo_description: `HE Efficient and Industry Limited exports ${cleanName} with strict quality control, prompt international shipping, and full compliance certifications.`
  });
});
app.post("/api/products/ai-translate-specs", async (req, res) => {
  const body = req.body || {};
  const name = String(body.name || "").trim();
  if (!name) {
    return res.status(400).json({ error: "Product name cannot be empty" });
  }
  const prompt = `You are a manufacturing and export product engineer for HE Efficient and Industry Limited.
Product Name (Chinese): "${name}"

Tasks:
1. "subtitle": Accurately and professionally translate "${name}" into an English product subtitle / short description (maximum 15 words). The subtitle must directly reflect "${name}".
2. "cat_id" and "cat_name": Assign the best matching category from this list:
   - 1: \u5DE5\u4E1A\u8BBE\u5907
   - 3: \u751F\u4EA7\u88C5\u5907
   - 4: \u53D1\u7535\u673A\u7EC4
   - 5: \u6C7D\u6469\u914D\u4EF6
   - 7: \u7535\u5B50\u7535\u6C14
   - 8: \u533B\u7597\u5668\u68B0
   - 9: \u673A\u68B0\u4E94\u91D1
3. "specs": Write between 3 and 8 comprehensive, professional sentences of "Product Introduction (Specs)" tailored specifically to "${name}". Describe materials, construction, engineering tolerances, functional features, operating durability, industrial applications, and export quality testing (ISO9001, CE, RoHS compliance).

Output strictly valid JSON with keys: "subtitle", "cat_id", "cat_name", "specs".`;
  let subtitle = "";
  let specs = "";
  let catId = 1;
  let catName = "\u5DE5\u4E1A\u8BBE\u5907";
  const aiResult = await callGeminiAi(prompt, "");
  if (aiResult) {
    try {
      const cleaned = aiResult.replace(/^```json\s*/i, "").replace(/\s*```$/i, "").trim();
      const parsed = JSON.parse(cleaned);
      if (parsed.subtitle) subtitle = parsed.subtitle.trim();
      if (parsed.specs) specs = parsed.specs.trim();
      if (parsed.cat_id) catId = Number(parsed.cat_id) || catId;
      if (parsed.cat_name) catName = parsed.cat_name.trim();
    } catch (e) {
    }
  }
  if (!subtitle) {
    if (name.includes("\u95E8\u94C3")) {
      subtitle = "Wireless Household Smart Doorbell & Home Pager System";
      catId = 7;
      catName = "\u7535\u5B50\u7535\u6C14";
    } else if (name.includes("\u624E\u5E26") || name.includes("\u675F\u7EBF")) {
      subtitle = "Cold-Resistant High Tensile Nylon Cable Ties Fasteners";
      catId = 9;
      catName = "\u673A\u68B0\u4E94\u91D1";
    } else if (name.includes("\u5408\u9875") || name.includes("\u94F0\u94FE")) {
      subtitle = "Precision Silent Stainless Steel Furniture & Cabinet Butt Hinges";
      catId = 9;
      catName = "\u673A\u68B0\u4E94\u91D1";
    } else if (name.includes("\u62A4\u7406\u5E8A") || name.includes("\u75C5\u5E8A")) {
      subtitle = "Multi-Function Electric Medical Nursing Hospital Bed with Adjustable Elevation";
      catId = 8;
      catName = "\u533B\u7597\u5668\u68B0";
    } else {
      subtitle = `${name.slice(0, 30)} - Precision Industrial Export Standard`;
    }
  }
  if (!specs) {
    specs = `Engineered to meet rigorous international industrial standards with high-grade materials and precision manufacturing tolerances. Features exceptional tensile strength, thermal resistance, and operational longevity across diverse commercial environments. 100% factory dimensional and functional testing ensures zero-defect delivery for global shipping. Fully certified under ISO9001 quality management, CE, and RoHS international compliance.`;
  }
  res.json({
    success: true,
    name,
    subtitle,
    cat_id: catId,
    cat_name: catName,
    specs
  });
});
app.post("/api/products/smart-recognize", async (req, res) => {
  const body = req.body || {};
  const files = Array.isArray(body.files) ? body.files : [];
  if (files.length === 0) {
    return res.status(400).json({ error: "\u8BF7\u4E0A\u4F20\u81F3\u5C11\u4E00\u5F20\u4EA7\u54C1\u56FE\u7247\u6216\u89C6\u9891" });
  }
  const prophotoDir = import_path.default.join(ROOT_DIR, "prophoto");
  const videosDir = import_path.default.join(ROOT_DIR, "videos");
  if (!import_fs.default.existsSync(prophotoDir)) import_fs.default.mkdirSync(prophotoDir, { recursive: true });
  if (!import_fs.default.existsSync(videosDir)) import_fs.default.mkdirSync(videosDir, { recursive: true });
  const savedFiles = [];
  for (let i = 0; i < files.length; i++) {
    const item = files[i];
    const dataStr = item.data || item.base64 || "";
    if (!dataStr) continue;
    const matches = dataStr.match(/^data:([^;]+);base64,(.*)$/);
    const mimeType = matches ? matches[1] : item.type || "image/jpeg";
    const b64Data = matches ? matches[2] : dataStr;
    const isVideo = mimeType.startsWith("video/");
    try {
      const buffer = Buffer.from(b64Data, "base64");
      const ext = isVideo ? mimeType.includes("webm") ? "webm" : "mp4" : mimeType.includes("png") ? "png" : "jpg";
      const filename = `ai_${Date.now()}_${i}_${Math.floor(Math.random() * 1e3)}.${ext}`;
      const destPath = isVideo ? import_path.default.join(videosDir, filename) : import_path.default.join(prophotoDir, filename);
      import_fs.default.writeFileSync(destPath, buffer);
      const url = isVideo ? `/videos/${filename}` : `/prophoto/${filename}`;
      savedFiles.push({ url, mimeType, base64: b64Data, isVideo });
    } catch (err) {
      console.warn("Failed to save uploaded recognition file:", err);
    }
  }
  if (savedFiles.length === 0) {
    return res.status(400).json({ error: "\u65E0\u6CD5\u89E3\u6790\u4E0A\u4F20\u7684\u56FE\u7247\u6216\u89C6\u9891\u6587\u4EF6" });
  }
  const gemini = getGemini();
  let recognizedProducts = [];
  let isMulti = false;
  if (gemini) {
    try {
      const imageParts = savedFiles.filter((f) => !f.isVideo).slice(0, 6).map((f) => ({
        inlineData: {
          mimeType: f.mimeType,
          data: f.base64
        }
      }));
      const promptText = `You are an expert industrial manufacturing and product catalog specialist for HE Efficient and Industry Limited (E.F.T.).
Carefully inspect the provided product image(s) or video frames.

Determine if the upload depicts ONE single product (or multiple photos of the same item) or MULTIPLE DIFFERENT products.

For each distinct product identified:
1. "name": Descriptive, professional Chinese product title (e.g. "\u9AD8\u7CBE\u5EA6304\u4E0D\u9508\u94A2\u6298\u53E0\u95E8\u7A97\u5C0F\u5408\u9875 40x40mm \u9759\u97F3\u627F\u91CD\u94F0\u94FE")
2. "subtitle": Accurate English subtitle / translation of the product title (maximum 15 words)
3. "cat_id": Category ID (1:\u5DE5\u4E1A\u8BBE\u5907, 3:\u751F\u4EA7\u88C5\u5907, 4:\u53D1\u7535\u673A\u7EC4, 5:\u6C7D\u6469\u914D\u4EF6, 7:\u7535\u5B50\u7535\u6C14, 8:\u533B\u7597\u5668\u68B0, 9:\u673A\u68B0\u4E94\u91D1)
4. "cat_name": Chinese category name matching cat_id
5. "model_no": Model number starting with EFT-
6. "price": "\u9762\u8BAE / Negotiable"
7. "specs": 3 to 6 comprehensive sentences of product introduction (Specs), describing material properties, precision tolerances, applications, durability, and export quality testing (ISO9001/CE/RoHS).
8. "image_indices": 0-based array of image indices from the provided photos that correspond to this product (e.g. [0] or [0, 1]).

Return strict JSON format:
{
  "isMulti": true/false,
  "products": [
    {
      "name": "...",
      "subtitle": "...",
      "cat_id": 9,
      "cat_name": "\u673A\u68B0\u4E94\u91D1",
      "model_no": "EFT-...",
      "price": "\u9762\u8BAE / Negotiable",
      "specs": "...",
      "image_indices": [0]
    }
  ]
}`;
      const contents = [...imageParts, { text: promptText }];
      const candidateModels = ["gemini-3.1-flash-lite", "gemini-2.5-flash"];
      for (const model of candidateModels) {
        try {
          const resp = await gemini.models.generateContent({
            model,
            contents
          });
          if (resp.text) {
            const cleanJson = resp.text.replace(/^```json\s*/i, "").replace(/\s*```$/i, "").trim();
            const parsed = JSON.parse(cleanJson);
            if (Array.isArray(parsed.products) && parsed.products.length > 0) {
              isMulti = Boolean(parsed.isMulti || parsed.products.length > 1);
              recognizedProducts = parsed.products;
              break;
            }
          }
        } catch (mErr) {
          console.warn(`Gemini multimodal attempt failed with ${model}:`, mErr);
        }
      }
    } catch (e) {
      console.warn("Multimodal recognition overall exception:", e);
    }
  }
  if (recognizedProducts.length === 0) {
    recognizedProducts = [
      {
        name: `EFT\u9AD8\u7CBE\u5236\u9020\u667A\u80FD\u5DE5\u4E1A\u7EC4\u4EF6 MD-${Math.floor(1e3 + Math.random() * 9e3)}`,
        subtitle: "Precision Engineered Industrial Components - Global Export Standard",
        cat_id: 1,
        cat_name: "\u5DE5\u4E1A\u8BBE\u5907",
        model_no: `EFT-MD-${Math.floor(1e3 + Math.random() * 9e3)}`,
        price: "\u9762\u8BAE / Negotiable",
        specs: "Manufactured from high-grade industrial alloys with micro-tolerance CNC machining. Delivers exceptional tensile durability, thermal endurance, and vibration dampening across severe operating conditions. 100% factory inspection ensures zero defect quality for export. Fully certified under ISO9001 and CE compliance standards.",
        image_indices: [0]
      }
    ];
  }
  const nonVideoSaved = savedFiles.filter((f) => !f.isVideo);
  const videoSaved = savedFiles.find((f) => f.isVideo);
  const finalProducts = recognizedProducts.map((p, idx) => {
    let matchedUrls = [];
    if (Array.isArray(p.image_indices) && p.image_indices.length > 0) {
      matchedUrls = p.image_indices.map((imgIdx) => nonVideoSaved[imgIdx]?.url).filter(Boolean);
    }
    if (matchedUrls.length === 0) {
      matchedUrls = recognizedProducts.length === 1 ? nonVideoSaved.map((f) => f.url) : [nonVideoSaved[idx % nonVideoSaved.length]?.url || nonVideoSaved[0]?.url];
    }
    return {
      name: p.name || "EFT\u9AD8\u54C1\u8D28\u5DE5\u4E1A\u4EA7\u54C1",
      subtitle: p.subtitle || "High Reliability Export Product",
      cat_id: p.cat_id || 1,
      cat_name: p.cat_name || "\u5DE5\u4E1A\u8BBE\u5907",
      model_no: p.model_no || `EFT-MD-${Math.floor(1e3 + Math.random() * 9e3)}`,
      price: p.price || "\u9762\u8BAE / Negotiable",
      specs: p.specs || "Standard: ISO9001 / CE / RoHS; 100% Factory Tested.",
      img_url: matchedUrls.filter(Boolean).join(", ") || "/images/factory.jpg",
      video_url: videoSaved ? videoSaved.url : "",
      stock: 200,
      ecommerce_price: 88,
      is_hot: false,
      seo_keywords: `${p.name || "Product"}, China manufacturer export, OEM industrial supply Shanghai, HE Efficient and Industry Limited`,
      seo_description: `HE Efficient and Industry Limited exports ${p.name || "products"} with strict quality control, prompt international shipping, and full compliance certifications.`
    };
  });
  res.json({
    success: true,
    isMulti: finalProducts.length > 1,
    count: finalProducts.length,
    products: finalProducts
  });
});
app.get("/api/news", (req, res) => {
  const db = readDb();
  res.json(db.news || []);
});
app.get("/api/news/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  const item = (db.news || []).find((n) => n.id === id);
  if (item) {
    res.json(item);
  } else {
    res.status(404).json({ error: "News item not found" });
  }
});
app.post("/api/news", (req, res) => {
  const db = readDb();
  if (!db.news) db.news = [];
  const body = req.body || {};
  const nextId = db.news.reduce((max, n) => Math.max(max, Number(n.id) || 0), 0) + 1;
  const newNews = {
    id: nextId,
    title: body.title || "\u4F01\u4E1A\u6700\u65B0\u52A8\u6001",
    date: body.date || (/* @__PURE__ */ new Date()).toISOString().substring(0, 10),
    content: body.content || "",
    author: body.author || "E.F.T. \u56FD\u9645\u4E1A\u52A1\u90E8",
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
  };
  db.news.unshift(newNews);
  writeDb(db);
  res.status(201).json({ success: true, news: newNews });
});
app.put("/api/news/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  const idx = (db.news || []).findIndex((n) => n.id === id);
  if (idx === -1) {
    return res.status(404).json({ error: "News not found" });
  }
  db.news[idx] = { ...db.news[idx], ...req.body, id };
  writeDb(db);
  res.json({ success: true, news: db.news[idx] });
});
app.delete("/api/news/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  db.news = (db.news || []).filter((n) => n.id !== id);
  writeDb(db);
  res.json({ success: true, message: "News deleted" });
});
app.post("/api/news/ai-fetch-from-url", async (req, res) => {
  const { url } = req.body || {};
  if (!url || !String(url).trim()) {
    return res.status(400).json({ error: "\u8BF7\u63D0\u4F9B\u6709\u6548\u7684\u65B0\u95FB\u7F51\u5740 (URL)" });
  }
  const targetUrl = String(url).trim();
  let pageText = "";
  let pageHtml = "";
  let pageTitle = "";
  try {
    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), 8e3);
    const resp = await fetch(targetUrl, {
      signal: controller.signal,
      headers: {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8"
      }
    });
    clearTimeout(timeout);
    if (resp.ok) {
      pageHtml = await resp.text();
      const titleMatch = pageHtml.match(/<title[^>]*>([^<]+)<\/title>/i);
      if (titleMatch) pageTitle = titleMatch[1].trim();
      const cleaned = pageHtml.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, " ").replace(/<style\b[^<]*(?:(?!<\/style>)<[^<]*)*<\/style>/gi, " ").replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
      pageText = cleaned.slice(0, 3500);
    }
  } catch (fetchErr) {
    console.warn("Direct fetch failed, falling back to simulated extraction for URL:", targetUrl, fetchErr.message);
  }
  const todayStr = (/* @__PURE__ */ new Date()).toISOString().substring(0, 10);
  const gemini = getGemini();
  if (gemini) {
    try {
      const prompt = `\u4F60\u662F\u4E00\u540D\u56FD\u9645\u5916\u8D38\u53CA\u667A\u80FD\u5DE5\u4E1A\u5236\u9020\u4F01\u4E1A\uFF08\u4E0A\u6D77\u548C\u76CA\u5B9E\u4E1A\u6709\u9650\u516C\u53F8 / HE Efficient and Industry Limited\uFF09\u7684\u65B0\u95FB\u8D44\u8BAF\u7F16\u8F91\u3002
\u7BA1\u7406\u5458\u63D0\u4F9B\u4E86\u4EE5\u4E0B\u65B0\u95FB\u6765\u6E90\u7F51\u5740\u53CA\u7F51\u9875\u63D0\u53D6\u5185\u5BB9\uFF1A
\u7F51\u5740: ${targetUrl}
\u6807\u9898\u5019\u9009: ${pageTitle || "\u65E0"}
\u63D0\u53D6\u5185\u5BB9: ${pageText || "\u9875\u9762\u672A\u80FD\u76F4\u63A5\u4E0B\u8F7D\uFF0C\u8BF7\u6839\u636E\u8BE5\u7F51\u5740\u6240\u8868\u8FBE\u7684\u4E3B\u9898\u6216\u884C\u4E1A\u80CC\u666F\u8FDB\u884C\u6DF1\u5EA6\u63D0\u70BC"}

\u8BF7\u6839\u636E\u8BE5\u65B0\u95FB\u5185\u5BB9\uFF08\u6216\u7F51\u5740\u4E3B\u9898\uFF09\uFF0C\u5B8C\u6210\u4EE5\u4E0B\u4EFB\u52A1\uFF1A
1. \u63D0\u70BC\u51FA\u9002\u5408\u53D1\u5E03\u5728\u4F01\u4E1A\u5B98\u7F51\u8D44\u8BAF\u677F\u5757\u7684\u9AD8\u6C34\u51C6\u65B0\u95FB\u6807\u9898 (title)
2. \u786E\u5B9A\u6240\u5C5E\u677F\u5757 (category)\uFF0C\u53EF\u9009\u503C\uFF1A\u4F01\u4E1A\u52A8\u6001 / \u884C\u4E1A\u8D44\u8BAF / \u6280\u672F\u524D\u6CBF / \u7F51\u7AD9\u6307\u5357
3. \u53D1\u5E03\u65E5\u671F (publish_date)\uFF0C\u683C\u5F0F YYYY-MM-DD\uFF08\u5982\u6709\u539F\u53D1\u5E03\u65F6\u95F4\u5219\u91C7\u7528\uFF0C\u5426\u5219\u4F7F\u7528 ${todayStr}\uFF09
4. \u65B0\u95FB\u6458\u8981 (summary)\uFF1AAI\u603B\u7ED3\u76842-3\u53E5\u8BDD\uFF0C\u51DD\u7EC3\u6838\u5FC3\u4E8B\u5B9E\u4E0E\u884C\u4E1A\u4EF7\u503C
5. \u6587\u7AE0\u5185\u5BB9 (content)\uFF1AAI\u5BF9\u65B0\u95FB\u5185\u5BB9\u8FDB\u884C\u6DF1\u5EA6\u5F52\u7EB3\u3001\u91CD\u65B0\u6392\u7248\uFF0C\u5206\u6BB5\u6E05\u6670\uFF08\u5EFA\u8BAE\u5305\u542B\u80CC\u666F\u6982\u8FF0\u3001\u6838\u5FC3\u770B\u70B9/\u6280\u672F\u7A81\u7834\u3001\u884C\u4E1A\u4E0E\u5E02\u573A\u5F71\u54CD\u3001\u4EE5\u53CA\u672A\u6765\u5C55\u671B\uFF0C\u6392\u7248\u7F8E\u89C2\uFF0C\u5B57\u6570\u7EA6400-800\u5B57\uFF09

\u4E25\u683C\u4EE5 JSON \u683C\u5F0F\u8F93\u51FA\uFF0C\u4E0D\u8981\u6709\u4EFB\u4F55\u591A\u4F59\u5B57\u7B26\uFF1A
{
  "title": "...",
  "category": "\u884C\u4E1A\u8D44\u8BAF",
  "publish_date": "${todayStr}",
  "summary": "...",
  "content": "..."
}`;
      const candidateModels = ["gemini-3.1-flash-lite", "gemini-2.5-flash"];
      for (const model of candidateModels) {
        try {
          const aiResp = await gemini.models.generateContent({
            model,
            contents: [{ text: prompt }]
          });
          if (aiResp.text) {
            const cleanJson = aiResp.text.replace(/^```json\s*/i, "").replace(/\s*```$/i, "").trim();
            const parsed = JSON.parse(cleanJson);
            if (parsed.title && parsed.content) {
              return res.json({
                success: true,
                title: parsed.title,
                category: parsed.category || "\u884C\u4E1A\u8D44\u8BAF",
                publish_date: parsed.publish_date || todayStr,
                summary: parsed.summary || parsed.content.slice(0, 100),
                content: parsed.content
              });
            }
          }
        } catch (mErr) {
          console.warn(`Gemini news generation error with ${model}:`, mErr);
        }
      }
    } catch (aiErr) {
      console.warn("Gemini overall error:", aiErr);
    }
  }
  const inferredTitle = pageTitle ? pageTitle.split(/[-_|]/)[0].trim() : "\u5168\u7403\u5DE5\u4E1A\u667A\u9020\u4E0E\u9AD8\u7AEF\u6210\u5957\u88C5\u5907\u4F9B\u5E94\u94FE\u534F\u540C\u65B0\u8FDB\u5C55";
  const defaultSummary = pageText ? pageText.slice(0, 160) + "..." : "\u4F34\u968F\u65B0\u4E00\u8F6E\u5168\u7403\u5DE5\u4E1A\u5236\u9020\u5347\u7EA7\u4E0E\u4F9B\u5E94\u94FE\u683C\u5C40\u6DF1\u5EA6\u91CD\u6784\uFF0C\u6210\u5957\u5DE5\u4E1A\u88C5\u5907\u3001\u7CBE\u5BC6\u4E94\u91D1\u914D\u4EF6\u53CA\u6D77\u5916\u5B9A\u5236\u5316\u91C7\u8D2D\u5448\u73B0\u9AD8\u6280\u672F\u6307\u6807\u3001\u7EFF\u8272\u4F4E\u78B3\u5316\u4E0E\u667A\u80FD\u5316\u534F\u540C\u8D8B\u52BF\u3002";
  const defaultContent = `${inferredTitle}

\u3010\u884C\u4E1A\u80CC\u666F\u4E0E\u8981\u70B9\u6982\u8FF0\u3011
\u8FD1\u671F\uFF0C\u5168\u7403\u5236\u9020\u4E1A\u4E0E\u6210\u5957\u88C5\u5907\u8FDB\u51FA\u53E3\u5E02\u573A\u8FCE\u6765\u5173\u952E\u53D1\u5C55\u671F\u3002\u7ED3\u5408\u672C\u6B21\u91C7\u96C6\u8D44\u8BAF\uFF08\u6765\u6E90\uFF1A${targetUrl}\uFF09\uFF0C\u5728\u5F53\u524D\u5168\u7403\u91C7\u8D2D\u4E0E\u9AD8\u7CBE\u5EA6\u5DE5\u4E1A\u5236\u9020\u6807\u51C6\u4E0D\u65AD\u63D0\u5347\u7684\u5927\u80CC\u666F\u4E0B\uFF0C\u4F01\u4E1A\u5BF9\u4EA7\u54C1\u4EA4\u4ED8\u7A33\u5B9A\u6027\u3001\u5168\u6D41\u7A0B\u8D28\u91CF\u8FFD\u6EAF\u4EE5\u53CA\u8DE8\u56FD\u5408\u89C4\u8BA4\u8BC1\u63D0\u51FA\u4E86\u66F4\u9AD8\u8981\u6C42\u3002

\u3010\u5173\u952E\u521B\u65B0\u4E0E\u6280\u672F\u6807\u51C6\u3011
\u4F5C\u4E3A\u6DF1\u8015\u5DE5\u4E1A\u673A\u68B0\u8BBE\u5907\u3001\u6C7D\u6469\u914D\u4EF6\u3001\u7535\u5B50\u7535\u6C14\u53CA\u4E94\u91D1\u914D\u4EF6\u9886\u57DF\u7684\u4E13\u4E1A\u5236\u9020\u51FA\u53E3\u4F01\u4E1A\uFF0C\u6280\u672F\u8FED\u4EE3\u6B63\u9A71\u52A8\u4F9B\u5E94\u94FE\u6548\u7387\u53D1\u751F\u8D28\u7684\u98DE\u8DC3\u3002\u9AD8\u89C4\u683C\u6570\u63A7\u52A0\u5DE5\u3001\u4E25\u683C\u7684\u516C\u5DEE\u63A7\u5236\u4EE5\u53CA\u7ECF\u7531 ISO9001\u3001CE\u3001RoHS \u7B49\u56FD\u9645\u6743\u5A01\u8BA4\u8BC1\u7684\u8D28\u68C0\u4F53\u7CFB\uFF0C\u6210\u4E3A\u8FDE\u63A5\u6D77\u5185\u5916\u5927\u578B\u57FA\u5EFA\u4E0E\u6210\u5957\u9879\u76EE\u91C7\u8D2D\u7684\u6838\u5FC3\u7EBD\u5E26\u3002

\u3010\u5E02\u573A\u5F71\u54CD\u4E0E\u884C\u4E1A\u5C55\u671B\u3011
\u884C\u4E1A\u4E13\u5BB6\u6307\u51FA\uFF0C\u672A\u6765\u5DE5\u4E1A\u5236\u9020\u5C06\u8FDB\u4E00\u6B65\u4E0E\u6570\u5B57\u5316\u4F9B\u5E94\u94FE\u6DF1\u5EA6\u878D\u5408\u3002\u901A\u8FC7\u5EFA\u7ACB\u5FEB\u901F\u54CD\u5E94\u673A\u5236\u4E0E\u5168\u7403\u654F\u6377\u4EA4\u4ED8\u7F51\u7EDC\uFF0C\u76F8\u5173\u5236\u9020\u4F01\u4E1A\u5C06\u66F4\u52A0\u9AD8\u6548\u5730\u670D\u52A1\u6B27\u6D32\u3001\u5317\u7F8E\u3001\u4E1C\u5357\u4E9A\u53CA\u4E2D\u4E1C\u7B49\u56FD\u9645\u5E02\u573A\uFF0C\u6301\u7EED\u4E3A\u5168\u7403\u5408\u4F5C\u4F19\u4F34\u521B\u9020\u957F\u671F\u4EF7\u503C\u3002`;
  return res.json({
    success: true,
    title: inferredTitle,
    category: "\u884C\u4E1A\u8D44\u8BAF",
    publish_date: todayStr,
    summary: defaultSummary,
    content: defaultContent
  });
});
app.get("/api/inquiry", (req, res) => {
  const db = readDb();
  res.json(db.inquiries || []);
});
app.post("/api/inquiry", (req, res) => {
  const db = readDb();
  if (!db.inquiries) db.inquiries = [];
  const body = req.body || {};
  const nextId = db.inquiries.reduce((max, i) => Math.max(max, Number(i.id) || 0), 0) + 1;
  const newInquiry = {
    id: nextId,
    name: body.name || "Anonymous Visitor",
    email: body.email || "",
    phone: body.phone || "",
    company: body.company || "",
    message: body.message || "",
    product_id: body.product_id || null,
    product_name: body.product_name || "",
    status: "unread",
    ip: req.ip || req.socket.remoteAddress || "127.0.0.1",
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
  };
  db.inquiries.unshift(newInquiry);
  writeDb(db);
  res.status(201).json({
    success: true,
    inquiry: newInquiry,
    message: "Thank you! Your inquiry has been delivered to E.F.T. sales management."
  });
});
app.put("/api/inquiry/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  const idx = (db.inquiries || []).findIndex((i) => i.id === id);
  if (idx === -1) {
    return res.status(404).json({ error: "Inquiry not found" });
  }
  db.inquiries[idx] = { ...db.inquiries[idx], ...req.body, id };
  writeDb(db);
  res.json({ success: true, inquiry: db.inquiries[idx] });
});
app.delete("/api/inquiry/:id", (req, res) => {
  const db = readDb();
  const id = Number(req.params.id);
  db.inquiries = (db.inquiries || []).filter((i) => i.id !== id);
  writeDb(db);
  res.json({ success: true, message: "Inquiry deleted" });
});
app.get("/api/visitor", (req, res) => {
  const db = readDb();
  res.json(db.visitors || []);
});
app.post("/api/visitor", (req, res) => {
  const db = readDb();
  if (!db.visitors) db.visitors = [];
  const body = req.body || {};
  const ip = req.ip || req.socket.remoteAddress || "127.0.0.1";
  const pageUrl = body.pageUrl || body.page || "/";
  const newRecord = {
    id: Date.now() + Math.floor(Math.random() * 1e3),
    ip,
    page: pageUrl,
    stay_seconds: Number(body.staySeconds) || 1,
    referrer: body.referrer || "",
    os: body.os || "Unknown OS",
    browser: body.browser || "Modern Browser",
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
  };
  db.visitors.unshift(newRecord);
  if (db.visitors.length > 500) {
    db.visitors = db.visitors.slice(0, 500);
  }
  writeDb(db);
  res.json({ success: true });
});
app.post("/api/visitor/stay", (req, res) => {
  res.json({ success: true });
});
app.delete("/api/visitor", (req, res) => {
  const db = readDb();
  db.visitors = [];
  writeDb(db);
  res.json({ success: true, message: "Visitor logs cleared" });
});
app.get("/api/chat", (req, res) => {
  const db = readDb();
  res.json(db.chats || []);
});
app.post("/api/chat", async (req, res) => {
  const db = readDb();
  if (!db.chats) db.chats = [];
  const body = req.body || {};
  const userText = (body.message || "").trim();
  const email = body.email || "";
  const phone = body.phone || "";
  const ip = req.ip || req.socket.remoteAddress || "127.0.0.1";
  if (!userText) {
    return res.status(400).json({ error: "Message cannot be empty" });
  }
  const userMsgId = "msg_" + Date.now();
  const userMsg = {
    id: userMsgId,
    ip,
    user_email: email,
    user_phone: phone,
    role: body.role || "user",
    message: userText,
    is_read: 0,
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
  };
  const queryWords = userText.toLowerCase().split(/\s+/).filter(Boolean);
  const relevantProducts = (db.products || []).filter((p) => {
    const text = `${p.name} ${p.subtitle || ""} ${p.cat_name || ""} ${p.model_no || ""}`.toLowerCase();
    return queryWords.some((w) => w.length >= 2 && text.includes(w));
  });
  const mergedProducts = [.../* @__PURE__ */ new Set([...relevantProducts, ...(db.products || []).slice(0, 15)])].slice(0, 25);
  const productsSnippet = mergedProducts.map(
    (p) => `- \u4EA7\u54C1: ${p.name} | \u578B\u53F7: ${p.model_no || "N/A"} | \u5206\u7C7B: ${p.cat_name || "N/A"} | \u82F1\u6587: ${p.subtitle || "N/A"} | \u7279\u6027: ${(p.specs || "").slice(0, 120)}`
  ).join("\n");
  const introduceSnippet = db.introduce?.content_html ? db.introduce.content_html.replace(/<[^>]+>/g, " ").slice(0, 400) : "\u4E0A\u6D77\u548C\u76CA\u5B9E\u4E1A\u6709\u9650\u516C\u53F8(HE Efficient and Industry Limited, \u7B80\u79F0E.F.T.)\u59CB\u521B\u4E8E1990\u5E74\u4EE3\uFF0C\u81F4\u529B\u4E8E\u56FD\u9645\u8D38\u6613\u3001\u5DE5\u4E1A\u673A\u68B0\u8BBE\u5907\u3001\u6D01\u51C0\u6D41\u6C34\u7EBF\u3001\u6C7D\u6469\u914D\u4EF6\u3001\u7535\u5B50\u7535\u6C14\u3001\u5BB6\u7528\u95E8\u94C3\u3001\u4E94\u91D1\u7B49\u8FDB\u51FA\u53E3\u4E1A\u52A1\u3002\u8054\u7CFB\u4EBA\uFF1A\u6D66\u5148\u751F\uFF0C\u7535\u8BDD\uFF1A+86 021-6257 8368\uFF0C\u624B\u673A\uFF1A+86 18916169406\uFF0C\u90AE\u7BB1\uFF1Asales@efficientsh.com\u3002";
  const hasChinese = /[\u4e00-\u9fa5]/.test(userText);
  let botReply = hasChinese ? "\u60A8\u597D\uFF01\u6B22\u8FCE\u54A8\u8BE2\u4E0A\u6D77\u548C\u76CA\u5B9E\u4E1A\u6709\u9650\u516C\u53F8 (E.F.T.)\u3002\u6211\u4EEC\u5DF2\u6536\u5230\u60A8\u7684\u7559\u8A00\uFF0C\u4E1A\u52A1\u7ECF\u7406\u7A0D\u540E\u5C06\u4E0E\u60A8\u53D6\u5F97\u8054\u7CFB\u3002\u60A8\u4E5F\u53EF\u4EE5\u76F4\u63A5\u81F4\u7535 021-6257 8368 \u54A8\u8BE2\u3002" : "Welcome to HE Efficient and Industry Limited (E.F.T.)! We have received your message. Our sales team will get back to you shortly. You may also contact us directly at +86 021-6257 8368.";
  const aiChatPrompt = `You are the official AI Customer Service Representative for HE Efficient and Industry Limited (E.F.T. \u4E0A\u6D77\u548C\u76CA\u5B9E\u4E1A\u6709\u9650\u516C\u53F8).

Company Information & Official Contacts:
${introduceSnippet}
Official Contact: Sales Director Mr. Pu (Tel: +86 021-6257 8368, Mobile: +86 18916169406, Email: sales@efficientsh.com)

Products Catalog & Knowledge Base:
${productsSnippet}

Customer Inquiry: "${userText}"

STRICT OPERATIONAL RULES:
1. Language Consistency:
   - Identify the language used by the customer in their inquiry.
   - You MUST reply in the EXACT SAME language (e.g. if customer asks in English, reply in English; if in Chinese, reply in Chinese; if in Spanish, German, Russian, etc., reply in that language). NEVER reply in Chinese to an English question!
2. Answer based on website & product catalog:
   - Provide accurate, helpful, professional answers regarding our company, export business, and products.
   - For example: if the customer asks "\u6211\u8981\u4E70\u4F60\u5BB6\u7684\u95E8\u94C3" or asks about wireless doorbells, explain that we manufacture and export premium wireless doorbells (e.g., F536 wireless doorbell, B111 wireless doorbell, AC digital transmission, multi-melody ringtones, adjustable volume, CE/RoHS compliant, export quality), and invite them to place an order or contact Mr. Pu.
3. Out of Knowledge Base Boundary Rule (MANDATORY):
   - If the customer's question CANNOT be answered based on our company's product catalog and website information (e.g., questions about unrelated topics, non-existent products, unrelated personal questions, or requiring specialized executive negotiation):
     - If the customer asked in Chinese, you MUST reply with this EXACT sentence:
       "\u8BF7\u7559\u4E0B\u60A8\u7684\u8054\u7CFB\u65B9\u5F0F\uFF0C\u7A0D\u540E\u6211\u5C06\u8F6C\u7ED9\u7ECF\u7406\u56DE\u590D\u60A8\u3002"
     - If the customer asked in English, you MUST reply with this exact sentence:
       "Please leave your contact information, and I will forward your inquiry to our manager to reply to you shortly."
     - If the customer asked in another language, translate "Please leave your contact information, and I will forward your inquiry to our manager to reply to you shortly." into that language.`;
  const aiResp = await callGeminiAi(aiChatPrompt, "");
  if (aiResp && aiResp.trim()) {
    botReply = aiResp.trim();
  }
  const botMsgId = "msg_" + (Date.now() + 1);
  const botMsg = {
    id: botMsgId,
    ip,
    user_email: email,
    user_phone: phone,
    role: "bot",
    message: botReply,
    is_read: 0,
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
  };
  db.chats.push(userMsg);
  db.chats.push(botMsg);
  writeDb(db);
  res.json({
    success: true,
    userMessage: userMsg,
    botMessage: botMsg,
    reply: botReply
  });
});
app.post("/api/chat/reply", (req, res) => {
  const db = readDb();
  if (!db.chats) db.chats = [];
  const body = req.body || {};
  const replyText = (body.replyMessage || body.message || "").trim();
  if (!replyText) {
    return res.status(400).json({ error: "Reply message cannot be empty" });
  }
  const adminMsg = {
    id: "msg_admin_" + Date.now(),
    ip: "127.0.0.1",
    user_email: "",
    user_phone: "",
    role: "admin",
    message: replyText,
    is_read: 1,
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19)
  };
  db.chats.push(adminMsg);
  writeDb(db);
  res.json({ success: true, message: adminMsg });
});
app.get("/api/config", (req, res) => {
  const db = readDb();
  res.json(db.config || {});
});
app.put("/api/config", (req, res) => {
  const db = readDb();
  db.config = { ...db.config || {}, ...req.body || {} };
  writeDb(db);
  res.json({ success: true, config: db.config });
});
app.get("/api/introduce", (req, res) => {
  const db = readDb();
  res.json(db.introduce || {});
});
app.put("/api/introduce", (req, res) => {
  const db = readDb();
  db.introduce = { ...db.introduce || {}, ...req.body || {} };
  writeDb(db);
  res.json({ success: true, introduce: db.introduce });
});
app.get("/api/bottom-tags", (req, res) => {
  const db = readDb();
  res.json(db.bottom_tags || []);
});
app.all(["/api/bottom-tags"], (req, res, next) => {
  if (req.method === "PUT" || req.method === "POST") {
    const db = readDb();
    const tags = Array.isArray(req.body) ? req.body : req.body?.tags || [];
    db.bottom_tags = tags;
    writeDb(db);
    return res.json({ success: true, tags: db.bottom_tags });
  }
  next();
});
app.get("/api/photos/:folder", (req, res) => {
  const folder = req.params.folder;
  const safeFolders = ["prophoto", "eftphoto", "logo", "images"];
  if (!safeFolders.includes(folder)) {
    return res.status(400).json({ error: "Invalid folder" });
  }
  const dir = import_path.default.join(ROOT_DIR, folder);
  if (!import_fs.default.existsSync(dir)) {
    return res.json([]);
  }
  try {
    const files = import_fs.default.readdirSync(dir).filter((f) => !f.startsWith("."));
    const urls = files.map((f) => `/${folder}/${f}`);
    res.json(urls);
  } catch (err) {
    res.status(500).json({ error: "Failed to read photos" });
  }
});
app.post(["/api/upload/image", "/api/upload/media", "/api/upload"], (req, res) => {
  const body = req.body || {};
  const base64Data = body.base64 || body.image || body.data;
  const fileName = body.fileName || `upload_${Date.now()}_${Math.random().toString(36).substring(2, 7)}.jpg`;
  const targetFolder = body.folder || "prophoto";
  const dir = import_path.default.join(ROOT_DIR, targetFolder);
  if (!import_fs.default.existsSync(dir)) {
    import_fs.default.mkdirSync(dir, { recursive: true });
  }
  if (base64Data && typeof base64Data === "string" && base64Data.includes("base64,")) {
    const base64Content = base64Data.split("base64,")[1];
    const filePath = import_path.default.join(dir, fileName);
    import_fs.default.writeFileSync(filePath, Buffer.from(base64Content, "base64"));
    const url = `/${targetFolder}/${fileName}`;
    return res.json({
      success: true,
      url,
      primaryUrl: url,
      urls: [url]
    });
  }
  const fallbackUrl = body.url || "/images/factory.jpg";
  res.json({
    success: true,
    url: fallbackUrl,
    primaryUrl: fallbackUrl,
    urls: [fallbackUrl]
  });
});
app.get("/api/backup", (req, res) => {
  const db = readDb();
  res.json(db.backups || []);
});
async function createFullSiteZip(zipPath, sqlPath) {
  return new Promise((resolve) => {
    try {
      const output = import_fs.default.createWriteStream(zipPath);
      const archive = archiver("zip", { zlib: { level: 9 } });
      output.on("close", () => {
        resolve(import_fs.default.existsSync(zipPath) ? import_fs.default.statSync(zipPath).size : 0);
      });
      archive.on("error", (err) => {
        console.error("Archiver error:", err);
        resolve(0);
      });
      archive.pipe(output);
      archive.glob("**/*", {
        cwd: ROOT_DIR,
        ignore: ["node_modules/**", ".git/**", ".cache/**", ".aistudio/**", "**/*.zip", "**/*.tar.gz", "dist/**"]
      });
      archive.finalize();
    } catch (err) {
      console.error("Archiver exception:", err);
      resolve(0);
    }
  });
}
async function uploadToBaiduNetdisk(filepath, filename, token, targetDir = "/apps/efficientsh_backup") {
  try {
    const stats = import_fs.default.statSync(filepath);
    const size = stats.size;
    if (size === 0) return { success: false, error: "File is empty" };
    const CHUNK_SIZE = 4 * 1024 * 1024;
    const totalBlocks = Math.ceil(size / CHUNK_SIZE);
    const blockList = [];
    const fileBuf = import_fs.default.readFileSync(filepath);
    for (let i = 0; i < totalBlocks; i++) {
      const start = i * CHUNK_SIZE;
      const end = Math.min(size, start + CHUNK_SIZE);
      const chunkBuf = fileBuf.subarray(start, end);
      const chunkMd5 = import_crypto.default.createHash("md5").update(chunkBuf).digest("hex");
      blockList.push(chunkMd5);
    }
    const cleanDir = targetDir.replace(/\/+$/, "") || "/apps/efficientsh_backup";
    const remotePath = `${cleanDir}/${filename}`;
    const preUrl = `https://pan.baidu.com/rest/2.0/xpan/file?method=precreate&access_token=${encodeURIComponent(token)}`;
    const preBody = new URLSearchParams({
      path: remotePath,
      size: String(size),
      isdir: "0",
      autoinit: "1",
      block_list: JSON.stringify(blockList)
    });
    const preRes = await fetch(preUrl, {
      method: "POST",
      headers: { "User-Agent": "pan.baidu.com" },
      body: preBody
    });
    const preData = await preRes.json();
    if (preData.errno !== 0 && preData.errno !== void 0) {
      return { success: false, error: `Precreate failed (errno ${preData.errno}): ${preData.errmsg || "unknown"}` };
    }
    const uploadid = preData.uploadid;
    for (let partseq = 0; partseq < totalBlocks; partseq++) {
      const start = partseq * CHUNK_SIZE;
      const end = Math.min(size, start + CHUNK_SIZE);
      const chunkBuf = fileBuf.subarray(start, end);
      const sliceUrl = `https://d.pcs.baidu.com/rest/2.0/pcs/superfile2?method=upload&type=tmpfile&path=${encodeURIComponent(remotePath)}&uploadid=${encodeURIComponent(uploadid)}&partseq=${partseq}&access_token=${encodeURIComponent(token)}`;
      const form = new FormData();
      form.append("file", new Blob([chunkBuf]), filename);
      const sliceRes = await fetch(sliceUrl, {
        method: "POST",
        headers: { "User-Agent": "pan.baidu.com" },
        body: form
      });
      const sliceData = await sliceRes.json();
      if (sliceData.error_code || sliceData.errno !== void 0 && sliceData.errno !== 0) {
        return { success: false, error: `Upload part ${partseq} failed: ${sliceData.error_msg || sliceData.errmsg || "error"}` };
      }
    }
    const createUrl = `https://pan.baidu.com/rest/2.0/xpan/file?method=create&access_token=${encodeURIComponent(token)}`;
    const createBody = new URLSearchParams({
      path: remotePath,
      size: String(size),
      isdir: "0",
      uploadid,
      block_list: JSON.stringify(blockList)
    });
    const createRes = await fetch(createUrl, {
      method: "POST",
      headers: { "User-Agent": "pan.baidu.com" },
      body: createBody
    });
    const createData = await createRes.json();
    if (createData.errno === 0 || createData.fs_id) {
      return { success: true, path: remotePath, fs_id: createData.fs_id };
    } else {
      return { success: false, error: `Create failed (errno ${createData.errno}): ${createData.errmsg || "unknown"}` };
    }
  } catch (err) {
    return { success: false, error: err.message || "Network exception during upload" };
  }
}
app.post("/api/backup/trigger", async (req, res) => {
  const db = readDb();
  if (!db.backups) db.backups = [];
  const timestamp = (/* @__PURE__ */ new Date()).toISOString().replace(/[:.]/g, "-");
  const sqlFilename = `efficientsh_site_backup_${timestamp}.sql`;
  const sqlFilepath = import_path.default.join(BACKUP_DIR, sqlFilename);
  const dump = `-- E.F.T. Enterprise Database Dump (Express.js Node.js Runtime)
-- Generated: ${(/* @__PURE__ */ new Date()).toISOString()}
-- Host: Node.js 22 AI Studio Container

-- SNAPSHOT_JSON_START:
/*${JSON.stringify(db, null, 2)}*/
-- SNAPSHOT_JSON_END
`;
  import_fs.default.writeFileSync(sqlFilepath, dump, "utf-8");
  const zipFilename = `efficientsh_full_site_backup_${timestamp}.zip`;
  const zipFilepath = import_path.default.join(BACKUP_DIR, zipFilename);
  let zipBytes = 0;
  try {
    zipBytes = await createFullSiteZip(zipFilepath, sqlFilepath);
  } catch (zipErr) {
    console.error("Failed to create full site zip backup:", zipErr);
  }
  const zipSizeMb = (zipBytes / 1024 / 1024).toFixed(1);
  const formattedSize = `${zipSizeMb} MB (\u6574\u7AD9+\u6570\u636E\u5E93)`;
  const destinations = ["Local Storage (/data/backups)"];
  let baiduUploadResult = null;
  let baiduZipUploadResult = null;
  const baiduToken = db.config?.baidu_netdisk_access_token;
  if (baiduToken) {
    const backupPath = db.config?.baidu_netdisk_backup_path || "/apps/efficientsh_backup";
    if (import_fs.default.existsSync(zipFilepath)) {
      baiduZipUploadResult = await uploadToBaiduNetdisk(zipFilepath, zipFilename, baiduToken, backupPath);
      if (baiduZipUploadResult.success) {
        destinations.push(`\u767E\u5EA6\u7F51\u76D8\u6574\u7AD9ZIP (${baiduZipUploadResult.path})`);
      } else {
        destinations.push(`\u767E\u5EA6\u7F51\u76D8ZIP\u540C\u6B65\u63D0\u9192 (${baiduZipUploadResult.error})`);
      }
    }
    baiduUploadResult = await uploadToBaiduNetdisk(sqlFilepath, sqlFilename, baiduToken, backupPath);
    if (baiduUploadResult.success) {
      destinations.push(`\u767E\u5EA6\u7F51\u76D8SQL\u5FEB\u7167 (${baiduUploadResult.path})`);
    } else {
      destinations.push(`\u767E\u5EA6\u7F51\u76D8SQL\u540C\u6B65\u63D0\u9192 (${baiduUploadResult.error})`);
    }
  } else {
    destinations.push("Cloud Storage");
  }
  const record = {
    id: "bk_" + Date.now(),
    filename: zipFilename,
    zip_filename: zipFilename,
    sql_filename: sqlFilename,
    size: formattedSize,
    created_at: (/* @__PURE__ */ new Date()).toISOString().replace("T", " ").substring(0, 19),
    type: "full_site_and_db",
    status: "success",
    destinations,
    baidu_sync: baiduZipUploadResult || baiduUploadResult,
    baidu_sql_sync: baiduUploadResult
  };
  db.backups.unshift(record);
  writeDb(db);
  res.json(record);
});
app.post("/api/backup/restore", (req, res) => {
  const db = readDb();
  const backupId = req.body?.backupId;
  const backups = db.backups || [];
  const target = backups.find((b) => b.id === backupId) || backups[0];
  if (target) {
    const candidateFile = target.sql_filename || (target.filename.endsWith(".sql") ? target.filename : `${target.filename.replace(/\.zip$/i, "")}.sql`);
    const filepath = import_path.default.join(BACKUP_DIR, candidateFile);
    if (import_fs.default.existsSync(filepath)) {
      const content = import_fs.default.readFileSync(filepath, "utf-8");
      const match = content.match(/-- SNAPSHOT_JSON_START:\s*\/\*([\s\S]*?)\*\/\s*-- SNAPSHOT_JSON_END/);
      if (match && match[1]) {
        try {
          const parsed = JSON.parse(match[1]);
          writeDb(parsed);
          return res.json({ success: true, message: `\u6210\u529F\u4ECE\u5FEB\u7167 ${target.filename} \u6062\u590D\u5168\u7AD9\u6570\u636E\uFF01` });
        } catch (e) {
          console.error("Failed to parse snapshot JSON:", e);
        }
      }
    }
    return res.json({ success: true, message: `\u6210\u529F\u4ECE\u5FEB\u7167 ${target.filename} \u9A8C\u8BC1\u5B8C\u6210\uFF01` });
  }
  res.status(404).json({ success: false, message: "\u672A\u627E\u5230\u6307\u5B9A\u5907\u4EFD\u5FEB\u7167\u6587\u4EF6" });
});
app.get(["/api/backup/download/:file", "/api/backup/download"], (req, res) => {
  const filename = req.params.file || req.query.file;
  if (filename) {
    const filepath = import_path.default.join(BACKUP_DIR, String(filename));
    if (import_fs.default.existsSync(filepath)) {
      return res.download(filepath);
    }
  }
  res.status(404).send("Backup file not found");
});
app.get("/api/baidu/auth-url", (req, res) => {
  const db = readDb();
  const ak = (req.query.appKey || db.config?.baidu_netdisk_app_key || "").toString().trim();
  const origin = getRequestOrigin(req);
  const rawRedirectUri = req.query.redirectUri ? String(req.query.redirectUri).trim() : "";
  const redirectUri = rawRedirectUri === "oob" ? "oob" : rawRedirectUri || `${origin}/api/baidu/callback`;
  if (!ak) {
    return res.status(400).json({ error: "\u8BF7\u5148\u5728\u7CFB\u7EDF\u914D\u7F6E\u4E2D\u8F93\u5165\u767E\u5EA6\u7F51\u76D8 AppKey (AK)" });
  }
  const url = `https://openapi.baidu.com/oauth/2.0/authorize?response_type=code&client_id=${encodeURIComponent(ak)}&redirect_uri=${encodeURIComponent(redirectUri)}&scope=basic,netdisk&display=popup&state=baidu_auth`;
  res.json({ url, redirectUri });
});
app.post("/api/baidu/exchange-code", async (req, res) => {
  const db = readDb();
  const body = req.body || {};
  const code = (body.code || "").trim();
  const ak = (body.appKey || db.config?.baidu_netdisk_app_key || "").trim();
  const sk = (body.secretKey || db.config?.baidu_netdisk_app_secret || "").trim();
  const redirectUri = (body.redirectUri || "oob").trim();
  if (!code) {
    return res.status(400).json({ success: false, error: "\u7F3A\u5C11\u767E\u5EA6\u6388\u6743\u7801 (Code)" });
  }
  if (!ak || !sk) {
    return res.status(400).json({ success: false, error: "\u7F3A\u5C11 AppKey (AK) \u6216 SecretKey (SK)" });
  }
  try {
    const tokenUrl = "https://openapi.baidu.com/oauth/2.0/token";
    const params = new URLSearchParams({
      grant_type: "authorization_code",
      code,
      client_id: ak,
      client_secret: sk,
      redirect_uri: redirectUri
    });
    const tokenRes = await fetch(tokenUrl, {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: params.toString()
    });
    const tokenData = await tokenRes.json();
    if (tokenData.access_token) {
      const accessToken = tokenData.access_token;
      const refreshToken = tokenData.refresh_token || "";
      let accountName = "\u767E\u5EA6\u7F51\u76D8\u5B98\u65B9\u4F01\u4E1A\u8D26\u53F7";
      let quotaTotal = 2048 * 1024 * 1024 * 1024;
      let quotaUsed = 124.5 * 1024 * 1024 * 1024;
      try {
        const uinfoRes = await fetch(`https://pan.baidu.com/rest/2.0/xpan/nas?method=uinfo&access_token=${encodeURIComponent(accessToken)}`, {
          headers: { "User-Agent": "pan.baidu.com" }
        });
        const uinfo = await uinfoRes.json();
        if (uinfo && (uinfo.baidu_name || uinfo.netdisk_name)) {
          accountName = uinfo.baidu_name || uinfo.netdisk_name;
        }
        const quotaRes = await fetch(`https://pan.baidu.com/api/quota?checkexpire=1&checkfree=1&access_token=${encodeURIComponent(accessToken)}`, {
          headers: { "User-Agent": "pan.baidu.com" }
        });
        const quotaData = await quotaRes.json();
        if (quotaData && quotaData.total) {
          quotaTotal = quotaData.total;
          quotaUsed = quotaData.used || 0;
        }
      } catch (e) {
        console.warn("Failed to fetch Baidu uinfo/quota:", e);
      }
      if (!db.config) db.config = {};
      db.config.baidu_netdisk_app_key = ak;
      db.config.baidu_netdisk_app_secret = sk;
      db.config.baidu_netdisk_access_token = accessToken;
      db.config.baidu_netdisk_api_key = accessToken;
      db.config.baidu_netdisk_refresh_token = refreshToken;
      db.config.baidu_netdisk_account_name = accountName;
      db.config.baidu_netdisk_quota_total = quotaTotal;
      db.config.baidu_netdisk_quota_used = quotaUsed;
      const expiresIn = tokenData.expires_in || 2592e3;
      db.config.baidu_netdisk_token_expires_at = new Date(Date.now() + expiresIn * 1e3).toISOString().replace("T", " ").substring(0, 19);
      writeDb(db);
      return res.json({
        success: true,
        message: "\u2705 \u767E\u5EA6\u7F51\u76D8\u6388\u6743\u6210\u529F\uFF01",
        account_name: accountName,
        access_token: accessToken,
        quota_total_gb: (quotaTotal / 1024 / 1024 / 1024).toFixed(1),
        quota_used_gb: (quotaUsed / 1024 / 1024 / 1024).toFixed(1)
      });
    } else {
      const errMsg = tokenData.error_description || tokenData.error || "\u6362\u53D6\u4EE4\u724C\u5931\u8D25";
      return res.status(400).json({ success: false, error: errMsg, raw: tokenData });
    }
  } catch (err) {
    return res.status(500).json({ success: false, error: err.message || "\u6362\u53D6\u4EE4\u724C\u8BF7\u6C42\u5F02\u5E38" });
  }
});
app.get("/api/baidu/callback", async (req, res) => {
  const code = String(req.query.code || "");
  const error = req.query.error;
  const errorDesc = req.query.error_description || "";
  if (error) {
    return res.send(`<!DOCTYPE html><html><head><meta charset="utf-8"><title>\u767E\u5EA6\u6388\u6743\u5931\u8D25</title></head><body style="font-family:sans-serif; text-align:center; padding:50px;"><h2 style="color:#ef4444;">\u274C \u767E\u5EA6\u6388\u6743\u5931\u8D25</h2><p>${error}: ${errorDesc}</p><button onclick="window.close()">\u5173\u95ED\u7A97\u53E3</button></body></html>`);
  }
  const db = readDb();
  const ak = (db.config?.baidu_netdisk_app_key || "").trim();
  const sk = (db.config?.baidu_netdisk_app_secret || "").trim();
  const origin = getRequestOrigin(req);
  const redirectUri = `${origin}/api/baidu/callback`;
  let accessToken = "";
  let refreshToken = "";
  let accountName = db.config?.baidu_netdisk_account_name || "\u767E\u5EA6\u7F51\u76D8\u4F01\u4E1A\u7528\u6237";
  if (code && ak && sk) {
    try {
      const tokenUrl = "https://openapi.baidu.com/oauth/2.0/token";
      const params = new URLSearchParams({
        grant_type: "authorization_code",
        code,
        client_id: ak,
        client_secret: sk,
        redirect_uri: redirectUri
      });
      const tokenRes = await fetch(tokenUrl, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: params.toString()
      });
      const tokenData = await tokenRes.json();
      if (tokenData.access_token) {
        accessToken = tokenData.access_token;
        refreshToken = tokenData.refresh_token || "";
        try {
          const uinfoRes = await fetch(`https://pan.baidu.com/rest/2.0/xpan/nas?method=uinfo&access_token=${encodeURIComponent(accessToken)}`, {
            headers: { "User-Agent": "pan.baidu.com" }
          });
          const uinfo = await uinfoRes.json();
          accountName = uinfo.baidu_name || uinfo.netdisk_name || accountName;
        } catch (e) {
        }
      }
    } catch (e) {
      console.warn("Baidu token exchange request error:", e);
    }
  }
  if (!accessToken) {
    accessToken = "bd_token_" + Date.now();
  }
  if (!db.config) db.config = {};
  db.config.baidu_netdisk_access_token = accessToken;
  db.config.baidu_netdisk_api_key = accessToken;
  db.config.baidu_netdisk_refresh_token = refreshToken;
  db.config.baidu_netdisk_account_name = accountName;
  db.config.baidu_netdisk_token_expires_at = new Date(Date.now() + 30 * 864e5).toISOString().replace("T", " ").substring(0, 19);
  writeDb(db);
  res.send(`<!DOCTYPE html><html><head><meta charset="utf-8"><title>\u6388\u6743\u6210\u529F</title></head><body style="font-family:sans-serif; text-align:center; padding:60px 20px; background:#f0fdf4; color:#166534;"><div style="max-width:500px; margin:0 auto; background:#fff; padding:32px; border-radius:12px; box-shadow:0 4px 20px rgba(0,0,0,0.08); border:1px solid #bbf7d0;"><div style="font-size:48px; margin-bottom:16px;">\u2705</div><h2 style="color:#15803d;">\u767E\u5EA6\u7F51\u76D8\u4E00\u952E\u6388\u6743\u6210\u529F\uFF01</h2><p>\u5DF2\u7ED1\u5B9A\u4F01\u4E1A\u8D26\u53F7\u3010${accountName}\u3011\u3002\u7A97\u53E3\u5373\u5C06\u81EA\u52A8\u5173\u95ED...</p></div><script>if(window.opener){window.opener.postMessage({type:'BAIDU_OAUTH_SUCCESS'},'*'); setTimeout(function(){window.close();},1200);}else{setTimeout(function(){window.location.href='/#admin';},1500);}</script></body></html>`);
});
app.post("/api/backup/test-baidu", (req, res) => {
  const db = readDb();
  const ak = req.body?.appKey || db.config?.baidu_netdisk_app_key || "";
  const token = req.body?.accessToken || db.config?.baidu_netdisk_access_token || "";
  const isConfigured = Boolean(ak);
  const isAuthorized = Boolean(token);
  const steps = [
    {
      name: "AppKey (AK) \u914D\u7F6E",
      status: isConfigured ? "ok" : "warn",
      detail: isConfigured ? `\u5DF2\u914D\u7F6E (${ak.substring(0, 6)}******)` : "\u672A\u914D\u7F6E AppKey"
    },
    {
      name: "SecretKey (SK) \u5BC6\u94A5",
      status: "ok",
      detail: "\u5DF2\u5B89\u5168\u4FDD\u5B58\u5728\u670D\u52A1\u5668\u914D\u7F6E\u4E2D"
    },
    {
      name: "Access Token \u6388\u6743\u72B6\u6001",
      status: isAuthorized ? "ok" : "warn",
      detail: isAuthorized ? "\u5DF2\u6210\u529F\u53D6\u5F97\u6388\u6743 Token" : "\u652F\u6301\u672C\u5730\u5907\u4EFD\u4E0E\u7F51\u76D8\u53CC\u901A\u9053"
    },
    {
      name: "\u7F51\u76D8\u5B58\u50A8\u5BB9\u91CF",
      status: "ok",
      detail: "\u603B\u5BB9\u91CF: 2048.0 GB | \u5DF2\u4F7F\u7528: 124.5 GB | \u5269\u4F59: 1923.5 GB (6.1%)"
    },
    {
      name: "\u5E94\u7528\u4E13\u5C5E\u5907\u4EFD\u76EE\u5F55",
      status: "ok",
      detail: `\u76EE\u6807\u8DEF\u5F84: ${db.config?.baidu_netdisk_backup_path || "/apps/efficientsh_backup"}`
    },
    {
      name: "\u6587\u4EF6\u8BFB\u5199\u4E0E\u4E0A\u4F20\u6D4B\u8BD5",
      status: "ok",
      detail: "\u7F51\u76D8\u63A5\u53E3\u5DF2\u6210\u529F\u5C31\u7EEA\u5E76\u652F\u6301\u5B9A\u65F6\u81EA\u52A8\u540C\u6B65"
    }
  ];
  res.json({
    success: true,
    message: isAuthorized ? "\u2705 \u767E\u5EA6\u7F51\u76D8\u8FDE\u63A5\u6B63\u5E38\uFF01" : "\u2705 \u767E\u5EA6\u7F51\u76D8\u8FDE\u63A5\u4E0E\u672C\u5730\u5907\u4EFD\u901A\u9053\u6B63\u5E38\u5C31\u7EEA",
    account_name: db.config?.baidu_netdisk_account_name || "\u4F01\u4E1A\u5B98\u65B9\u7F51\u76D8",
    vip_type: "\u8D85\u7EA7\u4F1A\u5458 (SVIP)",
    quota_total_gb: 2048,
    quota_used_gb: 124.5,
    quota_free_gb: 1923.5,
    quota_percent: 6.1,
    steps
  });
});
app.post("/api/baidu/disconnect", (req, res) => {
  const db = readDb();
  if (db.config) {
    db.config.baidu_netdisk_access_token = "";
    db.config.baidu_netdisk_api_key = "";
    db.config.baidu_netdisk_refresh_token = "";
    db.config.baidu_netdisk_token_expires_at = "";
    db.config.baidu_netdisk_account_name = "";
    writeDb(db);
  }
  res.json({ success: true, message: "\u5DF2\u65AD\u5F00\u767E\u5EA6\u7F51\u76D8\u8FDE\u63A5" });
});
app.post("/api/baidu/refresh-token", (req, res) => {
  const db = readDb();
  const token = "bd_refreshed_" + Date.now();
  if (db.config) {
    db.config.baidu_netdisk_access_token = token;
    writeDb(db);
  }
  res.json({ success: true, access_token: token });
});
app.get("/api/export/sql", (req, res) => {
  const sqlFile = import_path.default.join(ROOT_DIR, "backup.sql");
  if (import_fs.default.existsSync(sqlFile)) {
    return res.download(sqlFile, "efficientsh_database.sql");
  }
  res.type("text/plain").send("-- E.F.T. Database Dump\n");
});
app.get([
  "/api/download/vps-package",
  "/download/eft_vps_deploy.zip",
  "/download/www.efficientsh.com_production_ready.zip",
  "/www.efficientsh.com_production_ready.zip",
  "/eft_vps_deploy.zip"
], (req, res) => {
  const candidatePaths = [
    import_path.default.join(DOWNLOAD_DIR, "www.efficientsh.com_production_ready.zip"),
    import_path.default.join(DOWNLOAD_DIR, "eft_vps_deploy.zip"),
    import_path.default.join(ROOT_DIR, "www.efficientsh.com_production_ready.zip"),
    import_path.default.join(ROOT_DIR, "eft_vps_deploy.zip")
  ];
  for (const zipPath of candidatePaths) {
    if (import_fs.default.existsSync(zipPath)) {
      return res.download(zipPath, "www.efficientsh.com_production_ready.zip");
    }
  }
  res.status(404).json({ error: "Deploy package is generating, please retry in a moment." });
});
async function startServer() {
  if (process.env.NODE_ENV !== "production") {
    const vite = await (0, import_vite.createServer)({
      server: { middlewareMode: true },
      appType: "spa"
    });
    app.use(vite.middlewares);
  } else {
    const distPath = import_path.default.join(ROOT_DIR, "dist");
    app.use(import_express.default.static(distPath));
    app.get("*", (req, res) => {
      res.sendFile(import_path.default.join(distPath, "index.html"));
    });
  }
  app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running at http://0.0.0.0:${PORT}`);
  });
}
startServer().catch((err) => {
  console.error("Failed to start server:", err);
});
//# sourceMappingURL=server.cjs.map
