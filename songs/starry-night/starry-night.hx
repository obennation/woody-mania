var endingPlayed:Bool = false;

function onCreatePost()
{
	cutscene = new FunkinVideoSprite();
	cutscene.onFormat(() -> {
		cutscene.cameras = [camOther];
		cutscene.setGraphicSize(FlxG.width);
		cutscene.screenCenter();
		add(cutscene);
	});
	cutscene.onEnd(() -> {
		camGame.alpha = 1;
		camHUD.alpha = 1;
		camGame.flash(0xFFFFFFFF, 0.35);
		cutscene.kill();
	});
	cutscene.load(Paths.video('weekwoody/mid-starrynight'), [FunkinVideoSprite.muted]);
	cutscene.antialiasing = ClientPrefs.globalAntialiasing;
	
	cutscene.play();
	cutscene.pause();
	cutscene.tiedToGame = false;
}

function onLoad()
{
	videoCutscene('weekwoody/starrynight', true);
}

function onEndSong()
{
	if (PlayState.isStoryMode && !endingPlayed)
	{
		endingPlayed = true;
		endingCutscene = true;

		videoCutscene('weekwoody/ending', false);

		return Function_Stop;
	}

	return Function_Continue;
}

function onEvent(name, v1, v2)
{
	switch (name)
	{
		case 'Mania':
			switch (v1)
			{
				case 'cutscene':
					cutscene.play();
					cutscene.tiedToGame = true;
					camGame.alpha = camHUD.alpha = 0;
			}
	}
}