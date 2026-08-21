cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.394"
  sha256 arm:   "ad943f9cfc0f904269d0bcb76c996434ec779f5c36b54548d34e56d9c2637a1a",
         intel: "2afcbf27c2ad72ac02098d32493a18fab5ed3e7fad15e55ab1c472ba8c91bcd1"

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
