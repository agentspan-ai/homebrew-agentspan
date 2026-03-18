class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_darwin_arm64"
      sha256 "2d6c66a2bedae9a8b5377825271ff4b4b6952b29b0c02206ceb65b709794204e"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_darwin_amd64"
      sha256 "14b9934b053eab94147c5188d0e052b2c5af32e3f9485c3bdb84d7588fa0f9e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_linux_arm64"
      sha256 "eb5d69050c1772afad7ac1f5c63792d2b8bcf376759b89b40d4ebe77294ff9b8"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_linux_amd64"
      sha256 "2d20a05591f76a640bd4a36e3f6edabbe5d08a1cfa97219c838a830d9d3c55b5"
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
