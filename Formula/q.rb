class Q < Formula
  include Language::Python::Virtualenv

  desc "Run SQL directly on CSV, TSV, and sqlite files"
  homepage "https://harelba.github.io/q/"
  url "https://github.com/harelba/q/archive/refs/tags/v3.1.6.tar.gz"
  sha256 "e63ba4ae49647f764c5255ad7065d2c614fdf03a2f7349a795de69529701fab8"
  license "GPL-3.0-or-later"

  depends_on "python"
  depends_on "ronn" => :build

  patch :DATA

  def install
    virtualenv_install_with_resources

    system "ronn", "--roff", "--section=1", "doc/USAGE.markdown"
    man1.install "doc/USAGE.1" => "q.1"
  end

  test do
    seq = (1..100).map(&:to_s).join("\n")
    output = pipe_output("#{bin}/q -c 1 'select sum(c1) from -'", seq)
    assert_equal "5050\n", output
  end
end

__END__
diff --git a/setup.py b/setup.py
index 6d0fac7..95cbe84 100644
--- a/setup.py
+++ b/setup.py
@@ -23,9 +23,10 @@ setup(
     ],
     package_dir={"": "bin"},
     packages=setuptools.find_packages(where="bin"),
+    py_modules=['q'],
     entry_points={
         'console_scripts': [
-            'q = bin.q:run_standalone'
+            'q = q:run_standalone'
         ]
     }
 )
