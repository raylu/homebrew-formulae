cask "git-whence" do
  version "0.4.1"
  sha256 arm:   "89bbf052d0f7caf5eb6cc6687fa6b66f561fecbb9fb564ef23834693f895d049",
         intel: "335a6e33cb851792912593fe17faaa0977d1e1d550f193d1bccf228a1e3612d3"

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
