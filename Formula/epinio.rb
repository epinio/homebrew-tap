# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Epinio < Formula
    desc "CLI for Epinio, the Application Development Engine for Kubernetes"
    homepage "https://epinio.io/"
    version "0.6.1"
    license "Apache-2.0"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/epinio/epinio/releases/download/v0.6.1/epinio-darwin-x86_64"
        sha256 "942cf0b7fe1d6bbca6585dacf9ec4f65c49a2dd8082921d3620c0bc8d8de09e9"
  
        def install
          bin.install "epinio-darwin-x86_64" => "epinio"
        end
      end
      if Hardware::CPU.arm?
        url "https://github.com/epinio/epinio/releases/download/v0.6.1/epinio-darwin-arm64"
        sha256 "f42490dbf71338f6c51b6deec577ca2d1452d6469d35596b4dd8b0c2255934a4"
  
        def install
          bin.install "epinio-darwin-arm64" => "epinio"
        end
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/epinio/epinio/releases/download/v0.6.1/epinio-linux-arm64"
        sha256 "753b28d91f7dd3e7b53a9245db55fc0a1c457623da2e7fa10861b074ec0e3c8e"
  
        def install
          bin.install "epinio-linux-arm64" => "epinio"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/epinio/epinio/releases/download/v0.6.1/epinio-linux-x86_64"
        sha256 "bdd8a5c31cfe30a7b7d1f61131404c8d536087ab40f3d01f8682e3154676c26a"
  
        def install
          bin.install "epinio-linux-x86_64" => "epinio"
        end
      end
    end
  
    test do
      output = shell_output("#{bin}/epinio version 2>&1")
      assert_match "Epinio Version: #{version}", output
  
      output = shell_output("#{bin}/epinio settings update 2>&1")
      assert_match "failed to get kube config", output
      assert_match "no configuration has been provided", output
    end
  end
  