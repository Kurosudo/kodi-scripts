#!/bin/bash
# Maintainer <Kurosudo>
# License: GNU GPL v2

read -p "What type of video file this folder contain (example .mkv .avi .mov .mp4): " videotype
read -p "Hey, what is this season? (for season 1 type 01 for season 10 type 10) note: some animes don't use Season 2 but use separate name: " season
read -p "Do you have subtitles on this folder? If yes type extension (example .ass .srt .sub). If you don't have subtitles, type 0: " subtype
if [ "$subtype" = "no" ]; then
        sub_do="no"
else
        sub_do="yes"
fi
ls *$videotype > outfiles.tmp
i="1"
while read -r line 
        do
                #echo $line
                echo "S${season}E${i}${videotype}"
                #mvv "$line" "S$seasonE$i.ass"
                i=$( bc <<< "$i+1" )
done < outfiles.tmp
rm outfiles.tmp

if [ "$sub_do" = "yes" ]; then

        echo "Renaming subtitle files"
        ls *$subtype > outfiles.tmp

        i="1"
        while read -r line 
                do
                        #echo $line
                        echo "S${season}E${i}${subtype}"
                        #mvv "$line" "S$seasonE$i.ass"
                        i=$( bc <<< "$i+1" )

        done < outfiles.tmp
        rm outfiles.tmp
fi
