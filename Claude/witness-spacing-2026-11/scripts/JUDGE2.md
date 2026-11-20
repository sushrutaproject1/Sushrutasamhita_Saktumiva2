# Doubtful word spaces in manuscript transcriptions of the Suśrutasaṃhitā (IAST)

Your input `/home/claude/w/j/in/NN.tsv` has one item per line: `id<TAB>context`.
Between `⟦` and `⟧` stand two tokens with ONE space between them, shown as `⎵`. That
space is doubtful: either a crude sed script may have put it there by pattern (every
`ity` became `ity `, `yor` → `yor `, `tvād` → `tvād `, `ścā` → `ś cā`, `bhir`+letter →
`bhir `, `stu ` → `s tu `, `mupa` → `m upa` …), or the printed text has no space at
this place. Most such spaces are right (`rasāś ca`, `apahared ity eṣa`, `bastīs tu`),
but some fall INSIDE a word: `śaity⎵aṃ` (śaityaṃ), `paś⎵cāt` (paścāt), `vayor⎵ūpa`
(vayorūpa), `tattvād⎵higata`, `annābhir⎵uciṃ`, `mas⎵tu` (mastu, whey), `ādity⎵asya`,
`sthair⎵ya`, `vair⎵ecana`.

Write `/home/claude/w/j/out/NN.tsv` with one line for EVERY id:

- `id<TAB>K`  keep: a real word boundary (sandhi forms are kept in this text:
  `tasminn eva`, `tac chāstram`, `ity eke`, `-air vā`), OR the space stands between two
  complete members of a compound (the transcriber may have meant it: leave those;
  but an avyayībhāva such as `yathā⎵kālam`, `yathā⎵svaṃ` is one word: R).
- `id<TAB>R`  remove: the space falls inside a word or stem, or splits a fused vowel;
  the two pieces are simply joined.
- `id<TAB>M<TAB>new`  move: the space is wrong here but a real boundary lies elsewhere
  in these two tokens. `new` = all the letters between the brackets, correctly spaced
  (one or more spaces), e.g. for `⟦karmasva⎵pariniṣṭhitaḥ⟧` write
  `karmasv apariniṣṭhitaḥ`. Exactly the same letters, only spaces differ.

These are diplomatic transcriptions of Nepalese manuscripts: doubled consonants after r
(`sarvva`), `v` for `b`, sibilant confusion, class nasals at word ends (`rasañ ca`),
scribal slips; nothing is to be corrected. An elided `a` is written without avagraha
and with a space: `so pi`, `śoṇitaje rbude`, `tathā⎵dhyayana` is however a fusion (R).
Text outside the brackets is context only (`|` marks a daṇḍa or other break).

Decide each one by reading the Sanskrit; think about what the words are, do not judge
by pattern alone: `-ity⎵e…` is right in `vipaced ity eṣa` and wrong in `śaity⎵ena`.
When you cannot tell, choose K (a wrong removal is worse than a stray space).

When done run `python3 /home/claude/w/chk.py j NN` until it prints OK. Read only your
own input file and this file; write only your own output file. Reply with one line
only: `NN done: K=…, R=…, M=…`.
