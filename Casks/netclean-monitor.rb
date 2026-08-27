cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.14"
  sha256 arm:   "70c6df0e066c5a86982ebc62e7a826e7bbd41b07b9095e7efa6d0368a572aacc",
         intel: "10b300a63055e05cc020a863bed22db8b5de403f317ef0d9d4d78a0b599df8dd"

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
