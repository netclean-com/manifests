cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.20"
  sha256 arm:   "411e399990159f27dc3a22676eb25ba910c7311a55f07b3b81162dc4093e7458",
         intel: "0d263ca0adccfd4a9f2b8d531bf61a4ea3961bf7da4c912856db59dead680e31"

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
