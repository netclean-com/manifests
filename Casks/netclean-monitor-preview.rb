cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.385"
  sha256 arm:   "8a0c9937884573f2035b78034d3781b284df9d8ad552824aef68b6c98809f3ae",
         intel: "2128aa6ba092956e1c275c041b75c0dc5b2c5bf495b214e67b75240e59932446"

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
