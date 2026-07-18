class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/46/44/500c4e3800219b80d494b1e59a0bc759e83ad9924915ab1c0f2299698946/create_awesome_python_app-0.2.6.tar.gz"
  sha256 "7bb18ee217959d087d898ff1f3893e1da2eedc4e69d12b369abd37e4c4a22fe7"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec
    system python, "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", buildpath.to_s
    bin.install_symlink venv/"bin/create-awesome-python-app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/create-awesome-python-app --version")
  end
end
