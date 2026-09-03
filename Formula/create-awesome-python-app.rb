class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/43/b3/e3189fc4fffc887b3a77a89742f86b8071ed394110301502e4db457f393b/create_awesome_python_app-0.2.12.tar.gz"
  sha256 "7cfdec7a537af4637de4647646e4dafe75e41dd269376a8c007bfb2b22262bf1"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = formula_opt_bin("python@3.12")/"python3.12"
    venv = libexec
    system python, "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", buildpath.to_s
    bin.install_symlink venv/"bin/create-awesome-python-app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/create-awesome-python-app --version")
    help = shell_output("#{bin}/create-awesome-python-app --help")
    assert_includes help, "create-awesome-python-app"
    assert_includes help, "list-templates"
  end

  def caveats
    <<~EOS
      This formula installs the Homebrew-managed `create-awesome-python-app`.
      If you also use `pipx` or `uvx`, avoid installing the same tool via both
      managers to prevent version conflicts.
      Example pipx: `pipx install create-awesome-python-app`
      Example uvx: `uvx create-awesome-python-app@latest`
    EOS
  end
end
