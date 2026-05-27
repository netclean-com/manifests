cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.284"
  sha256 arm:   "9955d46896a4381fa2383ecb1044ab2334bddc7df088d01ea00cc4a1c371a68f",
         intel: "5484b78f46281c8549f24175f0d089f962ba95cc21f7b193a5b09a9fe4c30f4d"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
