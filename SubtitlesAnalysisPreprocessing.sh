# Subtitles analysis pipeline (draft only)
# Exchange the valies in [] with the right values

# get subtitles from the video

for i in [folder-with-mkvs]/*.mkv 
do
    if test -f "$i" 
    then
       echo "Extracting subtitles from $i"
       mkvextract "$i" tracks [put here track number]:"[folder with subtitles]/$i"
    fi
done

# Put subtitles to a right format

for i in [folder with subtitles]/*.sub
do
    if test -f "$i" 
    then
        echo "Transforming subtitles from $i"
        vobsub2srt --tesseract-lang eng --verbose "[folder with subtitles]/${i:10:-4}"
    fi
done

# Correcting some mistakes in subtitles

for i in [folder with subtitles]/*.srt
do
    if test -f "$i"
    then
        echo "Correcting some mistakes from $i"
        sed -i "s/| /I /g" "$i"
    fi
done

