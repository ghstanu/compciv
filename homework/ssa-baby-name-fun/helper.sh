mkdir -p data-hold/names-by-state data-hold/names-nationwide

cd data-hold/names-by-state

curl -o namesbystate.zip \
 http://stash.compciv.org/ssa_baby_names/namesbystate.zip

unzip namesbystate.zip


cd ../names-nationwide
curl -o namesbynation.zip \
 http://stash.compciv.org/ssa_baby_names/names.zip
unzip namesbynation.zip
