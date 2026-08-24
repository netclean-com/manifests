cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.398"
  sha256 arm:   "42e045bf732d9139fa30a732fab0ebcd9b2f6a3ed0c643dfcb6900bc4856d36b",
         intel: "ee4cd3592617b834f4f17f3b97ccc5c8ca1eb88bfcebd65082d1f32e11db9433"

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
