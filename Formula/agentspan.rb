class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_darwin_arm64"
      sha256 "52cc3753b167604de28340d645d3ef953915dc4123e9f4a63123ea8024fcf515"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_darwin_amd64"
      sha256 "724b802f5033dbfd1623b55e06a171577e594a451f3af161d7efb91ae2447809"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_linux_arm64"
      sha256 "249d211ab5db167dcb6cbde398b67325335e8abe5701de2da54996845943ba3a"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.2.0/agentspan_linux_amd64"
      sha256 "61c2bcfcbdc5f674a744400f349d90b290ba2de1e63a006a8e4855c0a267033f"
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
