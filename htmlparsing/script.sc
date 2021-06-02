wget -U mozilla -O wetter.txt 'https://www.br.de/wetter/action/5_tage_prognose.do?id=0&plz=10646&regio=Unterfranken&x=9&y=10'
sed -i 's/<//g' wetter.txt
sed -i 's/>//g' wetter.txt
cat wetter.txt
