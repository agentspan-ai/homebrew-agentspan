class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_arm64"
      sha256 "d969521637ab94b5060a5661c82b4bed93db119806b938e7d88e85b64a67f5e8"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_amd64"
      sha256 "7ee781fe35b4bdcc05921dd6cf2825dd56991bfb88bed5eac60f66537c7ba468"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_arm64"
      sha256 "27d388a573782c903a0ce4c2a843a0996b4b63e4523347bf92640a6971d517e0"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_amd64"
      sha256 "13d0e3adb88de63638e4bef03c8f71757d4072453867a2617e35807d7f95396e"
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
