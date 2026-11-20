# Suśruta vulgate → eTexts: handover (updated 2026-11-19: three steps done and merged; vulgate files corrected, not yet committed)

(Copy of the note kept in the Claude Project "eText processing", saved here 2026-11-19 so that any session that can read this folder can read it. The Project copy is the one that gets updated.)

Three-step plan agreed with Dominik, all complete:
1. Word spacing + prose/verse tagging of the 11 vulgate files — DONE 2026-11-19 (two passes and a letter audit, see below); committed and pushed by Dominik the same day
2. Merge vulgate word spaces, verse division, `<pb>` page breaks and readings into `eTexts/eSushruta/susrutasamhita-full.xml` (commentary untouched) — DONE; PR https://github.com/sushrutaproject/eTexts/pull/10 merged 2026-11-19
3. Show page numbers in eTexts search results — DONE; PR https://github.com/sushrutaproject/eTexts/pull/11 merged 2026-11-19
4. (added) Correct slips, gaps and repeats in the vulgate files from eTexts — DONE 2026-11-19; files written to Dominik's disk, to be committed and pushed by him.
Later, separately: word spacing of Ḍalhaṇa's commentary in the eTexts file.

## Files
- Vulgate files: `/home/dom/Dropbox/Xdrive/projects/sushrutaproject1/Sushrutasamhita_Saktumiva2/0?-*/0?-*-vulgate-1938*.xml` (11 files, git repo). Steps 2 and 3 did not change them; step 4 did.
- The old sed script: `Sushrutasamhita_Saktumiva2/dev2iast-spacing.sed`.
- eTexts repo: `/home/dom/Dropbox/Xdrive/projects/sushrutaproject/eTexts` (GitHub sushrutaproject/eTexts). Spacing method: `tools/spacing/` (SESSION.md, pipeline.py).
- Step 1 reports and scripts: `Sushrutasamhita_Saktumiva2/Claude/vulgate-spacing-2026-11/`.
- Step 2 report, lists and scripts: `Sushrutasamhita_Saktumiva2/Claude/vulgate-merge-2026-11/` (README.md, differences.tsv, etexts-spaces-inside-vulgate-words.tsv, numbering-mismatches.tsv, page-breaks-to-check.tsv, scripts/).
- Step 4 report, lists and scripts: `Sushrutasamhita_Saktumiva2/Claude/vulgate-corrections-2026-11/` (README.md, corrections.tsv, left-unchanged.tsv, scripts/).
- Claude has no shell on Dominik's machine: files are read and written through the desktop app, and PRs are pushed from a clone in Claude's workspace; Dominik pulls afterwards.

## Still open
- 14 eTexts slips where the vulgate is right, not yet corrected in eTexts (list in the step 4 README, group B): e.g. `ādirot` for `ādiśet` SS.2.6.23, `nghanti` for `ghnanti` SS.2.13.20, `pañcarviśatir` SS.4.29.12, `niṛuter` SS.6.60.25.
- 282 differences of letters left in the vulgate files as not clearly slips (left-unchanged.tsv, group G); many need the printed book.
- The step 4 corrections were made from eTexts, not from the page scans; the 48 hand corrections are worth a glance against the scans (pages given in corrections.tsv).
- After step 4 the verse division at some corrected places is uneven (a verse with three halves or one); the merged eTexts file is the guide.
- The 87 doubtful page numbers in the vulgate files (page-breaks-to-check.tsv); the meaning of the a/b suffix was not established. After correcting them, the `<pb>` in the eTexts file must be updated too (rerun `run.sh`, or edit @n by hand).
- Misplaced spaces left in the vulgate after step 1 were carried into eTexts; about 35 found by a word check were removed in eTexts (not in the vulgate files); others remain.
- 30 vulgate xml:ids whose verse number differs from the eTexts unit number (numbering-mismatches.tsv); nothing renumbered.
- Two vulgate `<pb>` after the last word of a chapter (6.38, 6.59, marked "end of …") were not placed; notes inside @n were cut to the number.
- Word spacing of Ḍalhaṇa's commentary.

