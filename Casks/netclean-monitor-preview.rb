cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.311"
  sha256 arm:   "cba632f1668d1f9661bb3371c5bfd615ae7d520a9fbbb66874fd88c6ae48e735",
         intel: "da0b8f885c8630591f6b7719456c4edfc2cf14bce65b463159b98563588f50d4"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: :sequoia
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
