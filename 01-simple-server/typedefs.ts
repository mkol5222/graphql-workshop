const typeDefs = /* GraphQL */ `

type MultiplyResponse {
    greeting: String
    num: Float
}

type Query {
    multiplyBy3(n: Float!): Float!
    sum2(a: Int!, b: Int!): Int!
    helloWorld: String!
    hello(name: String!): String!
    minus(a: Int!, b: Int!): Int!

    multiply(x: Float, y: Float): MultiplyResponse

    multiplyBy2(n: Int!): Int!

    sum2b(a: Int!, b: Int!): Int!
}
`;

export { typeDefs };
