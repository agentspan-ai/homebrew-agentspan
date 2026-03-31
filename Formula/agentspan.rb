class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_arm64"
      sha256 "34cdaf41277e6aaee2163d815a29db3e93f5d5ef669abbd79d8a50332acfce45"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_amd64"
      sha256 "244fff6e82ecb5df3888e8de520e387bc1e8709ee57cc84bf2a045051557a631"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_arm64"
      sha256 "232324cc57bac9d1563bd361f5449c17f0891b703967bcf564c5ba33521de611"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_amd64"
      sha256 "b0824a665f262704a5a5d9b4aebb575581f0f59c51bcbcfab431c163f656c50b"
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
