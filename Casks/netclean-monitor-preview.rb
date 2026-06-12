cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.329"
  sha256 arm:   "8016ad63b56597e8ca7193b17d6430d745f1f889ce17e4c6d362396e58e73a9f",
         intel: "d27d68ec572570155ac591661c9d8c29fd2098542f00d9c52346cd6fc04bd46b"

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
