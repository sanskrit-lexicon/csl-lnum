echo "UPDATE CSL-ORIG REPOSITORY."
cd ../../csl-orig
git pull origin master
echo "UPDATING CSL-ORIG COMPLETED."
echo ""
cd ../csl-lnum/scripts
#dicts=(wil yat gst ben mw72 lan cae md mw shs ap90 mwe bor ae bur stc pwg gra pw ccs sch bop armh vcp skd inm vei pui bhs acc krm ieg snp pe pgn mci)
dicts=(wil yat)
for dict in ${dicts[@]};
do
	echo "STARTED CONVERTING $dict";
	python3 txt_to_lnum.py $dict;
	echo "";
done
