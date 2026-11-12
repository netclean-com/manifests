cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.45"
  sha256 arm:   "3a6e7ebc53b4254a5a6fe347fecc2686a6881d6a8a0bf8956f7f39604909688a",
         intel: "4997ade45aec2f1a11cc755966a925c65f3b3be4de9d54ef8ca235b1ad2ee529"

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
