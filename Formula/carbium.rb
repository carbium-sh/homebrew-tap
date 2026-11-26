class Carbium < Formula
  desc "Command-line tool for Carbium's Solana RPC, DAS, swap, DCA and token services"
  homepage "https://github.com/carbium-sh/carbium-js/tree/main/packages/cli#readme"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.2/carbium-darwin-arm64"
      sha256 "e1a06486de1ed62aab35d4f47df87eaacb71929dbddd34dc06ac97eb6eb4b144"
    end
    on_intel do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.2/carbium-darwin-x64"
      sha256 "045d562363889a9334b943f304909d67f541fdbb85678476d52930a9ce527e99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.2/carbium-linux-arm64"
      sha256 "6d8a64cd6c0bcf4986a742f56ad72008e0c57dc69709b148fda0298cd060abde"
    end
    on_intel do
      url "https://github.com/carbium-sh/carbium-js/releases/download/cli-v0.1.2/carbium-linux-x64"
      sha256 "47a9e9f2fb181e9a8315a55761ec794d24474b6094f506b76f95f684793c8ec7"
    end
  end

  def install
    bin.install Dir["carbium-*"].fetch(0) => "carbium"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/carbium --version").strip
  end
end
