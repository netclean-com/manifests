cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.403"
  sha256 arm:   "637fe46b0615713e6491bc3b47eff9e564406b5eca171f9fc2af3ff1d1fc3d2b",
         intel: "422c205624193bc27be3131f206dfc64bb502abb5286d11c0e3bef99f577aa3d"

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
