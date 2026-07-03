cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.376"
  sha256 arm:   "651c59620c01768de4ecf1c9377b868477422f3ccaa40c7ed42d32a844bd6acc",
         intel: "880d1851c953418e5e889c41c60c4b4bd695c39ec4ca8776516e60fd69970605"

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
