class Carbium < Formula
  desc "Command-line tool for Carbium's Solana RPC, DAS, swap, DCA and token services"
  homepage "https://github.com/carbium-sh/carbium-js/tree/main/packages/cli#readme"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.0/carbium-darwin-arm64"
      sha256 "29e98986be9e49c2f696056e8f095bb4035ec51215046fd8d62da279c326e3a5"
    end
    on_intel do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.0/carbium-darwin-x64"
      sha256 "4c807adb4b625ea19a18e8dbd6a12b0bdca123eba0005cc16f6a54ae2e681efb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.0/carbium-linux-arm64"
      sha256 "84f1b02dcfcd1880d1987f89562d7a812dfffb8fd404a9c7f48f23e1e0cc85d3"
    end
    on_intel do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.0/carbium-linux-x64"
      sha256 "38e120df6b9a224d0056d055740d975cacc42dda447aad4f5a79acc20b1a96e8"
    end
  end

  def install
    bin.install Dir["carbium-*"].fetch(0) => "carbium"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/carbium --version").strip
  end
end
