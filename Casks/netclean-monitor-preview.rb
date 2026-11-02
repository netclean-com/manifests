cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.21"
  sha256 arm:   "d38bec924c55c8b5823742c9ea9eca6acf901a6ef342ea407160ff4791d81a5a",
         intel: "611356ea8b7f7bc13ae05517207b142c30a56dbf0807064f63fea5c3bcb97b68"

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
