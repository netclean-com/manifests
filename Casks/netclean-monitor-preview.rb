cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.305"
  sha256 arm:   "3c200db29888074c7b58f3e43a8eeba9f9910d1efebf6e459e3f858da5c958bf",
         intel: "6fd7da4a1552b4b322577b6e64321ed86ea07f21988d1eb41f4df87d4d9a51f8"

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
