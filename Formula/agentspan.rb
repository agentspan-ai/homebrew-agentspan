class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.0/agentspan_darwin_arm64"
      sha256 "3d074de1046d9cf5f70085e022fee45489df762daf26c5ba2223b19fcf4ce38f"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.0/agentspan_darwin_amd64"
      sha256 "41b53ed381da4a4b673c32ef40a85bb9eff29f61dd0206ad548af446e31bb8a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.0/agentspan_linux_arm64"
      sha256 "2d1d254bb7d27deeef958e331855e4b9c6cfd5efe70bf644b5b9b29f0dfcf80a"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.4.0/agentspan_linux_amd64"
      sha256 "602fb2afc7d4976e5ac73aecb6cfb9e26be325d5232616ce03f5acc09b405cc8"
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
