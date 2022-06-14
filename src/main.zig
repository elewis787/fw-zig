const Request = @import("http").Request;
const Method = @import("http").Method;

const std = @import("std");

pub fn main() anyerror!void {
    var request = try Request.builder(std.testing.allocator)
        .method(Method.Get)
        .uri("https://ziglang.org/")
        .body("");
    defer request.deinit();
    const stdout = std.io.getStdOut().writer();
   try stdout.print("Hello, {s}!\n", .{request.method});
}

