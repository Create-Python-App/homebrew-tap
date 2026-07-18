class CreateAwesomePythonApp < Formula
  desc "Composable scaffolding CLI for production-ready Python apps"
  homepage "https://github.com/Create-Python-App/create-python-app"
  url "https://files.pythonhosted.org/packages/88/eb/a674ff890705d30c0e8edfc7ba873adc7f454768772e3936614d3e4c77bd/create_awesome_python_app-0.2.5.tar.gz"
  sha256 "879a4bafbec88acb6f3ec2880c3ce26dba7a8b7b3a372bb2f77250d85934e779"
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
