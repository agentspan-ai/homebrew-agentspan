class Agentspan < Formula
  desc "CLI for AgentSpan - Build, run, and manage AI agents"
  homepage "https://github.com/agentspan-ai/agentspan"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.0/agentspan_darwin_arm64"
      sha256 "a65eafcc18103d1ea1e977a652ede1cf02220299dcf3c18cc1cfcbd680b6a248"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.0/agentspan_darwin_amd64"
      sha256 "72401f27f33b93830347d83be531ce3f64fc0494d019ee4547693aa43af41819"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.0/agentspan_linux_arm64"
      sha256 "848766d00af81c603969edd375960c589caddc03d75123de5eb0f2255cf49eed"
    else
      url "https://github.com/agentspan-ai/agentspan/releases/download/v0.1.0/agentspan_linux_amd64"
      sha256 "4c696198c9ec22de7ee91bcfdf837b76b16cd5d213187cae24d3529fe9fbfcaa"
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
