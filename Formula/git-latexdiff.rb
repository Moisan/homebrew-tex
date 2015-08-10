class GitLatexdiff < Formula
  homepage "https://gitlab.com/git-latexdiff/git-latexdiff"
  url "https://gitlab.com/git-latexdiff/git-latexdiff.git",
    :tag => "v1.1.2",
    :revision => "292602b2375360905a98d1deec5411110688b860"

  depends_on :tex
  depends_on "latexdiff"

  def install
    bin.install "git-latexdiff"
  end

  test do
    test_git_dir = testpath/"gldtest"
    test_pdf = testpath/"test.pdf"
    system "git", "clone", "https://gitlab.com/git-latexdiff/git-latexdiff.git", test_git_dir
    (test_git_dir/"tests/bib").cd do
      system "git", "latexdiff", "@~5", "--no-view", "-o", test_pdf
    end
    assert File.exist?(test_pdf)
  end
end
