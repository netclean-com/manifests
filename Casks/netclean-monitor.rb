cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "f8df31a471654458ec631e2d932b0d16d1ee42597e0f8f4b42099879aecf5917",
         intel: "4d0f3ee7432e01ef202f25e11afcaab48d45f52e14b5559214e6bfe3fbb19d96"

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
