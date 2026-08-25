cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.399"
  sha256 arm:   "d1903ab4dd84fc46ed4f6c160e7602aa8f2ef8d33517fe8f9bd0a4c338351661",
         intel: "444c0c404abedd88d9e2fbea66e6853141c9a563326797b32abf714c46721ee1"

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
