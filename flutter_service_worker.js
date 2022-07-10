'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "5d8566af61debf40e8d549edb85ec631",
"version.json": "0d0b83d653b26dc68695b5e26fb64db5",
"assets/AssetManifest.json": "e26ab0f0a9ebee8025260de29a88a4ca",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/NOTICES": "43664fae9156ba5b65e082ea852e8ac3",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"index.html": "a4e3c3819eb761e58ad0ab254ea65b5c",
"/": "a4e3c3819eb761e58ad0ab254ea65b5c",
"icons/Icon-192.png": "203f88735f727e4b1e844663d87e5360",
"icons/Icon-maskable-192.png": "203f88735f727e4b1e844663d87e5360",
"icons/Icon-maskable-512.png": "edfea4701ebf7e4097165d571266efe6",
"icons/Icon-512.png": "edfea4701ebf7e4097165d571266efe6",
"favicon.png": "f8acd07749f15ddb719a4bbda6c33b50",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/fsmonitor-watchman.sample": "db4d62db2039e4bec38baa7567788284",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/refs/heads/pages": "db1545d38819e6f68d9850dd67d8371f",
".git/refs/remotes/origin/pages": "db1545d38819e6f68d9850dd67d8371f",
".git/refs/remotes/origin/master": "cee4ac6f37af034d4faa4d883b2a91bb",
".git/index": "49a16559413a3c90b2e26964bca1a0e5",
".git/COMMIT_EDITMSG": "d70bf0eaa01b4bd7cc9113e8bf44d4f3",
".git/logs/refs/heads/pages": "beb27ed14fcdc71cf740f0a3d8624dc7",
".git/logs/refs/remotes/origin/pages": "d904ab560d820853372efa776233f01e",
".git/logs/refs/remotes/origin/master": "c083f37c6dc3b57c4c1c3f3e8853976e",
".git/logs/HEAD": "7a72c468bf647efcc2f67fbb04c5aa5d",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/d0/03a53106e1ade6309cf2760ecc84a8366cd26b": "474300794b39665fadd6d307c29e5463",
".git/objects/ce/fd8c8698c13e32f816f58bcbee201c853af4d4": "72532e28650465aae435ef1c95bdf6d5",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/88/a5796c795b9c62be2e1eac970c0a2d64de3c70": "03ae40777fa5a91486fcd87bee9f75be",
".git/objects/38/b8789c9341fc78377b29dd2fca78f1c0719b5b": "715f25a5ef0e7641a176a136fd9c0abc",
".git/objects/ec/6e6a799440db943ae58f675b4a9a8ec72b446f": "17ca435ac4ec8aa2ccb6cd4968595de8",
".git/objects/dc/67dd363b44f82d30dc9bd7cf661744278f4dd3": "fedc759dd4ef5de29d7b523f1c03f1a6",
".git/objects/bc/19d4ebd65f64abbe4e6cad711ed86154a23516": "d59d6d211e73bc697d00efdd168a57e2",
".git/objects/08/0137fa95085b45d5d74894430af3d46382eeb0": "b1b4cff86cf86d10173dbdd4deb22467",
".git/objects/18/b643c896b29539f87d5cd1580215d9bc81bd2f": "2ec83ad3ab97bbcc6c96d3dcd6c2f3d7",
".git/objects/02/bb649b1bc1346bb423cb3aa144af0907780c1d": "06a05d9ba243c48576fced5eb99bdf89",
".git/objects/5f/71c1b20adf79116b5242d2f98a4dda6e03306d": "e1c4b7bac593ce57928776b42ee82bb2",
".git/objects/25/ff4bb8e13dbca18873abc8dc12d5e5c3edebe8": "585c9c42a0267a30e5f89427e9bf4e73",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/31/afb375145b6058f1b76bde2a11dbb300da1e97": "0a29e4418da0a870246999be15f7e31f",
".git/objects/9c/297de6eec70bcd8bfe755e2052f2dd0ef8b0cc": "6f3f73513d9b909669672a638fee4a32",
".git/objects/9c/90c3d706be9bdad94f8f89ad5d1fbf178a8aaf": "8ab98a7594c4a7b2cd217e523b9a86c6",
".git/objects/61/0769b7bc863e5ef93e38d6845aff37d74d60cc": "e8afa0a473aa07cb8a87da9991849d81",
".git/objects/03/9dc144b87e95a0f8371f9d843cea8f0cb3067c": "89e4cd887bd51dd064ebcbbe9d1c468e",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/d3/fed7265d0449b4ce0f6ec98b11b5490a1f2916": "45eb6f962909060af5dab15d9853635b",
".git/objects/cd/22076013ce8b84475eae9bb4cd6c60b5460fbe": "81c620e2d6cbe5638d6c90ee25886389",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/91/ebff1d5f574087af62bf5c10d2a97bfbb4ad1f": "77f18caf80de1925897dd0d053cd16ed",
".git/objects/8a/fafde6a649662e31637d54d02d0834a615e7dc": "7bf0843ee42b9cc5d9c6f63909892fec",
".git/objects/19/b66f652ebbccc0ef6d576e7d4c12a5f199c35a": "941d0ffd7ed638123c952be52188072f",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/1f/9dea86d49da71f095111707d03b9140eb69733": "0bd4fa0f40267bf0e6d88529e788d60b",
".git/objects/f2/49c7a38dde93e0a58b21c0002a08cc9feba962": "bc7857cdc461dee5e6224403530f4255",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/63/afe948871975d253b7766eaa1ae1a65d9a039d": "ec3910e648990ef0737b6691dde9738e",
".git/objects/pack/pack-44064b0e09d321ec132470eedcbada07a0b9e563.idx": "27e7f3096ee7ccfc3d3c395555aae660",
".git/objects/pack/pack-44064b0e09d321ec132470eedcbada07a0b9e563.pack": "fb9a79133fc96739459115b89f486554",
".git/objects/69/a8415d262ba17437b1c35204f68b2a851738af": "ad2b6f71cfae2bc47b77f3b9e3e8d417",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/ORIG_HEAD": "775f601f6d288558cd1190fd726c056e",
".git/config": "5f24dcf0a115f7a574c5addc07e1bfd9",
".git/FETCH_HEAD": "bbfd95496f111c411ce683374b79a570",
".git/HEAD": "4bc70ef0e6a7fdd050a2fc8a17065f16",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"README.md": "d41d8cd98f00b204e9800998ecf8427e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"main.dart.js": "33afd95737aae9710d5ea5c73012df10"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
