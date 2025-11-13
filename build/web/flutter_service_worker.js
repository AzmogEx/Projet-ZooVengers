'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e725ee7a681b739a5ee3cefee4e82f28",
"version.json": "e2b774c29dcd9d1a57af9517b54e9296",
"index.html": "db14a154951913c922342193f8fee0df",
"/": "db14a154951913c922342193f8fee0df",
"main.dart.js": "a568dc469764057e8c4aeb5532eb0530",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "6e5a60e9fdd60c38b03befa955071253",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/app_launcher_icon.png": "8df83312c1277ff48703b0dd925d4577",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2285bd711ab86287969deadf858cc14c",
"assets/AssetManifest.json": "e5e5fb73d1723d9961a146b3a5f96e0a",
"assets/NOTICES": "8b0929c029d57f48d24f12cce8e149c3",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "5da27a7201ea786228ecc6edd4eb09fa",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f25e8e701660fb45e2a81ff3f43c6d5c",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "eafc209942a375c7d9062c90e8eee163",
"assets/fonts/MaterialIcons-Regular.otf": "5767ce38978d510895f06d31b2020d12",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/audios/SUPER_MARIO_-_game_over_-_sound_effect.mp3": "8f4d7c1aa8f66adf49a198c3d78ee239",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/BERSERKER.png": "52b686bd56527e35cbdd367c7d98e303",
"assets/assets/images/TASMANIE_DEIFFICILE.png": "d8cba9434bbef43b338d6eea9a0a71c6",
"assets/assets/images/FANTOME.png": "32601cd02fcb3fd0e219dc00542800a9",
"assets/assets/images/28.png": "100cc68876eacbbf66a62deac3503338",
"assets/assets/images/29.png": "7c551fa46abf29fefa0bcc6d2b9f9d93",
"assets/assets/images/adaptive_foreground_icon.png": "8df83312c1277ff48703b0dd925d4577",
"assets/assets/images/RESSORT.png": "0eb8d63d1d672a42af68c5ba44e5ecf7",
"assets/assets/images/AXOLOTL_difficile.png": "498eeb6e1fe32a45a84d4499ce4422d8",
"assets/assets/images/NUIT_NOIR_DIFFICILE.png": "1ec0e055e1ded6bcc22cd433eada4f7e",
"assets/assets/images/FANTOME_DIFFICILE.png": "a72944b3468397f73c0a792eeeccac53",
"assets/assets/images/AXOLOLT.png": "fc99cdd2f75fdbd121cda882cd21efd8",
"assets/assets/images/MARSUPIAL.png": "46267d3e1c16f88ea7bbb5bd2848bd9a",
"assets/assets/images/SYMBIOZ.png": "c948b82a950f832148ba6a5334addd63",
"assets/assets/images/SENTINELLE.png": "20dd4bbb02b75ca22113bd2ae66de936",
"assets/assets/images/BERSERKER_difficile.png": "6efaf20ce9cf5dc6299fafbcf4ea3f58",
"assets/assets/images/SENTINELLE_difficile.png": "201d8c1673a2920bb8a92ef375f9d6cb",
"assets/assets/images/MARUPIAL_DIFFICILE.png": "1a53b0e1c22abd0df72436cd3c5af431",
"assets/assets/images/NUIT_NOIR.png": "77618faa6968a84f3c509260b12c6243",
"assets/assets/images/app_launcher_icon.png": "8df83312c1277ff48703b0dd925d4577",
"assets/assets/images/21.png": "573198bf796ec10fd849c63f99f70c17",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/22.png": "79a4a5caf6e25d9c0d04d00db29e5f96",
"assets/assets/images/ZOOVENGERS_splash.png": "a24a96daa79f083d31f2e27eb847d0fc",
"assets/assets/images/Design_sans_titre.png": "6a2593e9ba71f36436e6b6bcc21de55c",
"assets/assets/images/23.png": "19b4dd90a0b03fd72a96b6bca2d28009",
"assets/assets/images/ECLAIR.png": "b35e73dd0fe802e5e02f46160137066e",
"assets/assets/images/26.png": "21a8770678bb6af3d0e7195fc908eb51",
"assets/assets/images/fond.png": "1836824e84b9b5094eb06c911870351f",
"assets/assets/images/24.png": "36620fbfe870a849967a2f6b101a79a4",
"assets/assets/images/25.png": "feac34500ae2f573ec69dbc2fbdd82c0",
"assets/assets/images/TASMANIE.png": "74f93940be91dd6c738b6cb80f68be36",
"assets/assets/images/adn.png": "d7ddfb4c9f25fd70d90ae1211ad4bc24",
"assets/assets/images/ECLAIR_DIFFICILE.png": "203cf6ffb931681d51aa437f04ea80de",
"assets/assets/images/image.png": "01c258c05ca44f8a3e6bc4241c2283fa",
"assets/assets/images/error_image.png": "8df83312c1277ff48703b0dd925d4577",
"assets/assets/lottie_animations/AnimCheck.json": "305f143807c1d9dd851f60e7f94fd0d0",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/animSend.json": "5ddccd7124c0031e3646b863cb3b446c",
"assets/assets/videos/Sucre_Volant.mp4": "0ddfd67b9ff4f8dafd5fd8095fdbdd35",
"assets/assets/videos/Colibri.mp4": "d63a3f89d344e8ad41fa565ec4a5eca2",
"assets/assets/videos/Axolotl.mp4": "762ddfa5122a5783223e52b858ae95c3",
"assets/assets/videos/panthere_720p_compress.mp4": "77223dca5655acfe2fd4b9cb4efc2a7e",
"assets/assets/videos/chamois.mp4": "023c2fa526ec71bd65c6d51656f126be",
"assets/assets/videos/ours_720p_compress.mp4": "f1265584ac8ff7de9f02f0a293e546f5",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/Ornythorinque.mp4": "02e0c2fcfea975f557a487ea374cc369",
"assets/assets/videos/roussette.mp4": "e6f9bd9ba526242b4ea4655a8391648b",
"assets/assets/videos/Paresseu.mp4": "43702f0d9c854efbe8b8fc160bbf57eb",
"assets/assets/videos/Hiboux.mp4": "89699508ed281b3fc1ce902221563312",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Oswald-Bold.ttf": "452bfeb5bf78e71cc3cd6e720ac24bd4",
"assets/assets/fonts/Oswald-Medium.ttf": "14cf874b374ca47427bbceb4b2373c3a",
"assets/assets/fonts/Oswald-Regular.ttf": "a7ccbd3cd9a9ff21ec41086dcc23ebe6",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
