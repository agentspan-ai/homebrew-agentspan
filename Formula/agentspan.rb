class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.2/agentspan_darwin_arm64"
      sha256 "a9ca78ad4c6823770de67886062fa0ae088de4c66a872e5485254bd0999097d9"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.2/agentspan_darwin_amd64"
      sha256 "e22a7a29bc2f52820167a916c17fd5eae5d097b71e4ce48e01c529313f0670a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.2/agentspan_linux_arm64"
      sha256 "d9bdf1d2cdc38f06c1268bdc663d9c956ceb00e8a21f589cb43103eb7f518834"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.2/agentspan_linux_amd64"
      sha256 "28b5ec3dceec8a52cd1e4c51f24dda44b0cbb55de9a34da3a27891d242e0507a"
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
