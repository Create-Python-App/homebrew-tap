class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/62/d0/ea3e8f30ed7899c48f094213880c897584627dd7489d3dc8f07e0c163ef6/create_awesome_python_app-0.1.0.tar.gz"
  sha256 "9f49508c578b9bf030b92af37059e463ee68b4bca079600a941b7947f42b7ca9"
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
