#!/usr/bin/env -S deno run --watch  -A

import { createSchema, createYoga } from 'graphql-yoga'
import { serve } from 'https://deno.land/std@0.157.0/http/server.ts'
import { create, decode, verify } from "https://deno.land/x/djwt@v3.0.2/mod.ts";

import { typeDefs } from "./typedefs.ts"
import { resolvers } from "./resolvers.ts"

// load key from base64 string
const keyString = "TtZcADCD+tKCyxpw9iIWOaNO/y5Km8kpi1Qc8Hys1D6PgQjhMMz0PubNWBJ0uh/coH5Q6HZt16s+YUGkrK5TtlkJiSanoBxP4+NxNwUaBOUK027MwrkAl9d5mjMpINZcZhI6tKr+5BvkuSRT3B5V5i6qmI0Yv3T/vzHWO18enz8="
const keyBuffer = Uint8Array.from(atob(keyString), c => c.charCodeAt(0));
const JWT_KEY = await crypto.subtle.importKey(
  "raw",
  keyBuffer,
  { name: "HMAC", hash: "SHA-512" },
  true,
  ["sign", "verify"],
);

const yoga = createYoga({
  schema: createSchema({
    typeDefs,
    resolvers
  }),
  context: async ({ request }) => {
    const authHeader = request.headers.get('authorization') || null;
    
    const token = authHeader ? authHeader.split(' ')[1] : null;
    const authType = authHeader ? authHeader.split(' ')[0] : null;
    
    let user = null;
    let passwd = null;
    if (token && authType && authType.toLowerCase() === 'basic') {
      // Basic auth: decode the token
      [user, passwd] = atob(token).split(':');
      // console.log(`Basic auth with user: ${user}, password: ${passwd}`);
    }

    let jwtPayload = null;
    let jwtValid = false;
    if (token && authType && authType.toLowerCase() === 'bearer') {
      // Bearer token: verify the JWT
      jwtPayload = null;
      jwtValid = false;
      try {
        jwtPayload = await verify(token, JWT_KEY);
        jwtValid = true;
      } catch (error) {
        console.error("JWT verification failed:", error);
      } 
    }

    // return context object with auth info
    return { authorization: { authHeader, token, authType, basic: { user, passwd }, jwt: { jwtPayload, jwtValid } } };
  }
})
 
serve(yoga, {
  port: 3000,
  onListen({ hostname, port }) {
    console.log(`Listening on http://${hostname}:${port}${yoga.graphqlEndpoint}`)
  }
})