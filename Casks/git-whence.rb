cask "git-whence" do
  version "0.3.0"
  sha256 arm:   "15a3a50039300fe614d001de103a6679c0bfcb946b891f0f02c183f74d986b2c",
         intel: "39bbceb4ba6718f74a5136063b46bf0ce2732c1137dd61971264d5b310c88bd5"

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
