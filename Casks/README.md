# netclean-com/manifests

## How do I install these casks?

`brew install --cask netclean-com/manifests/netclean-monitor`

Or `brew tap netclean-com/manifests` and then `brew install --cask netclean-monitor`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "netclean-com/manifests"
cask "netclean-monitor"
```

### Available casks

| Cask | Description |
|---|---|
| `netclean-monitor` | Stable release |
| `netclean-monitor-preview` | Preview / pre-release channel |

> **Note:** `netclean-monitor` and `netclean-monitor-preview` conflict with each other and cannot be installed simultaneously.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
