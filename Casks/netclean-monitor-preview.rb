cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.13"
  sha256 arm:   "4038fc5b1ba3043145c3773085ec1af3f4a7d367bcd17aaf5c1d94441e7919f3",
         intel: "3133b212d8114bf4ca16d352fd5c32cba537cfdbb23ef4e3c29a1ff2e1d57f10"

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
