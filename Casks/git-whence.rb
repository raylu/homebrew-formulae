cask "git-whence" do
  version "0.4.3"
  sha256 arm:   "2e7ad151313be307695fc67c7f80820f8f97dbb223c5025bc086bb10d2a65824",
         intel: "f9e2ca7bb132970259f52b5fe2bea5b3e6828d79cdedc2717d306b6149fb9d0d"

  arch arm: "aarch64", intel: "x86_64"
  url "https://github.com/raylu/git-whence/releases/download/v#{version}/git-whence-#{arch}-apple-darwin"
  name "git-whence"
  desc "Interactive tool to reblame at previous versions"
  homepage "https://github.com/raylu/git-whence"

  binary "git-whence-#{arch}-apple-darwin", target: "git-whence"

  postflight do
    system("xattr", "-d", "com.apple.quarantine", "#{staged_path}/git-whence-#{arch}-apple-darwin")
  end
end
