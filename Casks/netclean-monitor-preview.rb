cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.302"
  sha256 arm:   "02ddbc3b327591950597bff33824a86ff205a181a14b300c3e4765765ac20a19",
         intel: "8fcd6cfecf62c6fcc0dff8c03e20cb17acf55e8b653e55531532da074fe5ebd2"

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
