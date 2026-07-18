import funkin.backend.Conductor;

var ough:FlxSprite;

function onLoad() 
{
    var bg:FlxSprite = new FlxSprite(-600, -100).loadGraphic(Paths.image("extras/flushed"));
    bg.scrollFactor.set(1, 1);
	add(bg);

	ough = new FlxSprite().loadGraphic(Paths.image('week-woody/filter'));
	ough.scale.set(3, 5);
	ough.scrollFactor.set(0, 0);
	ough.screenCenter();
	ough.zIndex = 120;
	ough.alpha = 0.05;
    add(ough);
}

function makeCharShader(_brightness, _hue, _contrast, _saturation)
{
	var shader = newShader('adjustColor');
	shader.setFloat('brightness', _brightness);
	shader.setFloat('hue', _hue);
	shader.setFloat('contrast', _contrast);
	shader.setFloat('saturation', _saturation);
	
	return shader;
}

function onCreatePost()
{
    boyfriend.shader = makeCharShader(5, -5, 0, 0);
	dad.shader = makeCharShader(5, -5, 0, 0);
}

function onEvent(name, v1, v2)
{
    switch (name)
	{
		case 'Mania':
			switch (v1)
			{
				case 'benny':
					isCameraOnForcedPos = true;
					snapCamToPos(400, 500);
				case 'bf':
					isCameraOnForcedPos = true;
					snapCamToPos(800, 500);
				case 'gf':
					isCameraOnForcedPos = true;
					snapCamToPos(750, 500);
				case 'normal':
					isCameraOnForcedPos = false;
            }
    }
}