class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.3/agentspan_darwin_arm64"
      sha256 "c7ee861bf670a8af0a25c030f8af92c085c560b52486dd5ec0c2991c644f4078"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.3/agentspan_darwin_amd64"
      sha256 "f41460ee47b7499a2a28b92f37b30fc824bbbcc4f695eb8ae75dac0fba23aa79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.3/agentspan_linux_arm64"
      sha256 "d4febb2f8641827350b5d6487d3360c64b9701a431835d69d6956c130e58dc01"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.3/agentspan_linux_amd64"
      sha256 "a25f6b5ef71cafe0bf300aea2c03c4d2d4cc02f2f381473d2f5d714c818a2628"
    end
  end

  def install
    bin.install "agentspan_darwin_arm64" => "agentspan" if Hardware::CPU.arm? && OS.mac?
    bin.install "agentspan_darwin_amd64" => "agentspan" if Hardware::CPU.intel? && OS.mac?
    bin.install "agentspan_linux_arm64" => "agentspan" if Hardware::CPU.arm? && OS.linux?
    bin.install "agentspan_linux_amd64" => "agentspan" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/agentspan", "version"
  end
end
