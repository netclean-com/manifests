cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.8"
  sha256 arm:   "412e37fd6f43c99e9ecd216768857b97d9c2a9cfbeb8983618faca80bf8179a3",
         intel: "8cf3b5d48e6517af892d7f7b492f4707194d860ee39047dcaa65799454ed2eb4"

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
