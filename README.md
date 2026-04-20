# progress-abl-skills

**Expert Claude Code skill for developing in Progress OpenEdge ABL / Progress 4GL**

---

## What is this?

This repository contains a Claude Code skill that turns Claude into an expert Progress OpenEdge ABL developer. It includes 40+ authoritative reference files covering the full ABL language, enabling Claude to write, review, debug, and refactor ABL code with accurate syntax.

### What the skill covers

- Procedures (`.p`), include files (`.i`), classes (`.cls`)
- Queries, temp-tables, datasets (ProDataSet)
- Handle-based objects and OOP
- Error handling, transactions, locking
- String, date, calculation functions
- Input/Output, user interface, widgets
- Integration: Web Services, SOAP, AppServer
- Security, session management, XML, auditing
- OpenEdge Core assertions and collections

---

## Installation

### Claude Code (CLI)

1. Clone or download this repository
2. Run `build.sh` to generate `dist/progress-abl.skill` (or use the pre-built file)
3. Install via Claude Code:

```bash
claude skills install ./dist/progress-abl.skill
```

### Claude.ai (web)

1. Download `dist/progress-abl.skill`
2. Go to **Settings → Capabilities → Skills**
3. Upload the `.skill` file

---

## Usage

Once installed, trigger the skill by working with ABL code:

```
Write a procedure that queries all active customers and processes orders
```

```
Review this ABL class and fix the error handling
```

```
How do I define a ProDataSet with before-table tracking?
```

The skill automatically consults the reference files before writing or correcting any ABL code.

---

## Repository structure

```
.claude-plugin/
  plugin.json          # Plugin metadata
  marketplace.json     # Marketplace listing
skills/
  progress-abl/
    SKILL.md           # Skill instructions and reference index
    references/        # 40+ ABL reference files
dist/
  progress-abl.skill   # Pre-built installable package
build.sh               # Script to rebuild dist from source
```

---

## Building from source

```bash
chmod +x build.sh
./build.sh
```

Requires `zip` to be available on your system.

---

## License

MIT
