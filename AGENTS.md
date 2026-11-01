# swift-zstd: agent guidance

This repository packages upstream zstd for SwiftPM. `README.md` describes the layout and the version table.

## Rules

- Never copy zstd source into this repository. `zstd/` is a submodule pinned to an upstream release tag, and `Package.swift` compiles its `lib/common`, `lib/compress` and `lib/decompress` sources.
- Move the submodule only to an upstream release tag, never to a branch head.
- Each release pins one zstd release: move the submodule, add a row to the README version table, and tag the merged commit. The first release was `0.0.1`; bump the patch for a new zstd release, and the minor when the package's own interface breaks.
- Keep the package free of wrapper code. The one test only proves the package links and round-trips.
- CI builds and tests the package on Linux and macOS on GitHub-hosted runners; the repository is public, so they cost nothing.
