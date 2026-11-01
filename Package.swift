// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-zstd",
    products: [
        .library(name: "zstd", targets: ["zstd"]),
    ],
    targets: [
        // The upstream library sources, from the release the submodule pins: the common, compress
        // and decompress parts, without the dictionary builder, the legacy formats or the
        // deprecated API. The module map in include/ exposes zstd.h and zstd_errors.h.
        .target(
            name: "zstd",
            path: ".",
            sources: ["zstd/lib/common", "zstd/lib/compress", "zstd/lib/decompress"],
            publicHeadersPath: "include",
            cSettings: [
                // C fallbacks instead of the x86-64 assembly Huffman decoder, which SwiftPM does
                // not assemble; arm64 builds never use it.
                .define("ZSTD_DISABLE_ASM"),
            ]
        ),
        .testTarget(name: "zstdTests", dependencies: ["zstd"]),
    ]
)
