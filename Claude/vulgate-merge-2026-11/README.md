# Suśruta vulgate → eTexts, step 2: the merge (2026-11-19)

`eTexts/eSushruta/susrutasamhita-full.xml` now carries, in the root text only, the word
spaces, the prose/verse division and the page breaks of the 11 vulgate-1938 files, and
202 corrected readings. Commentary and notes are untouched. Pull request:
https://github.com/sushrutaproject/eTexts/pull/10 (branch `susruta-vulgate-merge`, pushed
from Claude's workspace; the copy in the local eTexts folder is the same file, uncommitted).

## How it was done

The two texts were aligned letter by letter, chapter by chapter (all 186 chapters; the
alignment goes by the text, not by xml:id or unit number). Of 903,349 letters of eTexts
root text, 899,164 stand in the same place in the vulgate.

| | |
|---|---|
| word spaces added | 21,942 |
| verses | 8,473 `<lg>`, 13,936 `<l>` (house style of the other eTexts: one `<l>` per half-verse, `part="I/M/F"` where commentary or a unit boundary cuts a verse) |
| page breaks | 923 `<pb n="…" facs="…"/>`, 44 of them inside a word |
| readings adopted from the vulgate | 202 |
| spaces of the source removed (inside a word) | 19 |

Checks passed: only root-text lines changed; apart from the 202 readings every letter,
punctuation mark, note, xml:id and tag is as before; no existing space was removed but
those 19; the
file is valid TEI (tei_all.rng); `tools/tei2site.py` converts it with the same counts of
chapters, blocks and notes as before.

## Readings: what the comparison showed

The two transcriptions differ in 2,024 places (`differences.tsv`, one row each, with what
was done). The vulgate files are not the more accurate of the two: most differences are
slips in the vulgate files.

| differences | what was done |
|---|---|
| 604 | spelling of nasals (eTexts sañjñā, saṅkhyā, sampra-; vulgate saṃjñā, saṃkhyā, saṃpra-): eTexts kept |
| 110 | the vulgate writes out an elided vowel (`kumbhe+anyasmin` for `kumbhe'nyasmin`): eTexts kept |
| 202 | vulgate right, eTexts had a slip: vulgate reading adopted (e.g. vyāgher → vyādher; 23 times -ddh- for -d gh-, as pibeddhṛtam → pibed ghṛtam) |
| 863 | read one by one; eTexts kept. Most are slips of the vulgate files (kh → sv, bh → m, ṣ → s, n → r, ā → a, a stray a after a consonant: lesvanena, dhanavatariḥ, vyākhyāsyamaḥ); the rest could not be decided without the book |
| 202 | several differences close together (199) or new after a late change to the alignment (3): not judged, eTexts kept |
| 43 | long differences, eTexts kept: see below |

The last column of `differences.tsv` says which of the two forms occurs elsewhere in
either file; it is a hint, not a verdict (eTexts repeats some of its slips).

The sed script was not available in the two folders, so no difference is marked as
explained by a sed rule; the step 1 letter audit had already dealt with its three
letter-changing rules.

### Long differences (43): mostly gaps and repetitions in the vulgate files

In about 40 passages the vulgate file lacks text that eTexts has (20), repeats a
neighbouring passage in its place or has it in another place (21), or has a passage
twice (2). Nearly all are in the Cikitsāsthāna files. Examples: SS.4.40.6 repeats the end
of SS.4.40.10; SS.4.9.40 contains a long passage of Ci. 11 (prameha); SS.4.23.12 has
`mūtreṇa varṣabhūkaṣāyānupānaṃ vā tulyaguḍaṃ vā` twice; SS.2.6.20 lacks the half-verse
`ye yanmayāḥ smṛtā mehās…`. Filter `differences.tsv` on "long difference". These need
correcting in the vulgate files against the book.

## Things left as they are, for you to decide

- **39 eTexts spaces where the vulgate has none.** Dominik decided (2026-11-19) that those
  inside a word go: 19 were removed (`prati pītasya`, `laghu vardhanakaṃ`, `tvagbhi rvā`).
  20 were kept because the eTexts division is right or arguable and the vulgate joins two
  words (`nava skandādayaḥ`, `sapta vegā`, `tat praduṣṭaṃ`, `madhu sarpir`).
  `etexts-spaces-inside-vulgate-words.tsv` says which; `scripts/remove_spaces.json` is the list.
- **Nasal spellings** stay as eTexts has them (Dominik, 2026-11-19).
- **Misplaced spaces carried over from the vulgate.** Step 1 did not find them all, and
  the merge copies whatever is there. I removed the 35 or so that a word check turned up
  (`tamasād hy aṃ budhāḥ` → `tam asādhyaṃ budhāḥ`, `'ty arthaṃ` → `'tyarthaṃ`); others
  remain. The same places are still wrong in the vulgate files.
- **About 2,500 letters (74 stretches) had no word division from the vulgate** (text it
  lacks or has differently). I divided those by hand (`scripts/patch.py`, which holds these and the removals above: 77 places).
- **Page numbers.** 87 of the 925 `<pb>` in the vulgate files repeat the previous number
  or are out of sequence (`13a, 12b, 13a`; `24a, 15a, 25b`): `page-breaks-to-check.tsv`.
  They were copied as they are. Notes inside @n (`668, start of yonivyāpat`) were cut to
  the number; two `<pb>` standing after the last word of a chapter (6.38, 6.59: "end of
  …") were not placed. This matters for step 3.
- **Numbering.** Of 8,774 vulgate units, 30 have an xml:id whose verse number differs
  from the eTexts unit holding the same text, and 3 stand where eTexts has no number:
  `numbering-mismatches.tsv`. Nothing was renumbered.
- **Verse.** The division follows the vulgate files as retagged in step 1. 26 headings
  and colophons inside vulgate verse (`atha madyavargaḥ`, `iti …`) were kept out of
  `<lg>`; in the 27 mixed units only lines that scan are verse. A few prose lines that
  the vulgate tags as verse remain so (e.g. the definitions in Uttaratantra 65).

## Files

- `differences.tsv`: the 2,024 differences of letters.
- `etexts-spaces-inside-vulgate-words.tsv`, `numbering-mismatches.tsv`,
  `page-breaks-to-check.tsv`: as above.
- `scripts/`: `run.sh` runs `merge.py` (alignment, spaces, lg/l, pb, readings listed in
  `apply_keys.json`), `patch.py` (hand corrections), `finish.py` (header notes, checks),
  `report.py` (the lists). They need the eTexts file as it was before the merge
  (git commit of 2026-11-12) as `EFILE`.
