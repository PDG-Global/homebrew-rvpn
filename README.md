# homebrew-rvpn

Homebrew tap for the rVPN command line client.

rVPN is an open source stealth VPN. Traffic is end-to-end encrypted with
the Double Ratchet Algorithm and carried over WebSocket/TLS on port 443,
so it looks like ordinary HTTPS on the wire. The core is free software
under the AGPLv3: https://github.com/PDG-Global/rVPN-core

## Install

```
brew tap pdg-global/rvpn
brew trust pdg-global/rvpn
brew install rvpn
```

Homebrew asks you to trust third-party taps before it will load their
formulae; the second command does that once for this tap.

This installs the macOS command line client (`rvpn`). The graphical
macOS and iOS apps are distributed separately on the App Store and are
not available through this tap.

## After installing

rVPN needs a configuration file before first use. Create
`$(brew --prefix)/etc/rvpn/client.toml`, generate an identity key with
`rvpn keygen`, and add the prekey bundle from your server. Full setup
instructions are at https://docs.rvpn.org.

To run the client as a background service:

```
brew services start rvpn
```

TUN mode requires root; run `rvpn` directly with sudo rather than
through brew services if you use it.
