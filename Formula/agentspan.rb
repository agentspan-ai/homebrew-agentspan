class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.13/agentspan_darwin_arm64"
      sha256 "c1e80356a2f4a25bfaa9f42fe47408fe6e915bba5f8bd0cc5f342d653a889c00"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.13/agentspan_darwin_amd64"
      sha256 "7f899f5b8320938eed813b7d162951b48d960da1f766710ca07b4b68863e221b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.13/agentspan_linux_arm64"
      sha256 "9bff1b30c5be1df2d8ee67f5eb7363bbf247ce68ede78d907bb4c7d6502603f0"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.13/agentspan_linux_amd64"
      sha256 "ae3ae163b8f0f9669a8294a10c59e1f2c9e97f7bef186ff56a42a1ec013e1b72"
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
