class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.12/agentspan_darwin_arm64"
      sha256 "9928e5cf7b11ae9b7b6c05cfb3a371e28570d5e74f941fd4883f61f736e430f0"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.12/agentspan_darwin_amd64"
      sha256 "6e17461bd2e1c43fd22234059332f63019bc9ee011bf1f0c20934049bcb7297c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.12/agentspan_linux_arm64"
      sha256 "85683c3aa11753edf37f02d4372f334e62ee997700ad6185b1123e3b12b48faa"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.12/agentspan_linux_amd64"
      sha256 "7ff267fa987d5686ff93893f625684b63bd2eb43c1a8b24135930299e9b03b0c"
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
