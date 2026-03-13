class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.5/agentspan_darwin_arm64"
      sha256 "8f7a283f666ba04a0615cfb8ab8947ae90bb73e35b00ae3ad8f7a2d95683f499"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.5/agentspan_darwin_amd64"
      sha256 "23998c8c6c935bfbb54b6d24b33fa9550c06a25a47c1070b6139493ee77e29de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.5/agentspan_linux_arm64"
      sha256 "12e3bf8f949b6f41763d477b46ee3fe0454dda7db4be0beafcadc1cf4547b3e5"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.5/agentspan_linux_amd64"
      sha256 "30c0fe24d12b9aee495ee878e32d1dede5be1c0901b829c2b310d67ba04e547c"
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
