class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.6/agentspan_darwin_arm64"
      sha256 "0bfc73ffbf379444611c656c2e5fe6d71e98a12a3e5a62e7e863609796292d65"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.6/agentspan_darwin_amd64"
      sha256 "d9166202d8bc9c60eb8369653cdc20642a0e9506915564c81496854918106dc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.6/agentspan_linux_arm64"
      sha256 "6185276ccc265cb1dd3c4ca6f4f143e610553e584c962cfadea1e80896d28244"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.6/agentspan_linux_amd64"
      sha256 "609cfaace8e21140c9249fd91e188bbef34174c4e9245f4a41dbfe3dd8ec1cb3"
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
