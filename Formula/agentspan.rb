class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.9/agentspan_darwin_arm64"
      sha256 "d8e0b47df202c9203949cef169c956e553c976ad1b7d629dc80e5a68ef08aaef"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.9/agentspan_darwin_amd64"
      sha256 "f75f1b6ef47315ad3c58d296279704541e0b1602bae5677c1f5e4ed1ba034d80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.9/agentspan_linux_arm64"
      sha256 "ede64e9a52c4cdcc297da9cf30d2682de45ddec3b553258e52e4fe1cbe4ce46a"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.9/agentspan_linux_amd64"
      sha256 "bd37216907468b742a6e555681647ec1a3e84925a4b674cf2c0ba5a891ef8836"
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
