class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan/agentspan"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.7/agentspan_darwin_arm64"
      sha256 "44b8479e96268104aef0c7562f87a6020483e7ecb26b6dc80af2723908513939"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.7/agentspan_darwin_amd64"
      sha256 "88feef59a13b6835bc8bf9ade1b95ff4d42dea9be136ee73f6150638d305972d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.7/agentspan_linux_arm64"
      sha256 "fc6ad6099995249e675cb998b7965f623400dc78e0936a70a7d683e5e2d4e746"
    else
      url "https://github.com/agentspan/agentspan/releases/download/v0.0.7/agentspan_linux_amd64"
      sha256 "fcb08bc02e19467e2d844736b21d89ff1803beb7b8a93cf92489b33d08c7b4f8"
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
