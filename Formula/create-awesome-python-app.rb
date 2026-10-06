class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/13/20/cc78c3133863307cc268fc2413e16625966f4f5944e67c086027b23888fb/create_awesome_python_app-0.3.2.tar.gz"
  sha256 "277ae205a3dbc29fb68d5e0d837f5de658801a0beae176ac759e0b93be7104e9"
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
      If you also use `pip`, `pipx`, or `uvx`, avoid installing the same tool
      via multiple managers to prevent version conflicts.
      Example pip: `pip install create-awesome-python-app`
      Example pipx: `pipx install create-awesome-python-app`
      Example uvx: `uvx create-awesome-python-app@latest`
    EOS
  end
end
