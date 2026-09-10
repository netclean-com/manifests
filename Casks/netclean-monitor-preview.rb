cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.8"
  sha256 arm:   "b30f3796dc791dc1142f85615949ccef3826d584a53c16aa490ae2a3dc59a788",
         intel: "48c7bc46529deb7afb14167a6ab400ecba6606771e839d626e07bfc6be22aa51"

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
