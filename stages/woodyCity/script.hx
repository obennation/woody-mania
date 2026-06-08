import funkin.backend.Conductor;
import funkin.game.shaders.DropShadowShader;
import funkin.objects.Bopper;

var night:FlxSprite;

var ceuNoite:FlxSprite;
var estrela:FlxSprite;
var ceuTarde:FlxSprite;
var ceu:FlxSprite;

var montanhas:FlxSprite;
var predio:FlxSprite;
var gramas:FlxSprite;
var arvore2:FlxSprite;
var arvore:FlxSprite;
var construcoes:FlxSprite;
var postes:FlxSprite;
var estrada:FlxSprite;

var ough:FlxSprite;
var ough2:FlxSprite;
var ough3:FlxSprite;

var gi:FlxSprite;
var giCoat:FlxSprite;
var pipoca:FlxSprite;

var crowd:FlxSprite;

var spotlight:FlxSprite;
var spotlight2:FlxSprite;

var songName:String = Paths.sanitize(PlayState.SONG.song);

function onLoad() 
{
    night = new BGSprite(null, -2120, -4905, 0, 0);
    night.scale.set(5000, 5000);
    night.makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), 0xFF302F32);
    night.alpha = 0;
    add(night);

    ceuNoite = new FlxSprite(-1836, -623).loadGraphic(Paths.image("week-woody/ceu-noite"));
    ceuNoite.scale.set(0.8, 0.8);
    ceuNoite.scrollFactor.set(0.95, 0.95);
	add(ceuNoite);

    estrela = new FlxSprite(-896, -1312).loadGraphic(Paths.image("week-woody/estrela"));
    estrela.scrollFactor.set(0.95, 0.95);
    estrela.alpha = 0;
	add(estrela);

    ceuTarde = new FlxSprite(-1836, -623).loadGraphic(Paths.image("week-woody/ceu-tarde"));
    ceuTarde.scale.set(0.8, 0.8);
    ceuTarde.scrollFactor.set(0.95, 0.95);
	add(ceuTarde);

    ceu = new FlxSprite(-1836, -623).loadGraphic(Paths.image("week-woody/ceu"));
    ceu.scale.set(0.8, 0.8);
    ceu.scrollFactor.set(0.95, 0.95);
	add(ceu);

    montanhas = new FlxSprite(-2215, -250).loadGraphic(Paths.image("week-woody/montanhas"));
    montanhas.scale.set(0.8, 0.8);
    montanhas.scrollFactor.set(0.85, 0.85);
	add(montanhas);

    predio = new FlxSprite(-1883, -50).loadGraphic(Paths.image("week-woody/predio"));
    predio.scale.set(0.8, 0.8);
    predio.scrollFactor.set(0.9, 0.9);
	add(predio);

    gramas = new FlxSprite(-1603, 541).loadGraphic(Paths.image("week-woody/gramas"));
    gramas.scale.set(0.8, 0.8);
    gramas.scrollFactor.set(0.8, 0.8);
	add(gramas);

    arvore2 = new FlxSprite(914, -56).loadGraphic(Paths.image("week-woody/arvore"));
    arvore2.scale.set(0.8, 0.8);
    arvore2.scrollFactor.set(0.85, 0.85);
    arvore2.alpha = 0.65;
	add(arvore2);

    arvore = new FlxSprite(-1200, -109).loadGraphic(Paths.image("week-woody/arvore"));
    arvore.scale.set(0.8, 0.8);
    arvore.scrollFactor.set(0.85, 0.85);
    arvore.alpha = 0.65;
	add(arvore);

    construcoes = new FlxSprite(-1845, -170).loadGraphic(Paths.image("week-woody/construcoes"));
    construcoes.scale.set(0.85, 0.85);
    construcoes.scrollFactor.set(0.85, 0.85);
	add(construcoes);

    postes = new FlxSprite(-1923, -88).loadGraphic(Paths.image("week-woody/postes"));
    postes.scale.set(0.8, 0.8);
    postes.scrollFactor.set(1, 1);
    postes.alpha = 0.85;
	add(postes);

    estrada = new FlxSprite(-1804, 743).loadGraphic(Paths.image("week-woody/estrada"));
    estrada.scale.set(0.8, 0.8);
	add(estrada);

    gi = new Bopper(1024, 211).loadAtlas('week-woody/gi');
	gi.addAnimByPrefix("idle", "props/gi idle", 24, false);
	gi.animation.play("idle");
	gi.scale.set(0.75, 0.75);
	gi.scrollFactor.set(1, 1);
    gi.color = 0xFFE5E5E5;
	gi.antialiasing = true;
	add(gi);

    giCoat = new Bopper(1024, 211).loadAtlas('week-woody/gi');
    giCoat.addAnimByPrefix("idle", "props/gi casaco", 24, false);
	giCoat.animation.play("idle");
	giCoat.scale.set(0.75, 0.75);
	giCoat.scrollFactor.set(1, 1);
    giCoat.color = 0xFFE5E5E5;
	giCoat.antialiasing = true;

    pipoca = new Bopper(-858, 300).loadAtlas('week-woody/pipoca');
	pipoca.addAnimByPrefix("idle", "props/pipoca", 24, false);
	pipoca.animation.play("idle");
	pipoca.scale.set(0.75, 0.75);
    pipoca.color = 0xFFE5E5E5;
	pipoca.scrollFactor.set(1, 1);
	pipoca.antialiasing = true;
	add(pipoca);

    crowd = new BGSprite('week-woody/crowd', -1800, 600, 0.4, 0.4, ['crowd']);
    crowd.scale.set(0.8, 0.8);
    crowd.alpha = 0.9;
    crowd.scrollFactor.set(0.9, 0.9);
    crowd.color = 0xFFE5E5E5;
    crowd.zIndex = 105;

    spotlight = new FlxSprite(-625, -300).loadGraphic(Paths.image("week-woody/spotlight"));
    spotlight.scale.set(0.8, 0.8);
    spotlight.scrollFactor.set(1, 1);
    spotlight.blend = BlendMode.ADD;
    spotlight.zIndex = 102;
    spotlight.visible = false;
    add(spotlight);

    spotlight2 = new FlxSprite(355, -300).loadGraphic(Paths.image("week-woody/spotlight"));
    spotlight2.scale.set(0.8, 0.8);
    spotlight2.scrollFactor.set(1, 1);
    spotlight2.blend = BlendMode.ADD;
    spotlight2.zIndex = 102;
    spotlight2.visible = false;
    add(spotlight2);

    black = new BGSprite(null, -2120, -4905, 0, 0);
    black.scale.set(5000, 5000);
    black.makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), 0xFF000000);
    black.alpha = 0;
    black.zIndex = 3;
    add(black);

    ough = new FlxSprite().loadGraphic(Paths.image('week-woody/filter'));
	ough.scale.set(3, 5);
	ough.scrollFactor.set(0, 0);
	ough.screenCenter();
	ough.zIndex = 120;
	ough.alpha = 0.05;
    add(ough);

    ough2 = new FlxSprite().loadGraphic(Paths.image('week-woody/filter-green'));
	ough2.scale.set(3, 5);
	ough2.scrollFactor.set(0, 0);
	ough2.screenCenter();
	ough2.zIndex = 120;
	ough2.alpha = 0.1;

    ough3 = new FlxSprite().loadGraphic(Paths.image('week-woody/filter-black'));
	ough3.scale.set(3, 5);
	ough3.scrollFactor.set(0, 0);
	ough3.screenCenter();
	ough3.zIndex = 120;
	ough3.alpha = 0;
    add(ough3);

    if (songName == 'tutorial')
    {
        gi.alpha = 0;
        pipoca.alpha = 0;
    }

    if (songName == 'roots')
    {
        ceu.alpha = 0;
        remove(gi);
        add(giCoat);

        remove(ough);
        add(ough2);

        add(crowd);
    }

    if (songName == 'starry-night')
    {
        ceuTarde.alpha = 0;
        ceu.alpha = 0;
        night.alpha = 1;
        estrela.alpha = 1;

        remove(ough);

        ough3.alpha = 0.6;

        remove(gi);
        add(giCoat);

        add(crowd);
    }
}

