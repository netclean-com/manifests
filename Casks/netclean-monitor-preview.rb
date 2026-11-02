cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.23"
  sha256 arm:   "9593b009079d8638502a4f9debb4f4902175d9a63b60b9665921656894b97a8b",
         intel: "cdf26e26f297817546aca5505bdc6e567ac9054c9ad04a81b4e27d117af12c85"

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
