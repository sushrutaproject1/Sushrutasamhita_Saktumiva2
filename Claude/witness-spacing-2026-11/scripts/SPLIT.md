# Missing word spaces in manuscript transcriptions of the Suśrutasaṃhitā (IAST)

Your input `/home/claude/w/s/in/NN.tsv` has one item per line: `id<TAB>context`.
In the context ONE token stands between `⟦` and `⟧`. The transcriptions are already
word-spaced, but some tokens still hold two or more words run together. Decide for
each token whether word spaces are missing INSIDE it. Most tokens (compounds, single
words) need nothing.

Write `/home/claude/w/s/out/NN.tsv` with one line `id<TAB>token with spaces added`
ONLY for the tokens you change. Tokens that stay as they are get no line.

The text between the brackets must keep exactly the same letters: you only add
spaces. Text outside the brackets is context only (`|` there marks a daṇḍa, line
division or other break; spaces outside are not yours to judge).

## What these texts are
Diplomatic transcriptions of Nepalese manuscripts. Expect: doubled consonants after r
(`sarvva`, `karmma`), `v` for `b`, `s`/`ś`/`ṣ` confusion, class nasals at word ends
(`rasañ ca`, `evaṅ kuryāt`, `tan tu`), dropped visarga, and scribal slips. Do not
correct anything. An elided `a` is written WITHOUT avagraha and the files put the
space there: `so pi`, `te pi`, `śoṇitaje rbude`, `jo yaṃ`, `upadiśyate tra`; so split
`tepi` → `te pi`, `sopi` → `so pi` (only after e/o).

## Rules (the same as for the printed text)
1. Put spaces between words, not inside compounds, however long (drug lists, disease
   lists, dvandvas, bahuvrīhis, yathāsvaṃ, yathākālam). Names of preparations are compounds.
2. Keep the sandhi forms, only insert the space: `tasminneva` → `tasminn eva`,
   `tacchāstram` → `tac chāstram`, `ityeke` → `ity eke`, `rasāśca` → `rasāś ca`,
   `dadyādbhavatāṃ` → `dadyād bhavatāṃ`, `vakṣyāmyanativistarān` → `vakṣyāmy anativistarān`,
   `tailañca` → `tailañ ca`, `kuryāttu` → `kuryāt tu`.
3. Never split where two vowels have fused into one (`cāsya`, `tathaiva`, `nātyuṣṇaḥ`,
   `neti`, `ceti`, `vāpi`, `tathādhyayana`). If a token has a fusion and a consonant
   junction, split only at the consonant junction (`rasāścaiva` → `rasāś caiva`).
4. A word ending in a vowel, anusvāra or visarga followed by a word beginning with a
   consonant is split (`nityaṃkṛsara` → `nityaṃ kṛsara`,
   `tathauṣadhyastvimāḥ` → `tathauṣadhyas tv imāḥ`, `sarppīṃṣyapicapānakān` →
   `sarppīṃṣy api ca pānakān`) only when they are clearly separate words, not members
   of a compound.
5. Particles are separate words: ca, tu, hi, vā, eva, api, iti, iva, atha, tathā, na
   (`natu` → `na tu`, `tathāca` → `tathā ca`, `yadvā` → `yad vā`, `tadyathā` → `tad yathā`,
   `ityādi` → `ity ādi`). Repeated words are split (`punaḥ punaḥ`) unless the vowels fuse.
   Kept joined: kintu, athavā, tadanu, tadanantaraṃ, kiñcit as a compound member.
6. samyak, punar, sadyas, kiñcit before a verb, participle or adjective are separate
   words (`samyag vāntaḥ`); joined as first member of a nominal compound. tat/tad: split
   as a pronoun, joined as a compound member (`tatsiddhaṃ tailaṃ`).
7. Where a doubled consonant at a junction is written once, or the token is garbled so
   that the junction is not certain, leave it joined. When in doubt, leave it.
8. A fragment (a token that is only part of a word, because the scribe or a line break
   cut it) is left alone.

## Method
Read every item and think about what the words are; do not decide by pattern. Then
write the output file (a short Python script writing a dict id → spaced token is the
easiest) and run

    python3 /home/claude/w/chk.py s NN

until it prints OK. Read only your own input file and this file; write only your own
output file (and helper scripts named with your number under /home/claude/w/s/scripts/).
Reply with one line only: `NN done: N tokens split of M`.
