# netclean-com/manifests

Homebrew casks for [NetClean](https://www.netclean.com) software.

## Requirements

- macOS Sequoia (15) or later
- Apple Silicon (arm64) or Intel (x64)

## Installation

Add the tap and install a cask:

```sh
brew tap netclean-com/manifests https://github.com/netclean-com/manifests
brew install --cask netclean-monitor
```

Or install directly without tapping first:

```sh
brew install --cask netclean-com/manifests/netclean-monitor
```

Or via a `Brewfile`:

```ruby
tap "netclean-com/manifests", "https://github.com/netclean-com/manifests"
cask "netclean-monitor"
```

## Available casks

| Cask | Description |
|---|---|
| `netclean-monitor` | Stable release |
| `netclean-monitor-preview` | Preview / pre-release channel |

> **Note:** `netclean-monitor` and `netclean-monitor-preview` conflict with each other and cannot be installed simultaneously.

## Uninstallation

```sh
brew uninstall --cask netclean-monitor
```

## Versioning

Cask versions are managed automatically by the release pipeline. Versions are bumped via pull requests when new installer packages are published to the CDN.

## Issues and support

Please report issues in this repository's [issue tracker](https://github.com/netclean-com/manifests/issues).

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
