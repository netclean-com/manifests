cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "a2b2fb2bb895efc5e1bb75b209f51dd2e384275467958ec61ef220c0ef44a9fd",
         intel: "02e36c80ff92ea1215d865b861e556f8744830656b859167a9f0da4db72d25f4"

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
