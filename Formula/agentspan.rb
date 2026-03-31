class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_arm64"
      sha256 "9bce909f0a59b47eac3068bb8f3cfa8a7c937a547495f7488e8919c36b3b3be5"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_amd64"
      sha256 "8bb5bd0419e6f6326c4278960decb4fed4ad63a6d8b050e73ffc5fd38e489f32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_arm64"
      sha256 "283c8e7b09f6a1054894ac5347b4985bf3c8348e9f26c1c2d54701ac241e3cd9"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_amd64"
      sha256 "ee96c96eafc22264808d5d512dee43976aa284e5e06fae117b43e0a9e549ab67"
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
