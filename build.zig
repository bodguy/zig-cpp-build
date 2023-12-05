const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = std.builtin.Mode.ReleaseFast });
    const lib = b.addStaticLibrary(.{ .name = "cdep", .target = target, .optimize = optimize, .link_libc = true });
    lib.addIncludePath(.{ .path = "include/" });
    lib.linkLibCpp();
    lib.addCSourceFiles(&.{"src/cdep/dep.cpp"}, &.{ "-pedantic", "-Wall", "-W", "-Wno-missing-field-initializers", "-fno-exceptions", "--std=c++20" });
    b.installArtifact(lib);

    const exe = b.addExecutable(.{
        .name = "zig-cpp",
        .target = target,
        .optimize = optimize,
    });
    exe.addIncludePath(.{ .path = "include" });
    exe.linkLibCpp();
    exe.linkLibrary(lib);
    exe.addCSourceFiles(&.{"src/main.cpp"}, &.{ "-pedantic", "-Wall", "-W", "-Wno-missing-field-initializers", "-fno-exceptions", "--std=c++20" });
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
