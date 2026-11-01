import Testing
import zstd

/// The package links and works: a frame round trip through the upstream library.
@Test func aFrameRoundTripReturnsTheInput() throws {
    let input = Array(String(repeating: "flowgate records connections as zstd frames. ", count: 2000).utf8)
    var compressed = [UInt8](repeating: 0, count: ZSTD_compressBound(input.count))
    let size = ZSTD_compress(&compressed, compressed.count, input, input.count, 3)
    #expect(ZSTD_isError(size) == 0)
    #expect(size > 0 && size < input.count / 10)
    var output = [UInt8](repeating: 0, count: input.count)
    let produced = ZSTD_decompress(&output, output.count, compressed, size)
    #expect(ZSTD_isError(produced) == 0)
    #expect(Array(output.prefix(produced)) == input)
}
