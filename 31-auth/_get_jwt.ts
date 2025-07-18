#!/usr/bin/env -S deno run -A

import { create, decode, verify } from "https://deno.land/x/djwt@v3.0.2/mod.ts";


const key = await crypto.subtle.generateKey(
  { name: "HMAC", hash: "SHA-512" },
  true,
  ["sign", "verify"],
);
// save key as a base64 string
const exportedKey = await crypto.subtle.exportKey("raw", key);
const keyArray = new Uint8Array(exportedKey);
const keyString = btoa(String.fromCharCode(...keyArray));
console.log("Key (base64):", keyString);

console.log("Key:", key);

const jwt = await create({ alg: "HS512", typ: "JWT" }, { foo: "bar" }, key);

console.log("JWT:", jwt);

// decode JWT

// load key from base64 string
const keyBuffer = Uint8Array.from(atob(keyString), c => c.charCodeAt(0));
const importedKey = await crypto.subtle.importKey(
  "raw",
  keyBuffer,
  { name: "HMAC", hash: "SHA-512" },
  true,
  ["sign", "verify"],
);

// verify JWT
const verification = await verify(jwt, importedKey);
console.log("Is JWT valid?", verification);

// decode JWT without verification
const [header, payload, signature] = decode(jwt);
console.log("Decoded Header:", header);
console.log("Decoded Payload:", payload);
console.log("Decoded Signature:", signature);
