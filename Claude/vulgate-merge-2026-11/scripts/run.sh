#!/bin/sh
# Step 2 from start to finish. Needs: python3 with lxml and rapidfuzz; tei_all.rng (optional, for validation).
#   ETEXTS_DIR=/path/to/eTexts VULGATE_DIR=/path/to/Sushrutasamhita_Saktumiva2 EFILE=/path/to/susrutasamhita-full.xml-before-the-merge sh run.sh W
W=${1:-/tmp/susruta-merge}; mkdir -p "$W"; D=$(dirname "$0")
python3 "$D/merge.py"  "$W/merged.xml" "$W/report.json" "$D/apply_keys.json"   # spaces, lg/l, pb, adopted readings
python3 "$D/patch.py"  "$W/merged.xml" "$W/patched.xml"                        # word division done by hand
python3 "$D/finish.py" "${EFILE:-$ETEXTS_DIR/eSushruta/susrutasamhita-full.xml}" "$W/patched.xml" "$W/susrutasamhita-full.xml" "$W/report.json" ${RNG:-}
python3 "$D/report.py" "$W/report.json" "$W/lists"                             # the .tsv lists
