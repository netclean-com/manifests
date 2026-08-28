cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "cc9dffd4f57fd542b85de257e1936b6d0f31aaa578b83a5e10b597b7899a4013",
         intel: "57ae72f1807a92eb526e4a3944127ed370eef96c11fce949d9c0f300860ff66a"

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
