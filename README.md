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
...
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

Additionally, in order to configure additional servers beyond a couple built-in
ones, a configuration file needs to be written to `~/.config/mcphub/servers.json`.
An example of this file is located at [`mcphub/servers.json`](./mcphub/servers.json).
This configuration contains some example MCP servers I use, including the public
GitHub one. You'll need to create a new GitHub PAT and add it to the appropriate
place in the file in order to use it.

## GenAI LLM Code Gneration

This configuration installs `CodeCompanion`, `Avante`, and `Copilot`/`CopilotChat`.
All three of these seem to largely coexist peacefully, though there may be
some overlap in the keyboard activation commands for them, which I will try
to resolve as I discover them. Feel free to disable any of them if you don't
want to use all 3.

The configs provided here use Copilot by default, but there are some examples
for using Azure OpenAI instead that can be utilized for further customization.

## LazyExtras

The `lazyvim.json` in the root of this repository is the configuration file
for `LazyExtras` and should populate that with some useful plugins I have
hand-selected.
