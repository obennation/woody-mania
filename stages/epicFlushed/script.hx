import funkin.backend.Conductor;

var bg2:FlxSprite;
var bg3:FlxSprite;
var bg4:FlxSprite;
var bg5:FlxSprite;
var bg6:FlxSprite;
var bg7:FlxSprite;
var bg8:FlxSprite;
var bg9:FlxSprite;
var bg10:FlxSprite;
var bg11:FlxSprite;
var bg12:FlxSprite;
var bg13:FlxSprite;
var bgLobby:FlxSprite;

var train:FlxSprite;

var trainPassed:Bool = false;
var trainMoving:Bool = false;
var trainBaseY:Float = 500;
var trainTime:Float = 0;

var backgrounds:Array<FlxSprite> = [];

function onLoad() 
{
    var bg:FlxSprite = new FlxSprite(-600, -100).loadGraphic(Paths.image("extras/flushed/bg"));
    bg.scrollFactor.set(1, 1);
	add(bg);

    bg2 = new FlxSprite(-800, -200).loadGraphic(Paths.image("extras/flushed/bg2"));
    bg2.scrollFactor.set(1, 1);
    bg2.scale.set(0.9, 0.9);
    bg2.visible = false;
    add(bg2);

    bg3 = new FlxSprite(-1050, -100).loadGraphic(Paths.image("extras/flushed/bg3"));
    bg3.scrollFactor.set(1, 1);
    bg3.scale.set(0.9, 0.9);
    bg3.visible = false;
    add(bg3);

    bg4 = new FlxSprite(-900, -100).loadGraphic(Paths.image("extras/flushed/bg4"));
    bg4.scrollFactor.set(1, 1);
    bg4.visible = false;
    add(bg4);

    bg5 = new FlxSprite(-1000, -130).loadGraphic(Paths.image("extras/flushed/bg5"));
    bg5.scrollFactor.set(1, 1);
    bg5.visible = false;
    add(bg5);
    
    bg6 = new FlxSprite(-600, -130).loadGraphic(Paths.image("extras/flushed/bg6"));
    bg6.scrollFactor.set(1, 1);
    bg6.visible = false;
    add(bg6);
    
    bg7 = new FlxSprite(-600, -170).loadGraphic(Paths.image("extras/flushed/bg7"));
    bg7.scrollFactor.set(1, 1);
    bg7.visible = false;
    add(bg7);

    bg8 = new FlxSprite(-700, -170).loadGraphic(Paths.image("extras/flushed/bg8"));
    bg8.scrollFactor.set(1, 1);
    bg8.visible = false;
    add(bg8);

    bg9 = new FlxSprite(-700, -170).loadGraphic(Paths.image("extras/flushed/bg9"));
    bg9.scrollFactor.set(1, 1);
    bg9.visible = false;
    add(bg9);

    bg10 = new FlxSprite(-700, -170).loadGraphic(Paths.image("extras/flushed/bg10"));
    bg10.scrollFactor.set(1, 1);
    bg10.visible = false;
    add(bg10);

    bg11 = new FlxSprite(-700, -200).loadGraphic(Paths.image("extras/flushed/bg11"));
    bg11.scrollFactor.set(1, 1);
    bg11.visible = false;
    add(bg11);

    bg12 = new FlxSprite(-700, -200).loadGraphic(Paths.image("extras/flushed/bg12"));
    bg12.scale.set(1.1, 1.1);
    bg12.scrollFactor.set(1, 1);
    bg12.visible = false;
    add(bg12);
    
    bg13 = new FlxSprite(-600, -200).loadGraphic(Paths.image("extras/flushed/bg13"));
    bg13.scale.set(1.2, 1.2);
    bg13.scrollFactor.set(1, 1);
    bg13.visible = false;
    add(bg13);
         
    bgLobby = new FlxSprite(-1800, -500).loadGraphic(Paths.image("extras/flushed/backgroundLobby"));
    bgLobby.scrollFactor.set(1, 1);
    bgLobby.scale.set(0.7, 0.7);
    bgLobby.visible = false;
    add(bgLobby);

    train = new FlxSprite(-6250, trainBaseY).loadGraphic(Paths.image("extras/flushed/epicTrain"));
    train.scale.set(0.7, 0.7);
    train.visible = false;
    train.zIndex = 3000;
    add(train);

    backgrounds = [
        bg2,
        bg3,
        bg4,
        bg5,
        bg6,
        bg7,
        bg8,
        bg9,
        bg10,
        bg11,
        bg12,
        bg13
    ];

    white = new BGSprite(null, 0, 0, 0, 0);
    white.scale.set(5000, 5000);
    white.makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), 0xFFFFFFFF);
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

function onUpdate(elapsed)
{
    if (trainMoving)
    {
        trainTime += elapsed;

        if (trainTime >= 0.08)
        {
            trainTime = 0;

            trainFrame = !trainFrame;

            if (trainFrame)
                train.y = trainBaseY - 2;
            else
                train.y = trainBaseY + 2;
        }
    }
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
					snapCamToPos(900, 500);
                case 'bf-alt':
					isCameraOnForcedPos = true;
					snapCamToPos(1100, 550);
				case 'gf':
					isCameraOnForcedPos = true;
					snapCamToPos(750, 500);
				case 'normal':
					isCameraOnForcedPos = false;
                case 'White Fade':
                    FlxG.camera.fade(FlxColor.WHITE, 6, false, function()
					{
						FlxG.camera.fade(FlxColor.WHITE, 0, true, function()
						{
							add(white);

                            trainPassed = true;
                            trainMoving = false;
                            train.visible = false;
						});
					});
                case 'bgChange':
                    for (background in backgrounds)
                    {
                        background.visible = false;
                    }
                    var randomBG:Int = FlxG.random.int(0, backgrounds.length - 1);
                    backgrounds[randomBG].visible = true;
                    bgLobby.visible = false;

                    if (backgrounds[randomBG] == bg13)
                        {
                            boyfriend.shader = makeCharShader(-50, -5, 0, 0);
                            dad.shader = makeCharShader(-50, -5, 0, 0);
                        }
                        else
                        {
                            boyfriend.shader = makeCharShader(5, -5, 0, 0);
                            dad.shader = makeCharShader(5, -5, 0, 0);
                        }
                    trainPassed = true;
                    trainMoving = false;
                    train.visible = false;
                case 'backgroundLobby':
                    boyfriend.shader = makeCharShader(5, -5, 0, 0);
                    dad.shader = makeCharShader(5, -5, 0, 0);

                    bgLobby.visible = true;
                    trainPassed = false;

                    new FlxTimer().start(FlxG.random.int(1, 100), function(tmr)
                    {
                        if (!bgLobby.visible || trainPassed)
                            return;

                        trainPassed = true;

                        train.x = -6250;
                        train.y = trainBaseY;
                        train.visible = true;

                        FlxG.sound.play(Paths.music("trainFlushed"), 0.5);

                        trainTime = 0;
                        trainMoving = true;
                        trainFrame = false;

                        FlxTween.tween(train, {x: 2500}, 15, {
                            ease: FlxEase.linear,
                            onComplete: function(twn)
                            {
                                trainMoving = false;
                                train.visible = false;
                                train.y = trainBaseY;
                            }
                        });
                    });
                case 'bfDark':
                    FlxTween.color(boyfriend, 7, boyfriend.color, 0xFF000000);
                case 'bfLight':
                    FlxTween.color(boyfriend, 2, boyfriend.color, 0xFFFFFFFF);
            }
    }
}