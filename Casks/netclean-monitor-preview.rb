cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.336"
  sha256 arm:   "675a782a9a5544d180eb2f2ec65b1da7480819e17f145618f0fa2d439b8cfc95",
         intel: "13e371c87b69bcd46e6ce4197a76e7cc67eaf642faa97603129c855d9ca2de10"

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
