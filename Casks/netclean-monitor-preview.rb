cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.312"
  sha256 arm:   "4766e0ce5954ddb1b13e544fefa385b02efbab5414217a2ca0435ff401c99e7f",
         intel: "6b99f8e4dc2744e4fa82fab0c961a90bffd3de4093e85887eda0be09921d5927"

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
