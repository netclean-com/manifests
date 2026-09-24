cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.5"
  sha256 arm:   "fbec106048d521643b83e99f243794b49b553709ea3667f3d531d594a64452b4",
         intel: "5b617c88e9656f8c582c667d3ccd5588fbec30fd498278ea6d359170b4ff9f9b"

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
