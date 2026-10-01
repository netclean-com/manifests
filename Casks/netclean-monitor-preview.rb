cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.13"
  sha256 arm:   "20fc5cd8c01dea842344187415b11459544fef29ee884dfc94b5bfd034f40d0c",
         intel: "98f6a8f8dc3ed37edf30af6a1218cc1513f91995e9c477e7ed82085275604b44"

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
