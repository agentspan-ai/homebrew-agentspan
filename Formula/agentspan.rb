class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_darwin_arm64"
      sha256 "df6bc2586b7684501c2c21598f954e972f56027a209d603647f71fc02d9e0f20"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_darwin_amd64"
      sha256 "5d696a602fc2d55bacd89d652f9bbbc1a2f6461655a6a3f926d7820849d3983b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_linux_arm64"
      sha256 "4de1261c3d4e634e86d4a2d9d9f50ddc9de9c1845581bfa8e94daea321973d08"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.8/agentspan_linux_amd64"
      sha256 "7bd9db07e6fab5f17fb0191041df571b48deb7f8976a564bd38b1227b14aaff1"
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
