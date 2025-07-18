const testing = @import("std").testing;

const ts = @import("tree-sitter");
const Language = ts.Language;
const Parser = ts.Parser;

extern fn tree_sitter_c() callconv(.c) *const Language;

test "can load grammar" {
    const parser = Parser.create();
    defer parser.destroy();
    try testing.expectEqual(parser.setLanguage(tree_sitter_c()), void{});
    try testing.expectEqual(parser.getLanguage(), tree_sitter_c());
}
