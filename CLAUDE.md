# CLAUDE.md

This file provides context for Claude Code when working in this repository.

## Project Overview

**ctrl** is a TypeScript monorepo managed by [ctrl-page](https://github.com/ctrl-page).

## Language & Runtime

- **Language:** TypeScript
- **Runtime:** Bun

## Infrastructure

- **Nix** via `flake.nix` — use `nix develop` to enter the dev shell
- Dev shell provides: `git`, `gh` (GitHub CLI), `bun`
- Setup: run `.scripts/setup` — installs Nix and all dev dependencies
- Claude Code sessions run this automatically via SessionStart hook (`.claude/settings.json`)

## Monorepo Structure

- **Nx** orchestrates build/lint/typecheck targets (`nx.json`)
- Workspaces: `packages/apps/*`, `packages/libs/*`
- All dependencies live in the **root** `package.json` (hoisted) — nested packages must not declare their own
- `bun run build` / `bun run lint` / `bun run typecheck` to run across all packages

## Tooling

- **TypeScript-Go** (`tsgo`) for type-checking
- **Vite** for bundling
- **React** with React Compiler (`babel-plugin-react-compiler`) enabled
- **Biome** for linting & formatting (`bun run check` / `bun run format`)
- **Lefthook** for pre-commit hooks (`lefthook.yml`)
- **GritQL** for architectural linting (`.grit/`) — enforces root-only dependency declarations

## GitHub

- Use `gh` (GitHub CLI) for all GitHub operations: PRs, issues, checks, releases
- `gh` is provided by the Nix dev shell and authenticated via `GH_TOKEN` env var
