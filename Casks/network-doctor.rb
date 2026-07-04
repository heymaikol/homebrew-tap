cask "network-doctor" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.0"
  sha256 arm:   "96fdcf5d4783a899042b16698c2583c1e23b50cdf2a3dcbb39f89f0e30d7497a",
         intel: "f56f20f639d175cba0ba007eaa1c2c405a5f28425cba76e05f51949d895d62bc"

  url "https://github.com/mplaczek99/network-doctor/releases/download/v#{version}/network-doctor_#{version}_darwin_#{arch}"
  name "network-doctor"
  desc "Terminal UI that diagnoses network connectivity and explains where the connection breaks"
  homepage "https://github.com/mplaczek99/network-doctor"

  binary "network-doctor_#{version}_darwin_#{arch}", target: "network-doctor"

  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status == 0
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}"]
    end
  end
end
