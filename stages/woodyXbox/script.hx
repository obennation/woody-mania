import funkin.backend.Conductor;
import funkin.game.shaders.DropShadowShader;

var ceuNoite:FlxSprite;

var montanhas:FlxSprite;
var agua:BGSprite;
var predio:FlxSprite;
var estrada:FlxSprite;
var fios:FlxSprite;

var ough:FlxSprite;

function onLoad() 
{
    ceuNoite = new FlxSprite(-1410, -379).loadGraphic(Paths.image("week-woody/ceu-noite"));
    ceuNoite.scale.set(0.85, 0.85);
    ceuNoite.scrollFactor.set(0.1, 0.2);
	add(ceuNoite);

    montanhas = new FlxSprite(-25, -430).loadGraphic(Paths.image("extras/xbox/montanhas"));
    montanhas.scale.set(0.8, 0.8);
    montanhas.alpha = 0.99;
    montanhas.scrollFactor.set(0.1, 0.1);
	add(montanhas);

    agua = new BGSprite('extras/xbox/agua', 167, 510, 0.9, 0.9, ['agua']);
	agua.setGraphicSize(Std.int(agua.width * 0.8));
    agua.scrollFactor.set(0.2, 0.2);
    agua.alpha = 0.75;
	add(agua);

    predio = new FlxSprite(-778, -145).loadGraphic(Paths.image("extras/xbox/predios"));
    predio.scale.set(0.8, 0.8);
    predio.scrollFactor.set(0.2, 0.2);
	add(predio);

    estrada = new FlxSprite(-1077, -522).loadGraphic(Paths.image("extras/xbox/estrada"));
    estrada.scale.set(0.8, 0.8);
	add(estrada);

    fios = new FlxSprite(-776, -115).loadGraphic(Paths.image("extras/xbox/fios"));
    fios.scale.set(0.8, 0.8);
    fios.scrollFactor.set(0.85, 0.85);
    fios.zIndex = 110;
    fios.alpha = 0.55;
	add(fios);

    ough = new FlxSprite().loadGraphic(Paths.image('week-woody/filter-black'));
	ough.scale.set(3, 5);
	ough.scrollFactor.set(0, 0);
	ough.screenCenter();
	ough.zIndex = 120;
	ough.alpha = 0.3;
    add(ough);
}

function makeRimForSpr(spr, angle:Float = 0)
{
	if (spr.animateAtlas != null) spr.animateAtlas.useRenderTexture = true;
	
	rim = new DropShadowShader();
	rim.setAdjustColor(-20, -20, -2, -5);
	rim.color = 0xFF6089C6;
	rim.angle = angle;
	rim.attachedSprite = spr;
	spr.shader = rim;
	
	return rim;
}

function onCreatePost()
{
    var dadrim = makeRimForSpr(dad, 25);
	dadrim.threshold = 0.3;
	
	var bfRim = makeRimForSpr(boyfriend, 90);
	
	var gfRim = makeRimForSpr(gf, 90);

    snapCamToPos(750, 580);
}

function onCountdownTick() {
	agua.dance(true);
}

function onBeatHit() {
	agua.dance(true);
}