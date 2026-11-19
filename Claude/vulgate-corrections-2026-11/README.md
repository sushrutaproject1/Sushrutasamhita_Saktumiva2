# Corrections to the vulgate-1938 files, 19 November 2026

Made by Claude at Dominik's request, following the comparison of these files with the
eTexts transcription (`sushrutaproject/eTexts`, `eSushruta/susrutasamhita-full.xml`)
described in `../vulgate-merge-2026-11/README.md`.

## What was done

**777 corrections** in the eleven `*-vulgate-1938*.xml` files:

- **729 small slips** (one to a few letters: a wrong, missing, extra or transposed letter),
  e.g. `dāridvyād` → `dāridryād`, `aṣtau` → `aṣṭau`, `samuddhered` → `samuddhared`.
- **48 larger places corrected by hand**: passages missing from the file, passages typed
  twice, and half-verses where a line from elsewhere in the chapter had been typed in place of the
  right one. They are listed in full below.

In every case the corrected text is the eTexts reading. Word spaces in new text follow the
merged eTexts file. Each file has a new `<change when="2026-11-19">` entry in its
`revisionDesc` giving its number of corrections.

| file | corrections |
|---|---|
| 01-su-vulgate-1938-1-31.xml | 22 |
| 01-su-vulgate-1938-32-end.xml | 3 |
| 02-ni-vulgate-1938.xml | 88 |
| 03-za-vulgate-1938.xml | 4 |
| 04-ci-vulgate-1938_01-20.xml | 206 |
| 04-ci-vulgate-1938_21-40.xml | 167 |
| 05-ka-vulgate-1938.xml | 31 |
| 06-ut-vulgate-1938-01-26.xml | 75 |
| 06-ut-vulgate-1938-27-37.xml | 16 |
| 06-ut-vulgate-1938-39-24-57.xml | 126 |
| 06-ut-vulgate-1938-58-38-66.xml | 39 |

**Every correction is listed in `corrections.tsv`** (file, xml:id, page of the 1938 edition,
text before, text now).

## What was not touched

- No `xml:id`, no `<pb>`, no element was added, removed or moved, with three kinds of exception:
  `<caesura/>` was added or removed where a half-verse was added or removed (net: 02-ni +2,
  04-ci 1-20 −1, 04-ci 21-40 +1, 06-ut 01-26 +2, 06-ut 39… +1), and the empty
  `<lg xml:id="SS.6.46.11ef"><l/></lg>` now holds its half-verse.
- Verse numbers and the division into `<lg>`/`<l>` were left as they were. Where a half-verse was
  added, the verse it stands in may now have three halves; where one was removed, one.
  The division in the merged eTexts file is the better guide.
- **1,247 differences from eTexts remain, on purpose.** They are listed in `left-unchanged.tsv`
  with the reason:

| | number | reason |
|---|---|---|
| A | 202 | the vulgate was right; eTexts was corrected from it during the merge |
| B | 25 (14 words) | the vulgate is probably right; eTexts not yet corrected (list below) |
| C | 604 | spelling of a nasal (ṃ or class nasal) |
| D | 110 | the vulgate writes out an elided a/ā |
| E | 14 | the vulgate records an alternative reading in brackets, e.g. `dṛṣṭāḥ(diṣṭāḥ)` |
| F | 10 | a heading or colophon worded differently |
| G | 282 | not a clear slip: could be a true reading of the 1938 edition, or I could not decide |

## A caution

The corrections were made **from the eTexts transcription, not from the printed page**. eTexts
(NIIMH) transcribes the same 1938 edition, and I corrected only where the vulgate file's reading
was no Sanskrit word, broke the metre or sense, or repeated or dropped text. But where the two
transcriptions differ, only the page scans can finally decide. The page number in `corrections.tsv`
(the `n` of the preceding `<pb>`) is there for that purpose. The 48 hand corrections are the ones
most worth a glance.

## The 48 hand corrections

`¦` stands for the tags between verses or paragraphs (unchanged); `…` marks an omitted middle.
Full text of each is in `corrections.tsv`.

