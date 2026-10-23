cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.15"
  sha256 arm:   "c9ebf273faaa71a23083692d31ef84ccaad4b519a71476ced42d2d105a1b5698",
         intel: "5acd54433a5b983f0a53a8d2c91b82a22af38631f160224fcd1ec42ccfcaff5b"

  url "https://cdn.netclean.cloud/releases/monitor/stable/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor"
  desc "Background monitoring daemon by NetClean Technologies AB"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated promotion workflow"
  end

  conflicts_with cask: "netclean-monitor-preview"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
