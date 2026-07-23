class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/f6/a9/45f8e5ec2af158cdaac83f6b48de48cc4c007a95f98b32df7cc3bb31a9d9/create_awesome_python_app-0.2.11.tar.gz"
  sha256 "98bf74a2f443fdeeea8a25edfcee4f9d8cd0cdf6ca18e090104e9ee8abd00412"
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