## Step 4: vulgate files corrected (2026-11-19)
- Dominik's request: correct the ~650 slips and ~40 gaps or repeats in the vulgate files, and document it.
- 777 corrections in the 11 files, all to the eTexts reading: 729 small slips (applied by `vfix.py` from the step 2 difference list, ids in `vfix_ids.json`) and 48 larger places by hand (`hand.py`): missing passages supplied, repeated passages removed, wrong half-verses replaced. Most in Cikitsāsthāna (373), Uttaratantra (256), Nidāna (88).
- Examples: SS.4.1.4 had 502 letters of 4.1.7; SS.4.9.40 had 828 letters of 4.11.9; SS.4.40.6 had a passage of 4.40.10; the empty `<lg xml:id="SS.6.46.11ef">` was filled; stray labels `SS.1.20.`/`SS.1.23.` inside the text removed.
- Not touched: xml:ids, `<pb>`, element structure (only `<caesura/>` added or removed with a half-verse), verse numbers. One `<change when="2026-11-19">` per file.
- Left on purpose (1,247, in left-unchanged.tsv): 202 where the vulgate was right (already adopted in eTexts), 25 (14 words) where eTexts is still wrong, 604 nasal spellings, 110 written-out elided vowels, 14 bracketed alternative readings, 10 headings/colophons, 282 not clearly slips.
- Checks: all files well-formed; ids and page breaks identical; raw letter differences from eTexts fell from 6,316 to 2,185 letters and no new difference arose (`verify.py`, `recheck.py`).

## Step 3: what was done (PR #11)
- Each snippet in the search results ends with the page of the printed edition on which its hit begins ("p. 5a"), for any text whose TEI file has `<pb n/>`; at present the root text of e-Suśruta (923 breaks).
- `tools/tei-template/_includes/search-entry.json`: a page break is kept in the index text as its label between U+E000 and U+E001 (other `<sup>`s dropped as before).
- `portal/search.html`: `prepPages` removes the marks when an index arrives and records per segment the starting page and the breaks inside it; `pageAt` gives the page of a hit. Commentary takes the page of the root text before it; notes have none; the page runs on from chapter to chapter within a section.
- `portal/assets/css/style.css` (`.hit-list .pg`), README paragraph under Search.
- Tested: full build (`bundle exec ruby build.rb`, Jekyll 3.10, 7 of 7 texts) and the search page in a browser; 923 marks in the e-Suśruta indexes, none elsewhere; chapter pages with verse lines and page marks look right.
- Limits: the doubtful page numbers show as they are; a commentary hit can be one page off.

## Step 2: what was done (PR #10)
- Method: letter-by-letter alignment of the eTexts root text with the vulgate, chapter by chapter (186 chapters; by text, not by xml:id). 903,349 eTexts letters, 899,164 in the same place in the vulgate. Scripts: `merge.py` (alignment, spaces, lg/l, pb, approved readings from `apply_keys.json`, source spaces to remove from `remove_spaces.json`), `patch.py` (74 hand corrections of word division), `finish.py` (header notes, checks), `report.py` (lists), `sedcheck.py`; `run.sh` runs the first four. They need the pre-merge eTexts file (git commit of 2026-11-12) as `EFILE`.
- Result, root text only: 21,942 spaces added; 19 source spaces inside a word removed; 8,473 `<lg>`, 13,936 `<l>` (one `<l>` per half-verse, `part="I/M/F"` where a verse is cut); 923 `<pb n facs/>` (44 inside a word); 202 readings adopted; editorialDecl and revisionDesc notes added.
- Checks passed: only `ab[@type='mula']` lines changed; apart from the 202 readings and the 19 removed spaces all letters, punctuation, spaces, notes, xml:ids and tags as before; valid against tei_all.rng; `tools/tei2site.py` gives the same counts (186 chapters, 5,513 mūla blocks, 5,514 commentary blocks, 3,664 notes).

