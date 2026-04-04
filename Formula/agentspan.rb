class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.2/agentspan_darwin_arm64"
      sha256 "0f02f20a7224e7bb6023b6c9bc910cb49c64d4d28e7ef3b07f91b5ece05a5e28"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.2/agentspan_darwin_amd64"
      sha256 "7efea90ca68a49f48f15d23a61e158f128224ef1f012a52a420d87d4eb1f6dfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.2/agentspan_linux_arm64"
      sha256 "a7f52e1c7f5087c5cd84515fbf21ad7bb40b262b2ba4e026f0ca94f4b405f441"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.2/agentspan_linux_amd64"
      sha256 "2528128a795dcb9d406fb44e04df6f91b349a08748554fb7b20d3996a1bd16e1"
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
