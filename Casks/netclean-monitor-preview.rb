cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.335"
  sha256 arm:   "5dc947b8cfd1b034adc540f6250d97b6b9546a5a9a1f98c26e97098f5fc94ce4",
         intel: "61ff28a41157e6639eb8ddc8cfca7f06736f9f3b23939e575f4b64868da6c972"

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
