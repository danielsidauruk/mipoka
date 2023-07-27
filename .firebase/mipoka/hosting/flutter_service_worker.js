'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "e03385b6e840763e541747671ff2caee",
"index.html": "ce363ece0bb36e634514ff473908ca37",
"/": "ce363ece0bb36e634514ff473908ca37",
"main.dart.js": "665bfbd03cd5ae402982ef86c03e482d",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fad9046699756b407ec5ab26c6994926",
"assets/AssetManifest.json": "3895f62480d66152452c45e724de3ab0",
"assets/NOTICES": "30c08586085fcec0694280b58e844142",
"assets/FontManifest.json": "dc2fa598ebc60cac014a8713ba5d2f4b",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "ce536ebf705847ea6ba24f75528646eb",
"assets/fonts/MaterialIcons-Regular.otf": "073e4c79720872e34f8072c245b07eea",
"assets/assets/json_file/nama_kegiatan_mpt_list.json": "51d8d079e382bcc4e462ee4604ad436d",
"assets/assets/json_file/berita_list.json": "d6e2465d2617f711f6caf571b7f7fafe",
"assets/assets/json_file/nama_kegiatan_mpt.json": "5c551dbaff7a29f4b1f0bc6ba00c6ee0",
"assets/assets/json_file/jenis_kegiatan_mpt.json": "a322005ef892ffc3c649b758871e6010",
"assets/assets/json_file/usulan_kegiatan.json": "85717c5e5ebe744a71b366bffb4a22ee",
"assets/assets/json_file/revisi_usulan.json": "78eb2739cacb8ea04400f6e45a0beb94",
"assets/assets/json_file/session.json": "c84aad390584560fdf2d31cabc8e65fe",
"assets/assets/json_file/riwayat_kegiatan_mpt.json": "3410889a492e25888ab2da5ff60aa2a3",
"assets/assets/json_file/ormawa.json": "ec00735134251738a98c13f1007c460e",
"assets/assets/json_file/jenis_kegiatan_mpt_list.json": "d2d795eb6c7af29e3c60de8fc5712113",
"assets/assets/json_file/kegiatan_per_periode_mpt_list.json": "5cf5d1159cf612e7d31ffda0dc6dbca3",
"assets/assets/json_file/usulan_kegiatan_list.json": "9123f00bb592d34ec83a94adcea5765a",
"assets/assets/json_file/admin_list.json": "a8b00a0b3b52de392b1dc4475ea6d7ab",
"assets/assets/json_file/session_list.json": "79ca0e16cc3a9b80d1ca98df780eb169",
"assets/assets/json_file/mipoka_user.json": "15cdb2da610301f861295268ea24986b",
"assets/assets/json_file/mhs_per_periode_mpt.json": "54e6a0db116c37bf9092211ca1022229",
"assets/assets/json_file/mipoka_user_list.json": "14b48c5bab7e332fff8a0ef75e5dc1e8",
"assets/assets/json_file/laporan_list.json": "be35d82149f28b096b1649f8bbcc4abe",
"assets/assets/json_file/revisi_laporan.json": "28cc40e01c6e495e7e688c843db7d74f",
"assets/assets/json_file/kegiatan_per_periode_mpt.json": "87598c1686b1d9ed15f9ddb64a72dba4",
"assets/assets/json_file/prestasi_list.json": "ad41d3ba6ae316566bd3254b8bd5b159",
"assets/assets/json_file/prestasi.json": "aaed99011bd5215b6d378ab74b803698",
"assets/assets/json_file/admin.json": "66fe9fe3189d8d5d1736fb3fcdc93585",
"assets/assets/json_file/laporan.json": "cf9ca6cc7909587ac7215056154d1c23",
"assets/assets/json_file/berita.json": "88f87c3e26023dee38cc1670d4946027",
"assets/assets/json_file/periode_mpt.json": "055ac0d5874b7dcc73c10e87b928b07d",
"assets/assets/json_file/mhs_per_periode_mpt_list.json": "fc19c120a5d9823ffe6df7b3fcc4393d",
"assets/assets/json_file/riwayat_kegiatan_mpt_list.json": "33172178226184dedd464f9b6299daa6",
"assets/assets/json_file/periode_mpt_list.json": "c5c01e7039691925cb67935ce514054b",
"assets/assets/json_file/ormawa_list.json": "94169f910a411cd59bb4adea8b283c1b",
"assets/assets/docx_template/template.docx": "d3e4299693b75f808fedb142186ef7c0",
"assets/assets/docx_template/test.jpg": "9bc7572ad5b61288ab419aa2e21e6869",
"assets/assets/docx_template/usulan_template.docx": "7a53f923103c872f53a8753065ccd046",
"assets/assets/icons/sms.png": "258f0151a708ab29318de6013533ef3a",
"assets/assets/icons/time.png": "a4e31c8a4421de5e3007d0ce7dc6f262",
"assets/assets/icons/approve.png": "3696fd915075d21708bcab5c6f6da524",
"assets/assets/icons/home.png": "eb52f849be02062fa3a381f6c7ac7aa1",
"assets/assets/icons/dark-mode.png": "77a0893e043bb7c517a3b2a4fb97009e",
"assets/assets/icons/excel.png": "74eda0db5de415e02fdf35623842faae",
"assets/assets/icons/upload.png": "3ac1b9c61a40bf9d36133038ae6efb1c",
"assets/assets/icons/filter.png": "c7b2c049c4a3867b0a970f0b7065b985",
"assets/assets/icons/attach.png": "f666feada9b4ff5b555b09267403e283",
"assets/assets/icons/calendar.png": "76939a6767c7bdae919a9815a33b2b43",
"assets/assets/icons/delete.png": "319e3a8364dcd778f2ea57dd404db8ba",
"assets/assets/icons/exit.png": "3ff46b0728ea62d5a039aecfd9a4154c",
"assets/assets/icons/pdf.png": "6782108b0c7b89449f163b62feaab647",
"assets/assets/icons/edit.png": "896bc36a8bde208f1bb5821620636c29",
"assets/assets/icons/notification.png": "a7642ebd6c2260ec78034bd0e7513fd3",
"assets/assets/icons/light-mode.png": "e29c2dbe66dbbecc0d564b20c0478fb3",
"assets/assets/icons/word.png": "366de72b755cd0e945ae4abb77730757",
"assets/assets/icons/close.png": "65729bcb79ae943b9d908f41b29f02f9",
"assets/assets/font/helvetica.ttf": "1b580d980532792578c54897ca387e2c",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
