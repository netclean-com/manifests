cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.343"
  sha256 arm:   "8dc62708987a7c53933e20e93926950dd872e251af65badac3f5f944afb8119a",
         intel: "5b6ddf045d067ba8c7e56879b82e78d7b43c373a3e85ed2f605b772a5c5ef639"

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
