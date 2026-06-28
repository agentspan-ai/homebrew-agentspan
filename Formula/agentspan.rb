class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.3.0/agentspan_darwin_arm64"
      sha256 "ceb2a74e24da200e30aab22dc1ef50814651045ca324a5feaacd4c3cadecfe75"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.3.0/agentspan_darwin_amd64"
      sha256 "f646aff5edddc79d0c0f347e74a93e0667a3b5aaac77135f6c80e03d153f8871"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.3.0/agentspan_linux_arm64"
      sha256 "9402568b22799628537ec800f94ee527a42372834fdbf733d9d2a1606daecee4"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.3.0/agentspan_linux_amd64"
      sha256 "9db474b8be87ea5c4931037968278fe4725e0650d2ff4ea334c9693c3d7448a4"
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
