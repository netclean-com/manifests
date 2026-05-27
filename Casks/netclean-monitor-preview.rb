cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.283"
  sha256 arm:   "e843e764d49e5a0369492ef0cd63209cbc48a3e3fa7fc5084239b9f11ec7c56f",
         intel: "f43a42d697d58ad7a6db6c77e125a06b031ef9937630241f08d4b89f744cbbb8"

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
