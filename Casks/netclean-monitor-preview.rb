cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.12"
  sha256 arm:   "7826798606d56f9d353e7f288262ae1c071cab42e07fa0499806a3bc03697cb4",
         intel: "283627be963c5a775706ba841d3d4812a7ab7acb1fea84989cbaf6f07ea7611b"

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
