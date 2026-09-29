class Rvpn < Formula
  desc "Stealth VPN command line client with end-to-end encryption"
  homepage "https://rvpn.org"
  url "https://github.com/PDG-Global/rVPN-core/releases/download/v1.3.6/rvpn-macos-universal"
  sha256 "b5d333ba3470942ecad3f88e47f3f6c01cac425fb95a9e391870270db0aba376"
  license "AGPL-3.0-or-later"
  version "1.3.6"

  def install
    bin.install "rvpn-macos-universal" => "rvpn"
  end

  service do
    run [opt_bin/"rvpn", "--config", etc/"rvpn/client.toml"]
    keep_alive true
    log_path var/"log/rvpn.log"
    error_log_path var/"log/rvpn.log"
  end

  def caveats
    <<~EOS
      rVPN needs a configuration file before first use. Create one at:
        #{etc}/rvpn/client.toml

      Generate a client identity key with:
        rvpn keygen --output identity.key

      You will also need a prekey bundle from your server. See the
      documentation at https://docs.rvpn.org for the full setup.

      TUN mode requires root. Run rvpn directly with sudo rather than
      through brew services if you use it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rvpn --version")
  end
end
