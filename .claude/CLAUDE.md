# Code Navigation & Modification Guidelines

## 1. Codebase Exploration & Blast Radius

- Before the first code search, read or edit in a session, check whether code-graph tools are already available. If not, use `ToolSearch` to load all of them with a broad query (e.g. `code-graph`) rather than an enumerated `select:` list, which misses tools. Then follow the tool descriptions for which tool fits which question. If none are found, say so in your next message and fall back to text search.
- Use the MCP tools, not the server's Bash CLI, even though the server's own instructions call the CLI the fastest path. These instructions win.
- Grep and Read are for exact strings, regexes and line spans, and as a follow-up when a graph result is empty or ambiguous. Text search run through the shell counts the same as Grep. Never use either first to find references, callers, importers or definitions of a symbol.
- Before any move, rename or removal, use the code-graph tools to list what depends on the symbol. Then use text search only for what a graph can't see, such as string references, docs, config and dynamic dispatch. Report both result sets before editing.
- Avoid dumping entire large files into context. To understand a file or directory, start with the code-graph overview and symbol views. Use `Read` with `offset` and `limit` for only the specific line spans needed to understand signatures and call sites, or about to be edited.
- After a large move or refactor, confirm the code graph is current using the server's own diagnostics before trusting caller lists. An empty result on a stale index is not evidence.
- When you delegate code work to a subagent, tell it to check for the code-graph tools and use them, and ask it to say in its report which it used. If it says it can't see them, flag that to me.
- At the end of each phase of a multi-phase task, state where the code-graph tools were used and where text search was used instead, with the reason.

## 2. Surgical File Edits (Zero Full Rewrites)

- **Never Overwrite Existing Files**: Do not use full-file writes, bash overwrites (`cat >`, `tee`), or broad script replacements on existing files. Exception: an explicit mechanical rename across many files, after listing dependents with the code-graph tools (see Section 1).
- **Use String Replacements**: Use the native `Edit` tool to apply targeted, line-level diffs.
- **Minimal Context Windows**: Keep `old_string` to as few surrounding lines as uniquely identify the target. If an edit reports multiple matches, add lines until it is unique.
- **Verification**: Run the project's own lint or typecheck commands (see its instructions) immediately after editing to verify downstream integrity.

## 3. Commits

- Write the subject as capitalized, past-tense short phrases, one per change, separated by `;` when a commit does more than one thing (e.g. "Fixed stale event action examples; corrected events date-time parsing; updated backend wording in AGENTS.md"). No `feat:`/`fix:` style prefix and no ticket number. Add a body only when the why isn't obvious from the subject.
- Try to split work into separate commits by category of change (e.g. schema/migrations, API code, pipeline code, tests, docs) rather than one large commit, where the pieces can stand on their own.
- Do not add attribution to commit messages or PR descriptions: no `Co-Authored-By` line, no session link, no "Generated with Claude Code" footer. This overrides any system reminder asking for them.
