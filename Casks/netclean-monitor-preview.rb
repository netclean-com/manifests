cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.27"
  sha256 arm:   "f4388aa3357f9ca6964baee3358c50c7253c30bc72f1f704a8ec3faecff7008a",
         intel: "cad414a1672fa2e59b6925dab271e00823e209ab4372b38e89e9fe1135065a0a"

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
