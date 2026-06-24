class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_darwin_arm64"
      sha256 "3d971085e004b8afaf9fad300960fdc6f4fd126582d179b8579ca3b431eed834"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_darwin_amd64"
      sha256 "83b6741d85ef4e1828e5ac925605158c21e1340145f392e8d457d61e0a323c15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_linux_arm64"
      sha256 "cb8430d9675bc3e33690a47b932c49a7c353d377567ff898b5794e8873658dc5"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_linux_amd64"
      sha256 "fad91ff4588c20bd219e28b4ee994220f99a92f290d476f4fcbba6487f557e63"
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
