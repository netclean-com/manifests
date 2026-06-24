cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.349"
  sha256 arm:   "2571df395227973fe88c6bb5138501ef21ba83c3197a291a17a7744e14b9445a",
         intel: "e402ca804fc662e3e0c9069a1cbf45b62fd17498c9564fd2cbce40deaca1382b"

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
