{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo-nextest
    rustup
    sccache
    mold
    clang
  ];

  home.file.".cargo/config.toml".text = ''
    # [build]
    # rustc-wrapper = "sccache"

    # [profile.dev.package."*"]
    # opt-level = 3

    [target.x86_64-unknown-linux-gnu]
    linker = "clang"
    rustflags = ["-C", "link-arg=-fuse-ld=mold"]
  '';
}