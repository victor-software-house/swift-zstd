# swift-zstd

[zstd](https://github.com/facebook/zstd) as a Swift package.

The repository holds no zstd source.
`zstd/` is a git submodule pinned to an upstream release tag,
and the `zstd` library target compiles that release's `lib/common`, `lib/compress` and `lib/decompress` sources.
The dictionary builder, the legacy formats and the deprecated API are left out.
`include/module.modulemap` exposes `zstd.h` and `zstd_errors.h`.
SwiftPM checks the submodule out with the package.

## Use

```swift
dependencies: [
    .package(url: "https://github.com/victor-software-house/swift-zstd.git", exact: "0.0.1"),
],
targets: [
    .target(name: "MyTarget", dependencies: [.product(name: "zstd", package: "swift-zstd")]),
]
```

Swift imports the C interface as `import zstd`: single-frame and streaming compression and decompression.
The x86-64 assembly Huffman decoder is not built (`ZSTD_DISABLE_ASM`); its C fallback is used.

## Versions

Each release of this package pins one zstd release:

| Package | zstd |
|:--|:--|
| 0.0.1 | v1.5.7 |

## Licence

zstd is dual-licensed BSD and GPLv2; its licences are in the submodule, at `zstd/LICENSE` and `zstd/COPYING`. This package uses it under the BSD licence.
The packaging in this repository is MIT; see `LICENSE`.
