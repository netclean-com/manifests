cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.325"
  sha256 arm:   "65687259c840800c10dd8e163c237399d13becf9241c6b4c42db8edebbb6c3f6",
         intel: "5081fcb76f41bb957ad2be70195c6ea84bf4218d24d61aa2f5b8a27130eea581"

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
