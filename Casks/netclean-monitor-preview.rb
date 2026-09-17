cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.16"
  sha256 arm:   "e67516639d973f1843a159d2ad50d878371e28e7a09092f71e6ba3d8719ffcdc",
         intel: "9540c401224ed4bdf3b5383e9ddab85a3b661f5494ea7ec8369cfabebc228eb9"

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
