#!/usr/bin/env -S deno run --watch  -A

import { createSchema, createYoga } from 'graphql-yoga'
import { serve } from 'https://deno.land/std@0.157.0/http/server.ts'

import { typeDefs } from "./typedefs.ts"
import { resolvers } from "./resolvers.ts"

const yoga = createYoga({
  schema: createSchema({
    typeDefs,
    resolvers
  })
})
 
serve(yoga, {
  port: 3000,
  onListen({ hostname, port }) {
    console.log(`Listening on http://${hostname}:${port}${yoga.graphqlEndpoint}`)
  }
})