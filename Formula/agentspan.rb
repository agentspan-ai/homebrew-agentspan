class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.6/agentspan_darwin_arm64"
      sha256 "fc8ee6aac43a2ebc6cdc27f74d6153c866b56ed948a8477757192c95dcdf5efb"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.6/agentspan_darwin_amd64"
      sha256 "f94c8f8deacba4632c404c96ce85ab6914279752375463d4f62e4b4b32105673"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.6/agentspan_linux_arm64"
      sha256 "cbc1d5a18b8109d1ed7b23d0fd8777c820423752cebe4baee18fe719b767570f"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.6/agentspan_linux_amd64"
      sha256 "c219c2c3a2155f65f440989a8b646697f08a4c4af9217570fe65bde0d1894146"
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
