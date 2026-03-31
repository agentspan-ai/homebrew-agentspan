class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.1/agentspan_darwin_arm64"
      sha256 "674d355a769f259f616a43b1ae06135b0b487fd1a7433301b95800f0b99558fa"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.1/agentspan_darwin_amd64"
      sha256 "ec8d07c3e23eed083b4a305da2076aab9e5a693c9542d42413349548fca554f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.1/agentspan_linux_arm64"
      sha256 "5f9234d540e5c949c7b5c8680f06a65a3ad1d57278e834a0faef654063c17fe6"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.1/agentspan_linux_amd64"
      sha256 "c98908145f27851e7eb1c6ce6310d0d522abb206b4d6bd87f17ddebe51d6bc58"
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
