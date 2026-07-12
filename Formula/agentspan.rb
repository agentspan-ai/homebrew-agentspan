class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.3/agentspan_darwin_arm64"
      sha256 "44e7e34793ad54dcf6cd3edd1110be4b6fa05904c48d2ce9b1baaed05f1e378e"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.3/agentspan_darwin_amd64"
      sha256 "4aad58ee781b3393c8bee3ad09a02b494262e8a6a98c1b92e516fddc2aa15646"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.3/agentspan_linux_arm64"
      sha256 "7e7f1603e0954814d77571776f944e91dc545976ec226f8fd26c204574fcc869"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.3/agentspan_linux_amd64"
      sha256 "98b991171259af4c78c11420fb6ae8d7c8e0951e7a09b051e99feb621eb40235"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "agentspan_darwin_arm64" => "agentspan"
    elsif OS.mac?
      bin.install "agentspan_darwin_amd64" => "agentspan"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "agentspan_linux_arm64" => "agentspan"
    else
      bin.install "agentspan_linux_amd64" => "agentspan"
    end
  end

  test do
    system "#{bin}/agentspan", "version"
  end
end
