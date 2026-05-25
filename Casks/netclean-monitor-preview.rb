cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.279"
  sha256 arm:   "9389a8fcb6a46b5c84dae747195e25f936d2ef2ecf386fdcfd276fd6876d1fda",
         intel: "0083836f02e17130d0be1fd3a513b4979c51d4d8107b03849c09c526b750494f"

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
