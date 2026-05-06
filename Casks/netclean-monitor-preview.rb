cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.254"
  sha256 arm:   "a2ae6dff2f8c0b0719fdd2300c5d7265de724fe1bf6aeb58e14136788b4a288e",
         intel: "954b3f2c560a06a93c7991b02e9f9965ab77b590b2b9e3a01eefcb883bf90b04"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/Library/NetClean/Monitor/uninstall.sh",
    sudo:       true,
  }
end
