cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "77760af49f544554481d170bd96fd2a03b28ef27e706cfcfa708a02c2e5d94d6",
         intel: "8ce6edb29c4df0a07a26ad77192c055f741ac91a35aff458063647e081af6d6a"

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
