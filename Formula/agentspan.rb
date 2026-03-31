class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_darwin_arm64"
      sha256 "692712a53bfbe32be2c6fdb821ad3b529ce2cb7e350f296b97c905936aa5a191"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_darwin_amd64"
      sha256 "e25a50f1325982eee28e300509d2a3420126f7f5090cf2eb5e55b8dd1a499561"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_linux_arm64"
      sha256 "5da0af7ed5ebf66c0175e5b6413ddef4a312641ccadbdcfab2f6768cf1c62c3f"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_linux_amd64"
      sha256 "e0d3ac29c786d3b9fb6af0096624740c929b068a80e6e4142816cbcc1e11db9f"
    end
  end

  def install
    bin.install "agentspan_darwin_arm64" => "agentspan" if Hardware::CPU.arm? && OS.mac?
    bin.install "agentspan_darwin_amd64" => "agentspan" if Hardware::CPU.intel? && OS.mac?
    bin.install "agentspan_linux_arm64" => "agentspan" if Hardware::CPU.arm? && OS.linux?
    bin.install "agentspan_linux_amd64" => "agentspan" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/agentspan", "version"
  end
end
