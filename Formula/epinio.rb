# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Epinio < Formula
  desc "CLI for Epinio, the Application Development Engine for Kubernetes"
  homepage "https://epinio.io/"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/epinio/epinio/releases/download/v1.5.0/epinio-darwin-x86_64"
      sha256 "75d89a7d554a7bd08753a3407dcef5ed19a38f329d6dd4af42b8b3699767a417"

      def install
        bin.install "epinio-darwin-x86_64" => "epinio"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/epinio/epinio/releases/download/v1.5.0/epinio-darwin-arm64"
      sha256 "8ee82e7eb56ae7e1914a2720697a279acc1035b0ef48299b00b3852d641af369"

      def install
        bin.install "epinio-darwin-arm64" => "epinio"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/epinio/epinio/releases/download/v1.5.0/epinio-linux-arm64"
      sha256 "4a7b6b18657109570400b029f49b41e0d7b8357248b23696f160033f40c865a1"

      def install
        bin.install "epinio-linux-arm64" => "epinio"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/epinio/epinio/releases/download/v1.5.0/epinio-linux-x86_64"
      sha256 "41514a13470739f64df41d594a2497ace86c6ba9b1f96d05ee08e3d4e489f838"

      def install
        bin.install "epinio-linux-x86_64" => "epinio"
      end
    end
  end

  test do
    output = shell_output("#{bin}/epinio version 2>&1")
    assert_match "Epinio Version: #{version}", output

    output = shell_output("#{bin}/epinio settings update-ca 2>&1")
    assert_match "failed to get kube config", output
    assert_match "no configuration has been provided", output
  end
end
