# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**csl-lnum** provides per-entry SLP1 (original encoding) text files for every dictionary entry across the CDSL, enabling direct correction links from StarDict and other offline dictionary applications. Each file URL like `https://github.com/sanskrit-lexicon/csl-lnum/blob/main/v02/<dict>/<lnum>.txt` links to the exact dictionary entry in its original SLP1 encoding.

This is the SLP1-encoded counterpart to `csl-ldev` (which uses Devanagari). It is derived directly from `csl-orig`.

## Architecture

| Directory/File | Purpose |
|---|---|
| `v02/` | Per-dictionary subdirectories; each contains one `.txt` file per dictionary entry (named by L-number) |
| `scripts/` | Generation and integration scripts |
| `scripts/txt_to_lnum.py` | Splits a full dictionary SLP1 file into per-entry files |
| `scripts/redo_all.sh` | Regenerates all per-entry files for all dictionaries |
| `scripts/lnum_to_cslorig.py` | Integrates a user-corrected per-entry file back into `csl-orig` |

### File format

Each per-entry file (e.g., `v02/snp/35.txt`) contains the raw SLP1 CDSL-format entry:
```
<L>35<pc>532<k1>ozWopamaPalA<k2>ozWopamaPalA
...
<LEND>
```

### Correction workflow

When a user submits a pull request correcting `v02/<dict>/<lnum>.txt`:
1. Merge the PR
2. Run `python3 lnum_to_cslorig.py <dict> <lnum>` to integrate the change into `csl-orig`

### Regeneration

```bash
cd scripts
bash redo_all.sh    # regenerates v02/<dict>/ for all dictionaries
```

## Dependencies

- **Python 3**
- **csl-orig** sibling repo — SLP1 source files
