cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "1ecdc0949a89375ab37907e2d0e0edd13f303f4ed1b4221da995c59197adc082"

  version "0.0.0"
  sha256 arm:   "25078a433897cbea6413a0423ec3e5edf7e02268203fa372c822d85fc8d2dfa1",
         intel: "1ecdc0949a89375ab37907e2d0e0edd13f303f4ed1b4221da995c59197adc082"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"

  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
   executable: "/Library/NetClean/Monitor/uninstall.sh",
   sudo:        true
 }
end