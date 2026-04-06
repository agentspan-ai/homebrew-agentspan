class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.3/agentspan_darwin_arm64"
      sha256 "6325ec28ef2cfb606672e0cf63d152b201c386b89cb40d3ec121c1d46996869f"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.3/agentspan_darwin_amd64"
      sha256 "8435d4abb294bc5a4b0ed2c48dbfcb1cec26184562c902fe94eda6236e2abadd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.3/agentspan_linux_arm64"
      sha256 "117dcb3fa2e765450a3b00f25ad13c66ca99a695bc16703b3aee0c22dadbd4ea"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.3/agentspan_linux_amd64"
      sha256 "8d0b79d9e62647c116d7b3dd7ec9dbdf85e118a78385cb16c9eb6dc195f203c6"
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
