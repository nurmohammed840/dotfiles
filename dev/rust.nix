{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo-nextest
    cargo-wizard
    cargo-generate
    rustup
    sccache
    mold
    clang
  ];

  home.file.".cargo/config.toml".text = ''
    # [profile.dev.package."*"]
    # opt-level = 3

    [profile.dev.build-override]
    opt-level = 3

    [profile.dev]
    debug = 0
    opt-level = 0
    strip = "debuginfo"

    [build]
    incremental = true
    rustc-wrapper = "sccache"

    [target.x86_64-unknown-linux-gnu]
    linker = "clang"
    rustflags = [
      # (Nightly) Make the current crate share its generic instantiations
      "-Zshare-generics=y",
      "-Z", "threads=16",
      "-C", "link-arg=-fuse-ld=mold",
    ]
  '';
}