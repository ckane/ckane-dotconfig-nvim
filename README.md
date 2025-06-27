# NeoVim Config

Usage:

Clone it into your `~/.config` directory:

```sh
mkdir -p ~/.config/
cd ~/.config
git clone -b main https://github.com/ckane/ckane-dotconfig-nvim nvim
```

Install dependency packages appropriate for your OS distribution:

```text
nodejs
fzf
skim
```

Use the `Lazy`, `LazyExtras`, and `checkhealth` commands to get visibility into
which packages are disabled due to missing dependencies.

## MCPHub

The `mcphub` plugin will want to update your global `npm` installation of `mcp-hub`
using `sudo`. If you want to take advantage of this helper, edit `/etc/sudo.conf`
and add a `Path askpass ...` to point to `/usr/libexec/mcp-hub-askpass` (or wherever
your distro puts it). This will allow `mcp-hub` to point at your desired "askpass"
tool to prompt you for a `sudo` credential on-demand during update. Otherwise,
you'll have to install/update it manually with `npm -g install mcp-hub`.

## GenAI LLM Code Gneration

This configuration installs `CodeCompanion`, `Avante`, and `Copilot`/`CopilotChat`.
All three of these seem to largely coexist peacefully, though there may be
some overlap in the keyboard activation commands for them, which I will try
to resolve as I discover them. Feel free to disable any of them if you don't
want to use all 3.

The configs provided here use Copilot by default, but there are some examples
for using Azure OpenAI instead that can be utilized for further customization.
