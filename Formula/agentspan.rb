class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.7/agentspan_darwin_arm64"
      sha256 "b5da8331ad8402bbee84008683f5f776ade15118f6b905d09644533290790ecd"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.7/agentspan_darwin_amd64"
      sha256 "5be144efb09e5e450670ed665411317ffd3b3f904fda039b3c1b0cf40f827437"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.7/agentspan_linux_arm64"
      sha256 "83522fffffbfc8428ec88fd2b75af59ca344b7f5ea0ef36a9e780d0fa6224e57"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.7/agentspan_linux_amd64"
      sha256 "73622342ea1b6d2653c0fcfcadfc98914d7757cd543fb63a56563956c1f3c5b8"
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
