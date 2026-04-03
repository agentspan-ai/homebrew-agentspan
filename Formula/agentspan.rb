class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.1/agentspan_darwin_arm64"
      sha256 "f3700d2f6975d31c4ac964ba79b4a3674a418cedf1daf8973105a23f3c627992"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.1/agentspan_darwin_amd64"
      sha256 "5ec35eb052b514e6bfd65f3f5de9c1f3c73adec03193b19575163903535a93cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.1/agentspan_linux_arm64"
      sha256 "6804eb35d23b0b6e2db4db46a31343bbca535721d7fb082e5206bdfc5d95c68d"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.1/agentspan_linux_amd64"
      sha256 "80d12535a0e5e19ec1d0b03612f77938a40136acc4a257fc546a832b55b5bb05"
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
