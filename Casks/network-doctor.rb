cask "network-doctor" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.0"
  sha256 arm:   "d68395ebbcbd1c1a8f65330c6af689fb1fc13b7a9256925d67093263d3a9ee42",
         intel: "d5d3b97294cdf79a4a1470cd823ab5939fc4bb29297443ba882b30a438b59687"

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
