#!/usr/bin/env python3
"""Repo-local helper for n00-horizons."""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent
WORKSPACE_ROOT = REPO_ROOT.parent
MASTER_CLI = WORKSPACE_ROOT / "cli.py"


def run_master(args: list[str]) -> None:
    if not MASTER_CLI.exists():
        raise SystemExit(
            f"Master CLI not found at {MASTER_CLI}. Run this command from the workspace root."
        )
    subprocess.run([sys.executable, str(MASTER_CLI), *args], check=True, cwd=WORKSPACE_ROOT)


def git_status() -> None:
    subprocess.run(["git", "status", "-sb"], check=True, cwd=REPO_ROOT)


def main() -> int:
    parser = argparse.ArgumentParser(description="n00-horizons helper CLI")
    subparsers = parser.add_subparsers(dest="command", required=True)

    preflight = subparsers.add_parser("preflight", help="Run preflight for a specific document.")
    preflight.add_argument("--path", required=True, help="Metadata document to preflight.")

    auto = subparsers.add_parser("autoresolve", help="Run metadata + link autofix loop.")
    auto.add_argument("--path", required=True, help="Metadata document to repair.")
    auto.add_argument("--apply", action="store_true", help="Persist link fixes.")

    subparsers.add_parser("radar", help="Regenerate lifecycle radar.")
    subparsers.add_parser("control-panel", help="Regenerate the control panel Markdown.")
    subparsers.add_parser("status", help="Show git status for n00-horizons.")

    args = parser.parse_args()

    if args.command == "preflight":
        run_master(["preflight", "--paths", args.path])
    elif args.command == "autoresolve":
        cmd = ["autofix-links", "--path", args.path]
        if args.apply:
            cmd.append("--apply")
        run_master(cmd)
    elif args.command == "radar":
        run_master(["radar"])
    elif args.command == "control-panel":
        run_master(["control-panel"])
    elif args.command == "status":
        git_status()
    else:  # pragma: no cover - safety net
        parser.print_help()
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
