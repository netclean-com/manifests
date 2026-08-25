cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.404"
  sha256 arm:   "6d0da56d648d0b1416f03e36649ba889e73de3e47971ef657a27fabb259f88a9",
         intel: "c72476ccd391c5eb04f4e0833d1d8523a958faeb02b6fddfc588a477f995275d"

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
