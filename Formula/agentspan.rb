class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.0.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.14/agentspan_darwin_arm64"
      sha256 "e00aae0a88748ecb6212e2cdf67bf786ea18bfbb8da84b4fa4f654f6f4456960"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.14/agentspan_darwin_amd64"
      sha256 "12579a3ae9775f49e9ab14daccccd276e367679c634c2194929fc1d3bae0eb1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.14/agentspan_linux_arm64"
      sha256 "905bbc407b189a1a00bdcc2e82cdaa3afdf0761ccec774b0beafb1d4d9922cb1"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.0.14/agentspan_linux_amd64"
      sha256 "038b239f4ac3a801fdfec8ebf1144914c65aa5bd4500799d6e1a7fef6264cb09"
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
