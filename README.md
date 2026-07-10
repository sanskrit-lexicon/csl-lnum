# csl-lnum

_Created: 15-05-2026 · Last updated: 11-07-2026_

CDSL **data-store** repository in the [Sanskrit Lexicon](https://github.com/sanskrit-lexicon) project: the dictionary data of [csl-orig](https://github.com/sanskrit-lexicon/csl-orig) exploded into **one small file per entry (`lnum`)**, so a single entry can be linked, viewed, and corrected without opening a multi-megabyte source file.

## What this repository is

Each CDSL dictionary source file (e.g. [`snp.txt`](https://github.com/sanskrit-lexicon/csl-orig/blob/master/v02/snp/snp.txt) in csl-orig) is a single large text file — some exceed 50 MB, which most editors cannot open. This repository splits each dictionary into per-entry files so an individual entry is directly addressable:

```
csl-lnum/v02/<dictcode>/<lnum>.txt
```

For example, [`v02/snp/35.txt`](https://github.com/sanskrit-lexicon/csl-lnum/blob/main/v02/snp/35.txt) is exactly the `<L>35 … <LEND>` section of `snp.txt` in csl-orig. The [`v02/`](https://github.com/sanskrit-lexicon/csl-lnum/tree/main/v02) tree currently holds **42 dictionary subdirectories** (`abch`, `ap90`, `bhs`, `gra`, `md`, `mw`, `mw72`, `pw`, `pwg`, `sch`, `skd`, `snp`, `vcp`, `wil`, … — one per CDSL dictionary code).

This design lets a stardict/display application deep-link a single entry, and lets a reader submit a correction (issue or pull request) against just that one small file rather than the whole dictionary. See the upstream motivation in [indic-dict/stardict-sanskrit#122](https://github.com/indic-dict/stardict-sanskrit/issues/122).

**csl-orig is the source of truth.** This repository is a *derived copy*: entries here are regenerated from csl-orig, and corrections accepted here are carried back into csl-orig (see the scripts below). It is not edited independently of csl-orig.

## ⚠️ Danger — do not operate on the whole tree locally

This repository contains on the order of **1.2–1.5 million files** (~370 MB). Standard whole-repo git operations will hang or overwhelm a machine:

1. **Do not run `git status` / `git pull` on the full checkout in the CLI** — indexing over a million files can lock up your computer.
2. Stage individual files directly (`git add <changed-file>`) and proceed, rather than letting git walk the entire tree.

## Scripts

Located in [`scripts/`](https://github.com/sanskrit-lexicon/csl-lnum/tree/main/scripts):

- [`txt_to_lnum.py`](https://github.com/sanskrit-lexicon/csl-lnum/blob/main/scripts/txt_to_lnum.py) — generate per-`lnum` entry files from a dictionary source. Example: `python3 txt_to_lnum.py mw` populates `v02/mw/`.
- [`redo_all.sh`](https://github.com/sanskrit-lexicon/csl-lnum/blob/main/scripts/redo_all.sh) — regenerate all dictionaries from the latest csl-orig data (`bash redo_all.sh`).
- [`lnum_to_cslorig.py`](https://github.com/sanskrit-lexicon/csl-lnum/blob/main/scripts/lnum_to_cslorig.py) — carry a correction made here back into csl-orig. Takes `dictId` and `lnum`. Example: `python3 lnum_to_cslorig.py skd 15140` integrates `v02/skd/15140.txt` into `csl-orig/v02/skd/skd.txt` (a real round-trip: [PR #3](https://github.com/sanskrit-lexicon/csl-lnum/pull/3) amended `v02/skd/15140.txt`, then this script merged the reviewed change upstream).

## Entry format

An entry file mirrors the csl-orig record verbatim, e.g. `v02/snp/35.txt`:

```
<L>35<pc>532<k1>ozWopamaPalA<k2>ozWopamaPalA
{%oṣṭhopamaphalā%}¦
<div n="lb"/>= {%bimbī.%}
<LEND>
```

## Issues overview

Snapshot 2026-07-11: **1** open, **2** closed (3 total, tracked under the tooling-repo taxonomy below).

| Milestone | Open | Closed |
|---|---:|---:|
| API Stability | 0 | 0 |
| User Experience | 1 | 0 |
| Data Quality | 0 | 0 |
| Developer Experience | 0 | 0 |
| Community | 0 | 0 |

The single open issue is [#2 "Allow better content presentation"](https://github.com/sanskrit-lexicon/csl-lnum/issues/2) (User Experience).

## GitHub issue conventions

This repository follows the [Cologne tooling-repo taxonomy](https://github.com/sanskrit-lexicon/csl-observatory/blob/main/runbook/cologne-tooling-runbook.md). Every issue carries exactly one **type**, one **severity**, and one **milestone** (see [`CLAUDE.md`](https://github.com/sanskrit-lexicon/csl-lnum/blob/main/CLAUDE.md) for the full label reference):

- **Type** (9): `bug`, `feature`, `enhancement`, `performance`, `tech-debt`, `security`, `documentation`, `infrastructure`, `question`.
- **Severity** (4): `trivial`, `minor`, `major`, `critical`.
- **Milestone** (5): API Stability, User Experience, Data Quality, Developer Experience, Community.
- **Domain labels** scoped to a data-store: `domain:schema`, `domain:migration`, `domain:integrity`, `domain:storage`.
- **Org project**: [Tooling Roadmap](https://github.com/orgs/sanskrit-lexicon/projects/9).

## License

[CC-BY-SA-4.0](https://github.com/sanskrit-lexicon/csl-lnum/blob/main/LICENSE). Part of the [Cologne Digital Sanskrit Dictionaries](https://www.sanskrit-lexicon.uni-koeln.de/) project.

---

_Dr. Mārcis Gasūns_
