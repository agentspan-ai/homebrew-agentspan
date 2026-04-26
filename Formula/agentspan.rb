class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.9/agentspan_darwin_arm64"
      sha256 "ece9b1bbddd549db41b53dbb429f3600a71fb5567c23d9f36e004a44dc75051d"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.9/agentspan_darwin_amd64"
      sha256 "05d97bc8ee7f4dfe033d07b7e913a8f95885ed63cb38f273875deaa2608fde0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.9/agentspan_linux_arm64"
      sha256 "75a8989ff172d486795ee10dfd07a9a44bdd5ef1d3d5544f50516735662d5a3d"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.9/agentspan_linux_amd64"
      sha256 "0b392a16a910a7d0599d77d827011db8a652c5936c99b31b0b19143ed9b680c7"
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
