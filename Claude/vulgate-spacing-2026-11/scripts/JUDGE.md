# Judging doubtful word spaces (Suśrutasaṃhitā, IAST)

A crude sed script once inserted spaces into this text by pattern (e.g. every `ity`
became `ity `, every `yor` became `yor `, `tvād` → `tvād `, `ścā` → `ś cā`,
`bhir`/`bhis` + letter → `bhir `/`bhis `, `stu ` → `s tu `, `mupa` → `m upa` …).
Most of the resulting spaces are right (`rasāś ca`, `apahared ity eṣa`), but some fell
INSIDE a word: `śaity aṃ` (śaityaṃ), `paś cāt` (paścāt), `vayor ūpa` (vayorūpa),
`tattvād higata` (tattvādhigata), `annābhir uciṃ` (annābhiruciṃ), `mas tu` (mastu,
whey), `ādity asya` (ādityasya), `sthair ya` (sthairya), `vair ecana` (vairecana).
Other stray spaces come from typing slips (`bhagavā n āpyāyate`, `kāli kāyāṃ`).

Your input `/home/claude/work/p2/in/N.tsv` has one candidate per line:
`id<TAB>context`, where the ONE space to judge is shown as `⎵`. The context is the
text as it now stands (other spaces in it are not yours to judge, though see M).

For every id write one line to `/home/claude/work/p2/out/N.tsv`:

- `id<TAB>K`  keep: the space is a real word boundary (sandhi forms are kept in this
  text: `tasminn eva`, `tac chāstram`, `ity eke`, `rasāś ca`, `-air vā`), OR it stands
  between two complete members of a compound (an editor may have put it there on
  purpose: leave those).
- `id<TAB>R`  remove: the space falls inside a word or stem, or splits a fused vowel,
  so the two pieces must simply be joined (`śaity⎵aṃ`, `paś⎵cāt`, `sthair⎵ya`).
- `id<TAB>M<TAB>old<TAB>new`  move: the space is wrong here but a real boundary lies a
  letter or two away. `old` = an exact piece of the context containing the `⎵`
  (copy it with the `⎵`); `new` = the same letters correctly spaced, e.g.
  `karmasva⎵pariniṣṭhitaḥ` → `karmasv apariniṣṭhitaḥ`. Keep `old` short (the two or
  three tokens concerned). `new` must have exactly the same letters, only spaces differ.

Decide each one by reading the Sanskrit; think about what the words are. When you
cannot tell, choose K (a wrong removal is worse than a stray space). Typos in the
text are not to be corrected. Do not judge by pattern alone: `-ity⎵e…` is right in
`vipaced ity eṣa` and wrong in `śaity⎵ena`.

When done run `python3 /home/claude/work/scripts/judgecheck.py N` until it prints OK.
Touch no other files. Reply with one line: `N done: K=…, R=…, M=…`.
