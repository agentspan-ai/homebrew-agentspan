class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.10/agentspan_darwin_arm64"
      sha256 "a1385fffff8c1972ad92432bc326b6b8b20b819ecfce766667cb5834eb361837"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.10/agentspan_darwin_amd64"
      sha256 "50a32057c1300909f669eade9d24c6a4e320178181b9a768f5bcb206b764367a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.10/agentspan_linux_arm64"
      sha256 "d10bac093ed9a7434a03d1d840800ae1bbafd099520cc432fbdf2b6c5f264108"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.10/agentspan_linux_amd64"
      sha256 "dec0e552fe8e281bf329a257301f567c4c94bfda136383343acad44a35c8ad4c"
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
