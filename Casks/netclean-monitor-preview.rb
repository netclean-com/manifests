cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.378"
  sha256 arm:   "d8dd7e453f012565265b8069899feedeb67bd8533bdbce0b5b145ea945b88cc0",
         intel: "489d6153f753d16f5d3e9806070c3995f5bafe853daddd459ac990dd49538f06"

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
