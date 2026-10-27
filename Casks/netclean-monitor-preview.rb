cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.18"
  sha256 arm:   "15b22ef0fb1ec29a77996d20697ebdf8b56532968a13f80cfd92698f85882f7e",
         intel: "500183a9a8d200bb60b77edaa7cf622d73322f3eaaf084ce94fd02f8724a7c09"

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
