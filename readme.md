# Data organization

1. Data is arranged in the following manner in the directory. csl-lnum/v02/dictcode/lnum.txt. e.g. csl-lnum/v02/snp/35.txt will give you dictionary entry corresponding to lnum 35 in `snp` dictionary.
2. The link to github is in the following format. https://github.com/sanskrit-lexicon/csl-lnum/blob/main/v02/snp/35.txt

# Idea behind this repository

1. [csl-orig](https://github.com/sanskrit-lexicon/csl-orig/) repository is the base from which this repository is calculated.
2. A typical entry in [snp.txt](https://github.com/sanskrit-lexicon/csl-orig/blob/master/v02/snp/snp.txt) in csl-orig repository is as shown below.
```
<L>35<pc>532<k1>ozWopamaPalA<k2>ozWopamaPalA
{%oṣṭhopamaphalā%}¦
<div n="lb"/>= {%bimbī.%}
<LEND>
```
3. When a user wants to submit correction, he will have to go to this place and submit his correction.
4. In practice, it is quite impossible, because some of the text files range above 50 MB. Usual editors even fail to manipulate such files.
5. A user suggested that we have correction links inside the stardict files too, so that they can submit corrections from the application directly. See https://github.com/indic-dict/stardict-sanskrit/issues/122.
6. Therefore, this repository was created.
7. This is nothing but a copy of relevant l-num entry from csl-orig repository.
8. For example https://github.com/sanskrit-lexicon/csl-lnum/blob/main/v02/snp/35.txt is the same as the section of snp.txt file mentioned above.
9. This serves the purpose that this file can be directly linked from display or stardict files. If anyone finds some error, he can submit the error or pull request here.

# Scripts

1. `txt_to_lnum.py` - This script generates lnum wise entries from given dictcode. e.g. `python3 txt_to_lnum.py mw` will generate lnum wise entries in the csl-lnum/v02/mw repository.

