cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.255"
  sha256 arm:   "ede18d05438c4ab431fbc8d622ef51d7ddcf3a34cb0d938277ee5c52ade96f1f",
         intel: "a112b32abb410fb8d7927d72868281ad0bd2b0ff11971f93204f8603ad906e33"

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
