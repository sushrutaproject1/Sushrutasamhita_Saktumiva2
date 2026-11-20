# Word spacing and prose tagging of the manuscript transcriptions (2026-11-19)

Done by Claude for Dominik Wujastyk. 32 transcription files in the eleven `0*` folders
(kl_699, kl_699b, nak_1-1079, nak_5-333, bl_iolr_1842, j_20060, lsps_1842, pul_7082).
The vulgate files, the `provisional-edition_*` files and the `alignments/` folders were
not touched (the last two are now out of step with the transcriptions).

## Result
- 7,164 word spaces added, 1,028 misplaced spaces removed (every one listed in
  `spaces-changed.tsv`, with file, unit, source and place).
- 2,879 units retagged from `<lg><l>` or `<l>` to `<p>`, same xml:id (listed in
  `prose-and-kept-units.tsv`, with the units that were looked at and kept).
- One `<change when="2026-11-19">` added to each file's revisionDesc.
- No letter changed. Checked for every file against the original: text letters, xml:ids,
  `<pb>`, comments, header and all tags other than lg/l/p identical; `<caesura/>` count
  unchanged; well-formed XML.

## Method (the cheaper "B" route agreed with Dominik, about 3.4 M tokens)
The files were already largely word-spaced, so the text was not read through by agents.
1. **From the vulgate** (4,772 added, 637 removed). Each unit was aligned letter by letter
   with the spaced vulgate unit of the same xml:id (nasals, b/v and doubling after r
   treated as equal). Where at least two letters on both sides agree, the vulgate's
   spacing was taken. Passages standing under another id were caught by exact 10- and
   12-letter windows found anywhere in the vulgate. A witness space the vulgate lacks was
   removed without judging only if the old sed script could have made it, or the joined
   form is a word of the vulgate.
2. **Tokens that might hold two words** (2,246 added). In the stretches that differ from
   the vulgate, a model of the vulgate's spacing marked likely missing junctions; the
   9,327 different tokens concerned (not words of the vulgate) were read in context by 27
   Opus agents (`scripts/SPLIT.md`), who split 2,055 of them.
3. **Doubtful spaces** (391 removed, 146 added by moving). 1,384 different places where
   the vulgate has no space, or where the sed script could have made the space and one
   side is not a known word, were judged keep/remove/move by 4 Opus agents
   (`scripts/JUDGE2.md`): 1,019 kept, 238 removed, 127 moved. Claude read all removals
   and moves and reversed one.
An answer for a token was applied to every occurrence of that token in all files.

## Rules
Only spaces change. Sandhi forms kept; compounds and fused vowels not divided. `<pc> </pc>`,
`<caesura/>`, `<pb/>`, punctuation and all markup untouched; nothing was changed inside
`<del>`, `<note>`, `<trailer>`, `<ex>`, `<metamark>` or the first alternative of a
`<choice>`. A new space next to `<lb/>`, `<cb/>` etc. is put after the tag, before an
opening `<unclear>`/`<add>`. Elided a is spaced as the transcribers do (`so pi`, `te pi`);
fusions such as `vāpi`, `tathādhyayana` stay joined, also where the vulgate prints `vā 'pi`.

## Verse and prose
By metre alone, as asked (script `retag2.py`, the vulgate's `prose.py` with deleted text,
expansions and editorial notes left out of the scansion). More cautious than for the
vulgate, because a scribal slip breaks the metre. Kept as they were and listed:
- MIXED 298: prose lead-in with verse, or part scans;
- CAESURA 126: does not scan but has `<caesura/>`;
- HALF 142: id ends in ab/cd/ef and the unit is about the length of a half-verse;
- DAMAGED 63: doubtful and has a gap or damage;
- LEFT 29: prose but `<l>` carries attributes (mostly trailers).
Retagged: PROSE 1,857 (nothing scans) and PROSE? 1,022 (no caesura, no half scans
strictly). Chapter openings and colophons are among the prose.

## The old sed script
Its marks were in most of the larger files (`śaity a`, `paś cāt`, `vayor ūpa`). 96
removals are spaces it could have made; many more of its misplaced spaces were caught as
plain disagreements with the vulgate. Letter rules: no `tatrara` (rule 171) anywhere;
`teṣāṃ` before a vowel (rule 241) occurs 42 times and was left, since a scribe may write
it so and the manuscripts were not consulted; rule 86 leaves no trace.

## Limits
- Text that differs from the vulgate was checked only where the model marked a likely
  junction; a missing space it did not mark is still missing. On the vulgate itself the
  model finds about three quarters of all spaces.
- Misplaced spaces in the vulgate that survived its own cleaning could be copied; spaces
  between complete compound members were kept as possibly deliberate.
- No avagraha pass and no consistency pass (the last two steps of the eTexts pipeline).
- A sample was read by Claude, not a systematic proof-reading.

## Files here
`spaces-changed.tsv`, `prose-and-kept-units.tsv`, `scripts/` (lib.py, win.py, cls.py,
build.py, apply.py, retag2.py, finish.py, chk.py, the two instruction sheets, and the
agents' answers `agent-answers-split.tsv`, `agent-answers-judge.tsv`). The scripts also
need units.py, prose.py, sedsim.py, writeback2.py from `../vulgate-spacing-2026-11/scripts/`
and metre.py from eTexts `tools/spacing/`.
