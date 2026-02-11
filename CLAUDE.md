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
