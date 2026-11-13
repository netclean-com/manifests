cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.49"
  sha256 arm:   "ee64837e23d3f5f892d6de91e83830f2dd7faa15ca25369000704146b501d910",
         intel: "2cffd05330f77bd678262ef88f7bf5e9969ba0f257cfd0b35a49ddd005fed735"

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
