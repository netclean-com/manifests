cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.249"
  sha256 arm:   "462e749345d7b6b6e8673432552028388af2b6c33cd6d90ba8b086b54552c3f8",
         intel: "272c01787be8bc8bbc8d44819d4f2b233f25ce3ce0dd27527b20ddb4481f8469"

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
    executable: "/Library/NetClean/Monitor/uninstall.sh",
    sudo:       true,
  }
end
