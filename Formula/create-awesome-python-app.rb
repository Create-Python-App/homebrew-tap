class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/21/9c/9ec97841f2196622060c02a9fbcdf34f7558ac0d0be996f743b00d112b29/create_awesome_python_app-0.2.8.tar.gz"
  sha256 "f41c1de9eaaf8b71c872369ea816bbbae4b5edca4344eb30257f31740783ba0c"
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
