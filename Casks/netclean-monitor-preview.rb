cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.43"
  sha256 arm:   "bb072125ed066c2837999f1eef4bba75fd8ac47493818eb6c4b7d868733b82af",
         intel: "0e7fee4bd8ad2a3eaca8f74b971c1f791443ca7b48757376253f3f7ba6889fc8"

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