## Step 2: the main finding
The premise that the vulgate files have the better readings did not hold. Of 2,024 differences of letters: 604 are spellings of nasals (eTexts sañjñā/saṅkhyā, vulgate saṃjñā/saṃkhyā); 110 are elided vowels written out in the vulgate (`kumbhe+anyasmin`); 202 are eTexts slips (vulgate adopted; 23 are -ddh- for -d gh-); 863 were read one by one and eTexts kept (mostly vulgate slips: kh→sv, bh→m, ṣ→s, n→r, ā→a, stray a); 202 not judged (disturbed passages); 43 long differences, nearly all gaps, repetitions or misplaced passages in the vulgate files, mostly Cikitsāsthāna. Only readings judged right were adopted, all listed in differences.tsv. (The vulgate slips and gaps were corrected in step 4.)
- The sed script explains none of the differences: only rules 86, 171 and 241 change letters, step 1 had undone their effects, and no difference matches them (`sedcheck.py`).

## Step 2: Dominik's decisions (2026-11-19)
- Nasal spellings stay as eTexts has them.
- eTexts spaces that fall inside a word are to be removed: of the 39 where the vulgate has no space, 19 were removed (`prati pītasya`, `laghu vardhanakaṃ`); 20 were kept because the eTexts division is right or arguable (`nava skandādayaḥ`, `sapta vegā`, `tat praduṣṭaṃ`). etexts-spaces-inside-vulgate-words.tsv says which.

## Step 1, pass 1: spaces added, prose retagged
- 9,147 units, 1.08 M characters, 44 pieces, one Opus agent each (about 5.4 M tokens); eTexts INSTRUCTIONS.md plus notes for these files.
- 6,488 spaces added (6,464 agents, 6 avagraha, 18 from 13 consistency rules).
- 1,677 units retagged `<lg><l>`/`<l>` → `<p>` (same xml:id) by metre; 45 `<caesura/>` removed from 43 of them. 27 mixed units (prose lead-in + verse) kept as `<lg>`; 10 prose units in 05-ka left because their `<l>` has attributes. All listed in `prose-and-mixed-units.tsv`.
- One `<change>` added to each file's revisionDesc.
- Method: `combine.py` makes one unit-per-line working file; eTexts pipeline (prepare/check/assemble/avagraha/consistency/fix); `writeback2.py` carries space changes back keeping layout; `retag.py` does prose.

## Step 1, pass 2: misplaced spaces removed
- Cause: Dominik's old sed script (`dev2iast-spacing.sed`, ~240 pattern rules such as `s/ity/ity /g`, `s/yor/yor /g`, `s/tvād/tvād /g`) had split inside words (`śaity aṃ`, `paś cāt`, `vayor ūpa`). The script was never applied to the eTexts file.
- Method: `sedsim.py` replays the sed rules to find every existing space the script could have made (6,751 of 75,479); those plus fragment/pattern suspects and the spots agents had noted gave 2,515 candidates; 8 Opus agents judged each keep/remove/move (`JUDGE.md`), about 0.8 M tokens; all removals and moves were read by Claude; 11 more joined by hand from the agents' notes.
- Result: 218 changes (about 200 spaces removed, 15 moved), listed in `misplaced-spaces-removed.tsv`. Net spaces added over the original: 6,286.

## Step 1, letter audit (approved by Dominik)
- The sed script's letter-changing rules were checked against the eTexts mūla. 11 corrections made in the vulgate files: `tatrara` → `tatra` at SS.4.36.5 (rule 171), and `teṣāṃ` → `teṣām` before a vowel at SS.1.1.25.1, 1.7.4, 1.8.5, 1.20.24, 1.21.28, 1.21.33, 1.36.9, 1.42.12, 1.44.39, 1.46.55 (rule 241). Rule 86 left no trace. Recorded in the revisionDesc of the three files touched.
- Apart from these 11, step 1 left text letters, xml:ids, `<pb>` and comments identical to the originals; all files well-formed.

## Step 1: open issues
- Recall of pass 2 is not complete: misplaced spaces that match no sed rule and no pattern, and were not noted by an agent, remain (step 2 found about 35 more: see the removals in `vulgate-merge-2026-11/scripts/patch.py`).
- Typos seen and left: `toto nāḍīm`, `vijān gāś`, `tāva jīvati`, `paś ca satāṃ`.
- `+` marks at vowel junctions (`kumbhe+anyasmin`, 74 lines in six files) left as they are.
- Spaces between complete members of compounds (e.g. `vāta viṇ mūtrarodhinīm`) were kept as possibly deliberate.
