class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.15/agentspan_darwin_arm64"
      sha256 "2ba8b83e586c73e2b224ee2bdc369eba20f5d6186012f39469a79f2e0b750352"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.15/agentspan_darwin_amd64"
      sha256 "0fcc68138aaf3f97797681dc2132f6284d667e6651b86066718665c9fe30c70e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.15/agentspan_linux_arm64"
      sha256 "4042e24d46d751b8404537e7634c21d29f3b594086a73cf87f4e3315be6f93ef"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.15/agentspan_linux_amd64"
      sha256 "5e6d29879db0ef44f8398ec9dfda47888a558d89c708aa477336e30a3e64eb2e"
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
