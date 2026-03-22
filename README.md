# test_npm

NPM issue: https://github.com/npm/cli/issues/9135

## Repro steps

1. `npm run clean:all` (delete all `node_modules` folders + lock files)
2. `npm install`
3. `npm audit --omit=dev`
4. ❌ See vulnerabilities from lodash package
5. `npm run clean` (delete `node_modules` and lock file, but only in root folder)
6. `npm install`
7. `npm audit --omit=dev`
8. ❎ No vulnerabilities and changed lock file

## `npm ls lodash --omit=dev` outputs

`npm ls lodash --omit=dev` output after first `npm install` command in fresh repo (run `npm run clean:all` before):

```
+-- postman-collection@4.4.1 extraneous
| `-- lodash@4.17.21
`-- simplebar@6.3.3
  `-- simplebar-core@1.3.2
    `-- lodash@4.17.21 deduped
```

`npm ls lodash --omit=dev` output after second `npm install` command (run `npm run clean` before):

```
`-- simplebar@6.3.3
  `-- simplebar-core@1.3.2
    `-- lodash@4.17.23
```

## `npm ls lodash` outputs

`npm ls lodash` output after first `npm install` command in fresh repo (run `npm run clean:all` before):

```
+-- newman@1.0.0 -> .\workspace_1
| +-- newman@6.2.2
| | +-- lodash@4.17.21 deduped
| | +-- postman-collection-transformer@4.1.8
| | | `-- lodash@4.17.21 deduped
| | `-- postman-runtime@7.39.1
| |   +-- lodash@4.17.21 deduped
| |   +-- postman-collection@4.4.0
| |   | `-- lodash@4.17.21 deduped
| |   `-- postman-sandbox@4.7.1
| |     +-- lodash@4.17.21 deduped
| |     `-- postman-collection@4.4.0
| |       `-- lodash@4.17.21 deduped
| `-- postman-collection@4.4.0
|   `-- lodash@4.17.21 deduped
+-- postman-collection@4.4.1 extraneous
| `-- lodash@4.17.21
`-- simplebar@6.3.3
  `-- simplebar-core@1.3.2
    `-- lodash@4.17.21 deduped
```

`npm ls lodash` output after second `npm install` command (run `npm run clean` before):

```
+-- newman@1.0.0 -> .\workspace_1
| +-- newman@6.2.2
| | +-- lodash@4.17.21
| | +-- postman-collection-transformer@4.1.8
| | | `-- lodash@4.17.21
| | `-- postman-runtime@7.39.1
| |   +-- lodash@4.17.21
| |   `-- postman-sandbox@4.7.1
| |     `-- lodash@4.17.21
| `-- postman-collection@4.4.0
|   `-- lodash@4.17.21
`-- simplebar@6.3.3
  `-- simplebar-core@1.3.2
    `-- lodash@4.17.23
```

See diff between first and second `npm install` in commit [d9b902f](https://github.com/Saibamen/npm-bug-repro-workspaces/commit/d9b902ff86d40dbe676338438e9c94458064c045).
