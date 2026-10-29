# dotfiles

Run `./init.sh` to link everything into `~`. Real files already there are kept as `.bak`.

## Claude Code

`init.sh` links `CLAUDE.md`, `settings.json` and `agents/` from `.claude/` into `~/.claude/`.

The code-graph MCP server is not part of the links. To set it up on a new machine, install Rust, then:

```sh
cargo install --git https://github.com/sdsrss/code-graph-mcp.git --tag v0.179.2 --locked code-graph-mcp
claude mcp add code-graph-mcp -s user -- "$HOME/.cargo/bin/code-graph-mcp" serve
```

Update by bumping the tag and adding `--force` to the first command.

`CLAUDE.md` calls `code-graph-mcp` from PATH (`.zshenv` adds `~/.cargo/bin`). The MCP registration uses the absolute path because Claude's own PATH may lack it.
