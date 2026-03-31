class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_arm64"
      sha256 "855367977ff017d2ace007c92177a68337016e56d8615b1eacdd85ed8ff0a393"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_amd64"
      sha256 "df00220c1ecc5b4a9a8d92509418265a16ee3fd211b6751d5eb8ff47eebca0d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_arm64"
      sha256 "868c6036e152f1fee50bde0a3a29f81c6361d30907d9c17aba22e2a40ad9d7b1"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_amd64"
      sha256 "a6c8d2b29398de2a1d0d426a8b1a335d894440c6194137156479eed20a163c8c"
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