function makeRimForSpr(spr, angle:Float = 0)
{
	if (spr.animateAtlas != null) spr.animateAtlas.useRenderTexture = true;
	
	rim = new DropShadowShader();
	rim.setAdjustColor(0, 0,  0, 0);

    rim.color = 0xFF9EAF99;

	rim.angle = angle;
	rim.attachedSprite = spr;
	spr.shader = rim;
	
	return rim;
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
    if (songName == 'roots')
    {
        var pipocaRim = makeRimForSpr(pipoca, 25);

        var dadrim = makeRimForSpr(dad, 25);
	    dadrim.threshold = 0.3;
	
	    var bfRim = makeRimForSpr(boyfriend, 90);
	
	    var gfRim = makeRimForSpr(gf, 90);

        var giRim = makeRimForSpr(giCoat, 90);
    }

    if (songName == 'starry-night')
    {
        boyfriend.shader = makeCharShader(-15, -10, -5, 0);
		gf.shader = makeCharShader(-15, -10, -5, 0);
		dad.shader = makeCharShader(-15, -10, -5, 0);

        giCoat.shader = makeCharShader(-30, -10, -5, 0);
        pipoca.shader = makeCharShader(-30, -10, -5, 0);

        crowd.shader = makeCharShader(-30, -10, -5, 0);
    }
    snapCamToPos(750, 580);
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
					snapCamToPos(75, 600);
				case 'bf':
					isCameraOnForcedPos = true;
					snapCamToPos(650, 600);
				case 'gf':
					isCameraOnForcedPos = true;
					snapCamToPos(300, 600);
				case 'normal':
					isCameraOnForcedPos = false;
                case 'roots':
                    var time = (Conductor.stepCrotchet / 1000) * 64;

                    var sprites = [
                        [boyfriend, 1, 0xFFE7E7E7],
                        [gf, 1, 0xFFE7E7E7],
                        [dad, 1, 0xFFE7E7E7],

                        [pipoca, 1, 0xFFAAAAAA],
                        [giCoat, 1, 0xFFAAAAAA],
                        
                        [montanhas, 1, 0xFFD9D9D9],
                        [predio, 1, 0xFFD9D9D9],
                        [gramas, 1, 0xFFD9D9D9],
                        [arvore2, 0.65, 0xFFD9D9D9],
                        [arvore, 0.65, 0xFFD9D9D9],
                        [construcoes, 1, 0xFFD9D9D9],
                        [postes, 0.85, 0xFFD9D9D9],
                        [estrada, 1, 0xFFD9D9D9],

                        [crowd, 0.9, 0xFFE5E5E5]
                    ];

                    for (data in sprites)
                    {
                        var spr = data[0];
                        var alpha = data[1];
                        var finalColor = data[2];
                        spr.alpha = alpha;

                        FlxTween.color(spr, time, spr.color, 0xFFFFFFFF).then(FlxTween.color(spr, time, 0xFFFFFFFF, finalColor));
                        FlxTween.tween(spr, {alpha: alpha}, time * 2);
                    }

                    FlxTween.tween(ceuTarde, {alpha: 0}, 14, {ease: FlxEase.linear});
                    FlxTween.tween(ough2, {alpha: 0}, 14, {ease: FlxEase.linear});
                    FlxTween.tween(ough3, {alpha: 0.4}, 14, {ease: FlxEase.linear});
                case 'overlayBgAlpha':
                    FlxTween.tween(ough3, {alpha: 0}, 4, {ease: FlxEase.linear});
                case 'rootsOverlay':
                    FlxTween.tween(ough3, {alpha: 0}, 1, {ease: FlxEase.quadOut});
                    FlxTween.tween(black, {alpha: 0.75}, 1, {ease: FlxEase.quadOut});
                    FlxTween.tween(crowd, {alpha: 0.5}, 1, {ease: FlxEase.quadOut});
                case 'removeRootsOverlay':
                    FlxTween.tween(ough3, {alpha: 0.6}, 1, {ease: FlxEase.quadOut});
                    FlxTween.tween(black, {alpha: 0}, 1, {ease: FlxEase.quadOut});
                    FlxTween.tween(crowd, {alpha: 0.9}, 1, {ease: FlxEase.quadOut});
                case "spotlight-left":
                    spotlight.visible = true;
                    FlxTween.cancelTweensOf(spotlight);
                    FlxTween.tween(spotlight, {alpha: 1}, 0.5, {ease: FlxEase.quadOut});
                case "spotlight-right":
                    spotlight2.visible = true;
                    FlxTween.cancelTweensOf(spotlight2);
                    FlxTween.tween(spotlight2, {alpha: 1}, 0.5, {ease: FlxEase.quadOut});
                case "spotlight-offleft":
                    FlxTween.cancelTweensOf(spotlight);
                    FlxTween.tween(spotlight, {alpha: 0.5}, 0.5, {
                        ease: FlxEase.quadOut,
                        onComplete: function(twn)
                        {
                            spotlight.alpha = 0.5;
                        }
                    });
                case "spotlight-offright":
                    FlxTween.cancelTweensOf(spotlight2);
                    FlxTween.tween(spotlight2, {alpha: 0.5}, 0.5, {
                        ease: FlxEase.quadOut,
                        onComplete: function(twn)
                        {
                            spotlight2.alpha = 0.5;
                        }
                    });
                case "spotlight-off":
                    FlxTween.tween(spotlight, {alpha: 0}, 0.5, {
                        onComplete: function(twn)
                        {
                            spotlight.visible = false;
                        }
                    });
                    FlxTween.tween(spotlight2, {alpha: 0}, 0.5, {
                        onComplete: function(twn)
                        {
                            spotlight2.visible = false;
                        }
                    });
            }
    }
}

function onCountdownTick(){
    gi.animation.play("idle");
    giCoat.animation.play("idle");
    pipoca.animation.play("idle");
    crowd.dance(true);
}

function onBeatHit(){
    gi.animation.play("idle");
    giCoat.animation.play("idle");
    pipoca.animation.play("idle");
    crowd.dance(true);
}