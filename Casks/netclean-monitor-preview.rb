cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.332"
  sha256 arm:   "0ebd66ab53c8013fcf1aaa61be9f2119b9bc8a681e7af539790dbbef88616126",
         intel: "48bb63b837815cfdf6a95178cfc4cf71db1ea807cb94b2029b3c4360300b4dd3"

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
