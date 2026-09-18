cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.18"
  sha256 arm:   "59c31cfa373a4dd7e0331a2c0477afb95394f72cf2f3e32b2f6b33bf35a2b8f2",
         intel: "6466a36c608f6fdb576fca2d90b7b8e48df8d30948e40315fea176d33b79f28c"

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
