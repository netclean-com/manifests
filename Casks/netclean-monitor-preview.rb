cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.373"
  sha256 arm:   "54b12b857a5ebcc267d803e2b9aa9e2120233857a52546bfe4ff7074d959af9d",
         intel: "884d08a7d4ebd957f24f89a4f161d8215c9bfa2191529f0826324c2eb2152ff9"

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
