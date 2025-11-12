class Lot < Formula
  desc "Self-care hardware platform"
  homepage "https://github.com/vadikmarmeladov/lot-terminal"
  url "https://github.com/vadikmarmeladov/lot-terminal/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "" # Will be calculated on first release
  license "MIT"

  def install
    bin.install "bin/lot"

    # Create LOT home directory structure
    (var/"lot").mkpath
    (var/"lot/logs").mkpath
    (var/"lot/users").mkpath
    (var/"lot/hardware").mkpath
  end

  def post_install
    # Run initialization if needed
    system bin/"lot", "init" rescue nil
  end

  test do
    system bin/"lot", "version"
    system bin/"lot", "help"
  end

  def caveats
    <<~EOS
      LOT Terminal has been installed!

      Quick start:
        lot init        # Initialize your workspace
        lot help        # View all commands

      Configuration: ~/.lot/

      For more information:
        https://github.com/vadikmarmeladov/lot-terminal
    EOS
  end
end
