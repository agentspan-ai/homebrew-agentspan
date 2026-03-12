class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.4/agentspan_darwin_arm64"
      sha256 "920994cbbc5d953220127d449a075cb5fa5f4f6c7c842b875654d9a9ef607d1e"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.4/agentspan_darwin_amd64"
      sha256 "96140a75f26a4beda71bca3bd448487b8dbdb6cf53446af3686eedb0b068c865"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.4/agentspan_linux_arm64"
      sha256 "8117eaeb25a7f4eb4f41058cf8fba5c42877f99025b1e8ca39e6746a4e69a37f"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.4/agentspan_linux_amd64"
      sha256 "d113a7db8592772399ef8bd5a607adfcc2135624d43563dbab6f7dfe7daf85f1"
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
