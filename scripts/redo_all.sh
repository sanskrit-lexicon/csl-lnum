#!/bin/bash
echo "UPDATE CSL-ORIG REPOSITORY."
cd ../../csl-orig || exit 1
git pull --ff-only origin main || exit 1
echo "UPDATING CSL-ORIG COMPLETED."
echo ""
cd ../csl-lnum/scripts || exit 1
dicts=(wil yat gst ben mw72 lan cae md mw shs ap90 mwe bor ae bur stc pwg gra pw ccs sch bop armh vcp skd inm vei pui bhs acc krm ieg snp pe pgn mci abch acph acsj pwkvn lrv fri)
for dict in "${dicts[@]}";
do
	echo "STARTED CONVERTING $dict";
	python3 txt_to_lnum.py $dict;
	echo "";
done
