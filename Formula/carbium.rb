class Carbium < Formula
  desc "Command-line tool for Carbium's Solana RPC, DAS, swap, DCA and token services"
  homepage "https://github.com/carbium-sh/carbium-js/tree/main/packages/cli#readme"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.1/carbium-darwin-arm64"
      sha256 "6d61a6776a0dc15087b7e16d6f3f47ffc3d76a95ff60cd2ce011721de5f1f369"
    end
    on_intel do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.1/carbium-darwin-x64"
      sha256 "5b50a9ca9f65d8a964d720758e5d2e7ed9c306812d7ebb4baa9b432578393799"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.1/carbium-linux-arm64"
      sha256 "093ec1f4b99619c528e1fe2db0c42205b81f4ca48e392a09eeb39c580e15ee8e"
    end
    on_intel do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.1/carbium-linux-x64"
      sha256 "d2cef603efc5c8553db0d1db249a575a94f7a64496cde28acdf0855be8418b29"
    end
  end

  def install
    bin.install Dir["carbium-*"].fetch(0) => "carbium"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/carbium --version").strip
  end
end
