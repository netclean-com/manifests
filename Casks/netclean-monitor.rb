cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.12"
  sha256 arm:   "74773eb1e0dcf822730f75412c2070986dc1a31e46573ed424fdd31baced9536",
         intel: "9714bc53846f1873fc7c245672d6716e2e27ab5253570a4fb2037dd17cc3436c"

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
