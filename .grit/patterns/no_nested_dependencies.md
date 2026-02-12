---
title: No nested dependencies
level: error
---

# No nested dependencies

Dependency declarations must appear only in the root `package.json`.
Nested `package.json` files inside `packages/` must not declare
`dependencies`, `devDependencies`, `peerDependencies`, or `optionalDependencies`.

```grit
language json

// Match any dependency key in a package.json under packages/
`"$key": { $_ }` where {
  $key <: or { "dependencies", "devDependencies", "peerDependencies", "optionalDependencies" },
  $filename <: includes "packages/"
}
```
