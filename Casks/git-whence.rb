cask "git-whence" do
  version "0.4.0"
  sha256 arm:   "a12e3c2f4737ec68b123d015c549575773ed26fff80f2f2109caea4970bb7c41",
         intel: "54d1fca8f92d89993b9b21bb654478ccc3efa13a7109241fcbed71ea8536524d"

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
