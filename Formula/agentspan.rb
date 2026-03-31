class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_arm64"
      sha256 "6a6ccd594a3558de3aca352d399015ae1fd5d492cee06dca35053f299298cd20"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_darwin_amd64"
      sha256 "66315775c1df4267c62970eae6bac4b47f938b45486f333a5bac5d0718b25f42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_arm64"
      sha256 "b2e80b54de3fcdd5c8240e872316c8de48e24f666aef744033033e5447cd2936"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.11/agentspan_linux_amd64"
      sha256 "5ef664b46a81a13ae59a57e565a6cc5df215f16bc61540dd57266e9c72f3b0d8"
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
