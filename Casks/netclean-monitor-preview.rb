cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.257"
  sha256 arm:   "80f61087859cf89e4527f4613bd511d9f418c176ff4b4951393506d78523c215",
         intel: "e82747cb4c99c54d45d63ce0e3dccccf7f362d8e511b9a2bb1855e6eb8905b69"

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
