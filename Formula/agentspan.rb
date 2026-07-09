class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.1/agentspan_darwin_arm64"
      sha256 "149568176a773e9fb08e9492e885a1a75683c4b312906d5014c87338d2e8a772"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.1/agentspan_darwin_amd64"
      sha256 "7742e7c3be76cd3defe29c4e99b6826c3255347cabe2a69f7b869bb8591edca6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.1/agentspan_linux_arm64"
      sha256 "fef48e38c03a93f2806e9719a4361608560971fbfdb2e912cd96f6f6507e1823"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.1/agentspan_linux_amd64"
      sha256 "024b2bf9858535ef1e612f14de98775aa8d036b1282c2e9566371e4f4e634e50"
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
