class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.5/agentspan_darwin_arm64"
      sha256 "308c2237097dc93b788bbc8f3c6b163b165d68208cc1794494ac72e7eda92b66"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.5/agentspan_darwin_amd64"
      sha256 "cffe9474a770c5c9df9dc0c969843a52963e9fdeacf79c3e191ddbc727e31e4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.5/agentspan_linux_arm64"
      sha256 "43f1328ff255d7f0c8c972be55a4cd8e6ace486025fda69a30f0648c27dfca3f"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.5/agentspan_linux_amd64"
      sha256 "7643e8e618f4aca43472d4a898cb4f86193477bc40fbda9505885b06b241f3c5"
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
