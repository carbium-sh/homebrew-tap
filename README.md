# Carbium Homebrew tap

Installs `carbium`, the command line for Carbium's Solana services, on macOS and Linux (x64 and arm64).

```sh
brew install carbium-sh/tap/carbium
carbium --version
```

Installing by the full name trusts this one formula, so a plain `brew upgrade` keeps it current afterwards.

## What it installs

One file, `bin/carbium`: the prebuilt binary attached to each `cli-vX.Y.Z` release of
[carbium-sh/carbium-js](https://github.com/carbium-sh/carbium-js/releases). Homebrew checks it against the SHA-256 in
the formula and installs it as it is. Nothing is built and nothing else is installed.

Carbon Stream (`carbium stream ...`) is not in the binary, because its gRPC client is a native addon. For it, install
the npm package instead: `npm install -g carbium @triton-one/yellowstone-grpc` (Linux x64 and macOS). WebSocket
tails (`carbium ws tail ...`) work from this binary.

## Updates

`scripts/bump.sh X.Y.Z` points `Formula/carbium.rb` at release `cli-vX.Y.Z`: it sets the version and the four
download URLs, and takes each hash from that release's `SHA256SUMS`. It refuses a version that is not X.Y.Z and a
`SHA256SUMS` that lacks any of the four binaries, and leaves the formula unchanged when it does.

The `update` workflow runs daily, or by hand with a version. It takes the version npm calls latest for `carbium`, which
moves only after a release has passed the release checks in carbium-js, runs `bump.sh`, installs and tests the formula
on Linux x64 and arm64 and on macOS arm64 and Intel, and commits to `main` only when all four pass. GitHub turns a
schedule off after 60 days without a commit, so after each CLI release run
`gh workflow enable update.yml -R carbium-sh/homebrew-tap && gh workflow run update.yml -R carbium-sh/homebrew-tap`.

## Licence

MIT