| xml:id | before | now |
|---|---|---|
| SS.1.21.33 | SS.1.20. | — |
| SS.1.24.9 | SS.1.23. | — |
| SS.1.37.14 | \|\|13\|\| ¦ ¦ | \|\|13\|\| ¦ kaṭutrikaṃ |
| SS.2.3.8 | arivṛddhiṃ pr | r |
| SS.2.6.20 | \|\| ¦ ¦ | \| ¦ ye yanmayāḥ smṛtā mehās teṣām etās tu tatkṛtāḥ \|\| ¦ ¦ |
| SS.2.13.44 | ya | śyāmaṃ vā ya |
| SS.2.16.42 | abdho lohiṃ | hūlas todadāhaprapākī prāguktābhyāṃ tuṇḍikerī matā tu \| ¦ śophaḥ stabdho lohi |
| SS.4.1.4 | ceti śleṣmaśoṇitābhyāṃ, sphuraṇatodadāhadhūmāyanaprāyaḥ …  suvyavasthito nirāsrāvaś ceti śuddho vraṇa iti \|\| ¦ do | pittavac chītakriyāvacāraṇavidhiviśeṣaḥ sandhānārthaṃ c … laṃ tu doṣopaplavaviśeṣāc chārīravat pratīkāraḥ \|\| ¦ do |
| SS.4.1.85 | pūrayet \| ¦ kāsīsaṃ rocanāṃ tutthaṃ haritālaṃ manaḥśilām \|\| ¦ m | kārayet \|\| ¦ m |
| SS.4.2.16 | saṃgṛhya samutthāpya mahābalāḥ \| ¦ bhavaty antaḥpraveśas tu yathā nirdhunuyus tathā \|\| ¦ ā | chardayet punaḥ \|\| ¦ ā |
| SS.4.6.13 | a | ān vā kulmāṣān bhakṣayet, citrakamūlakṣārodakasiddha |
| SS.4.9.9 | sumatisrutasya kṣārasya kalpena tu saptakṛtvaḥ \| tailaṃ … na caturguṇena śvitrāpahaṃ mrakṣaṇam etad agryam \|\| ¦ ¦ | bheṣajāny ardhapalikāni trāyamāṇāmustendrayavacandanaki … arpaṣāṇḍhyaśamanam ūrdhvajatrugatarogaghnaṃ ceti \|\| ¦ ¦ |
| SS.4.9.24 | agvayitvā \| ¦ \| ¦ kuṣṭhāvalgujabhallātakṣīriṇīsarṣapāḥ sruhī \|\| ¦ ¦ | āvayitvā \| ¦ sampracchitaṃ tad bahuśaḥ kilāsaṃ tailena siktaṃ kaṭunā prayāti \|\| ¦ ¦ |
| SS.4.9.40 | pāṭhā 'guruharidrākaṣāyaṃ, piṣṭamehinaṃ haridrādāruhari … asiddhāṃ yavāgūṃ kṣīrekṣurasamadhurāṃ pāyayet \|\| ¦ asmā | nāḍīvraṇāṃś ca \|\| ¦ asmā |
| SS.4.10.9 | \|\| ¦ p | \|\| ¦ ato 'valehān vakṣyāmaḥ- khadirāsananimbarājavṛkṣaśālasārakvāthe tatsārapiṇḍāñ chlakṣṇapiṣṭān p |
| SS.4.11.9 | — | vaijayantīkaṣāyaṃ, surāmehinaṃ nimbakaṣāyaṃ, sikatāmehinaṃ |
| SS.4.11.9 | th | parśākaṣāyaṃ madhumadhuraṃ hastyaśvaśūkarakharoṣṭrāsth |
| SS.4.17.4 | sadantīn surāṣṭrajāsaindhavasaṃprayuktān \| prakṣālane cāpi karañjanimbajātyakṣapīlusvarasāḥ prayojyāḥ \|\| ¦ y | śṛteṣu \|\| ¦ y |
| SS.4.17.33 | \|\| ¦ sū | \|\| ¦ arbudādiṣu cotkṣipya mūle sūtraṃ nidhāpayet \| ¦ sū |
| SS.4.17.44 | pi | vacām ativiṣāṃ suradāru pāṭhāṃ mustādikaṃ madhurasāṃ kaṭurohiṇīṃ ca \| ¦ dhātrī pi |
| SS.4.18.3 | kāryāḥ pittārbude kāyavirecanaṃ ca \| ¦ vighṛṣya codumbaraśākagojīpatrair bhṛśaṃ kṣaudrayutaiḥ pralimpet \|\| ¦ ¦ | vidhijñaḥ \| ¦ rakṣed balaṃ cāpi narasya nityaṃ tad rakṣitaṃ vyādhibalaṃ nihanti \|\| ¦ ¦ |
| SS.4.21.8 | bhadhuraiḥ | madhuraiḥ |
| SS.4.22.3 | dantavaidarbhe dantamūlāni śodhayet \| ¦ tataḥ ksāraṃ prayuñjīta kriyāḥ sarvāś ca śītalāḥ \|\| ¦ v | kuryān nāḍīsvedaṃ ca buddhimān \|\| ¦ v |
| SS.4.22.29 | ca sthānaṃ vidahet suṣirasya ca \| ¦ tato vidārīyaṣṭyāhvaśṛṅgāṭakakaserukaiḥ \|\| ¦ ra | samūle sthirabandhane \|\| ¦ ra |
| SS.4.23.12 | abhūkaṣāyānupānaṃ vā, tulyaguḍaṃ vā mūtreṇa varṣa | ā |
| SS.4.25.29 | vipaced vimiśraṃ rasena bhṛṅgatriphalābhavena \| ¦ āsann … ca parīkṣaṇārthaṃ patraṃ balākābhavam ākṣipec ca \|\| ¦ a | ghaṭe sadmani sāpidhāne \|\| ¦ a |
| SS.4.26.34 | ṃ | m apy evaṃ kṣīreṇottamam iṣyate \| ¦ śatāvaryuccaṭācūrṇaṃ |
| SS.4.27.8 | — | ārthe, ajakarṇakaṣāyam utsādanārthe, sośīraṃ kūpodakaṃ snān |
| SS.4.29.29 | \|\| ¦ haṣṭhavat plavate tatra candramāḥ somasattamaḥ \| ¦ tasyoddeśeṣu cāpy anti muñjavān aṃśumān api \|\| ¦ ¦ | \|\| ¦ pañca teṣām adho madhye sindhunāmā mahānadaḥ \| ¦ haṭhavat plavate tatra candramāḥ somasattamaḥ \|\| ¦ ¦ |
| SS.4.30.39 | \| | \| ¦ gajāloḍitatoyābhir āpagābhiḥ samantataḥ \| ¦ |
| SS.4.31.8 | yākakalpaḥ\| snehāc caturbhāgāvaśiṣṭaṃ kvāthayitvā+apahared ity eṣa kaṣāyapākaka | pākaka |
| SS.4.33.31 | \|\| ¦ virecanair | \|\| ¦ atyarthapittābhiparītadehān virecayet tān api mandamandam \| ¦ virecanair |
| SS.4.34.10 | da | balaṃ cāvekṣya bhūyo mātrāṃ vidadhyāt \| apravṛttadoṣaṃ da |
| SS.4.34.12 | , t | , hanusaṃhanane vātaśleṣmaharaṃ nasyaṃ svedāṃś ca vidadhyāt, t |
| SS.4.36.42 | vā savāte cānuvāsanaḥ \|\| ¦ ¦ | cāṅgapīḍanam \|\| ¦ ¦ |
| SS.4.40.6 | thire samāhite śarāve prakṣipya vartiṃ mūlacchidreṇānye …  pāyayed ādoṣaviśuddheḥ; eṣa dhūmapānopāyavidhiḥ \|\| ¦ m | nehāktadīptāgrāṃ vartiṃ netrasrotasi praṇidhāya dhūmaṃ pibet \|\| ¦ m |
| SS.6.4.2 | athovāca | yathovāca |
| SS.6.14.11 | \|\| ¦ ¦ | \|\| ¦ āpākād vidhinoktena pañcamedyān upācaret \| ¦ |
| SS.6.22.9 | va | dvimārgaṃ va |
| SS.6.23.2 | athovāca | yathovāca |
| SS.6.26.32cd | phalair avapīḍo 'nayor hitaḥ \|\| ¦ a | karpūrair avapīḍaṃ prayojayet \|\| ¦ a |
| SS.6.26.46 | \|\| ¦ ¦ | \|\| ¦ saṃhitāyām abhihitāḥ saptaṣaṣṭir mukhāmayāḥ \| ¦ |
| SS.6.39.115 | ato 'yathā | ato 'nyathā |
| SS.6.40.13 | paktim āvidhya(āvi | śocato 'lpāśanasya bāṣpāvegaḥ paktim āvidhya(āvi |
| SS.6.40.182cd | \| ¦ ¦ | \| ¦ sarvathā dīpanaṃ sarvaṃ grahaṇīrogiṇāṃ hitam \|\| ¦ ¦ |
| SS.6.46.10 | sthitās tu viṣamadyayoḥ \|\| ¦ ¦ | dṛṣṭvā yad abhimuhyati \|\| ¦ ¦ |
| SS.6.46.12 | \|\| ¦ ma | \|\| ¦ stabdhāṅgadṛṣṭis tv asṛjā gūḍhocchvāsaś ca mūrcchitaḥ \|\| ¦ ma |
| SS.6.61.30 | ākolyādipratīvāpaṃ siddhaṃ ca prathame gaṇe \| ¦ payomadhusitāyuktaṃ ghṛtaṃ tat paittik | ṛṣṇāvacāmustakādyair yuktam āragvadhādike \| ¦ pakvaṃ ca mūtravarge tu śleṣmāpasmāriṇ |

Notes on a few of these:

- SS.4.1.4 (p. 396): 502 letters belonging to SS.4.1.7 had been typed here instead of the end of
  4.1.4. The passage is still in its right place at 4.1.7.
- SS.4.9.40: 828 letters of the prameha recipe SS.4.11.9 had been typed here; removed. The copy
  at 4.11.9 itself had two gaps, now filled.
- SS.4.40.6: a passage of SS.4.40.10 had been typed in place of the end of 4.40.6. It is still
  in its right place at 4.40.10.
- SS.4.9.9 is prose but stands in `<lg><l>` in the file; the tagging was left alone.
- SS.1.21.33 and SS.1.24.9: stray labels `SS.1.20.` and `SS.1.23.` inside the text were removed.

## eTexts slips noticed (group B: not corrected anywhere yet)

| xml:id | eTexts has | vulgate has (right) |
|---|---|---|
| SS.2.6.23 | ādirot | ādiśet |
| SS.2.13.20 | nghanti | ghnanti |
| SS.3.3.30 | naiṛutabhāgatvāc | nairṛtabhāgatvāc |
| SS.4.16.11 | secayercchkarāyutaiḥ | secayec charkarāyutaiḥ |
| SS.4.29.12 | pañcarviśatir | pañcaviṃśatir |
| SS.4.30.21 | patraidrvyaṅgula- | patrair dvyaṅgula- |
| SS.4.33.30 | navaprasṛtā | navaprasūtā |
| SS.4.34.12 | rchdayati | chardayati |
| SS.4.35.30 | basteṛute | baster ṛte |
| SS.5.2.32 | vikārāścaṃ | vikārāṃś ca |
| SS.6.27.20 | alaṅkratam | alaṅkṛtam |
| SS.6.39.283 | yavaśatkubhiḥ | yavaśaktubhiḥ |
| SS.6.60.25 | niṛuter | nirṛter |
| SS.6.65.36 | vṛrddhi | vṛddhiṃ |

## How to check or repeat

`scripts/` holds the programs: `vfix.py` (applies everything; the list of small corrections is
`vfix_ids.json`, the hand corrections are in `hand.py`), `verify.py` (files well-formed; ids and
page breaks unchanged), `recheck.py` (compares the corrected files with eTexts again and confirms
that every remaining difference was already there before), `mkreport.py` (writes the two lists).
They need `merge.py` from `../vulgate-merge-2026-11/scripts/`; `rep3.json` is the list of
differences that the merge produced.

Checks passed: all eleven files are well-formed; all `xml:id`s and `<pb>`s are identical before
and after; the raw letter differences from eTexts fell from 6,316 letters to 2,185, and no new
difference was introduced.
