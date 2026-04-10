class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.4/agentspan_darwin_arm64"
      sha256 "87576c6faa0941b1eacf6b50a59e3b36d8a040f00f517a851a26405076aa2a57"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.4/agentspan_darwin_amd64"
      sha256 "0bd85131065ad4ebf09f0dfd4b974f4596b7ffba108119c6d211e08e01f53f76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.4/agentspan_linux_arm64"
      sha256 "93a2c70e02d6f722ec94deee5db40889cd6194d21eb2a4fbb8c81f44ed421c68"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.4/agentspan_linux_amd64"
      sha256 "dbe696f8684e4186f480b88d8bb6975b6392c2a7c8ae2793b7f2ea163f3bffa6"
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
