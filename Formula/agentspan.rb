class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_darwin_arm64"
      sha256 "583e3748b88a1f7e5e5e4eac0006120e097b79e1d7bceb8c1c7ca15d5a170d5b"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_darwin_amd64"
      sha256 "770386c48c72dcee91f9a974c7dcf6fbc79bdf3475be0ed327544835e387e79c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_linux_arm64"
      sha256 "5d0402fc5b7d965f370d808c96b32d1163def8d780f599c87f96b14211f68008"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.10/agentspan_linux_amd64"
      sha256 "9614bd87a6e88834b623f908ddc8cd6af4400972bbf4b9bc2afe1a78f784f5c6"
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
