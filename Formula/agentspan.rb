class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.4.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.4/agentspan_darwin_arm64"
      sha256 "94b4de1c36a97adfbdf2c654d5fe42f34563339a82369a6c7fb1151290ac7886"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.4/agentspan_darwin_amd64"
      sha256 "49420f3c59d21b2e23b8c91ecc8dd042b24bc6b9a8a3a455ed96395ce0ff5a93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.4/agentspan_linux_arm64"
      sha256 "fad2526a9743562e1fa4a2d078c00c62b8bd00e8411c7144184c9a608bad2bfd"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.4/agentspan_linux_amd64"
      sha256 "8f66bcae541373bb6473fe0b868edf47dbeec61c6dda512d03d629e2e8a9d92d"
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
