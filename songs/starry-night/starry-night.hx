var endingPlayed:Bool = false;

function onLoad()
{
	videoCutscene('weekwoody/starrynight', true);
}

function onEndSong()
{
    if (!endingPlayed)
    {
        endingPlayed = true;
        endingCutscene = true;

        videoCutscene('weekwoody/ending', false);

        return Function_Stop;
    }

    return Function_Continue;
}