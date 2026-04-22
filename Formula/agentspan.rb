class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.8/agentspan_darwin_arm64"
      sha256 "fb4018d02642ab05313919d52fecb2420557e77fdc4a8419eb49f9df05717395"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.8/agentspan_darwin_amd64"
      sha256 "41e844a5d614d231f0fc4ac4e5876b1405a5e6bf6a9869af68d554b0e8c666a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.8/agentspan_linux_arm64"
      sha256 "281a0182ffb5ebd87ff7aa7a68a2f109963e875902293c56d59b326fcf5f3c10"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.8/agentspan_linux_amd64"
      sha256 "49535c179d04bfd2f5e959e0dceec282bcfd5b837fe1643070934b443a0a88db"
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
