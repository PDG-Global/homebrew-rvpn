class Rvpn < Formula
  desc "Open-source, command-line VPN client that runs over HTTPS (WebSocket/TLS)"
  homepage "https://rvpn.org"
  url "https://github.com/PDG-Global/rVPN-core/releases/download/v1.3.9/rvpn-macos-universal"
  sha256 "adbe7fb1591e483944d38fa6076c6271ae305012698ef4b208f9518b63ee0855"
  license "AGPL-3.0-or-later"
  version "1.3.9"

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
