cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.1"
  sha256 arm:   "31d56d18eb403fb3932bec7cca4eb36e2bb0811ec182105c315fe1f9af8cd3b3",
         intel: "124aba90407c643b6b37b89ccb06d7b88d8abb0dc33aca380e06c5b376337370"

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
