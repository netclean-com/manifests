cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.347"
  sha256 arm:   "685b4b6dd10e1309d098730ba7d770bd039b21af2c7bbf1907f3bc21613a2816",
         intel: "bde798cbbdd4e7d4fe15ed8a578045f969973ff814f6a18da6cd071b4bfa1be7"

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
