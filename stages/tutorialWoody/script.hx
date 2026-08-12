import funkin.backend.Conductor;
var ceu:FlxSprite;

var montanhas:FlxSprite;
var predios:FlxSprite;
var gramas:FlxSprite;
var arvore2:FlxSprite;
var arvore:FlxSprite;
var estrada:FlxSprite;

var ough:FlxSprite;

function onLoad() 
{
    ceu = new FlxSprite(-2086, -806).loadGraphic(Paths.image("week-woody/ceu"));
    ceu.scale.set(0.8, 0.8);
    ceu.scrollFactor.set(0.1, 0.2);
	add(ceu);

    montanhas = new FlxSprite(-624, -159).loadGraphic(Paths.image("tutorial/montanhas"));
    montanhas.scale.set(0.8, 0.8);
    montanhas.scrollFactor.set(0.5, 0.5);
	add(montanhas);

    predios = new FlxSprite(-580, -20).loadGraphic(Paths.image("tutorial/predios"));
    predios.scale.set(0.8, 0.8);
    predios.scrollFactor.set(0.6, 0.6);
	add(predios);
    
    arvore2 = new FlxSprite(-133, 219).loadGraphic(Paths.image("tutorial/arvore"));
    arvore2.scale.set(0.8, 0.8);
    arvore2.scrollFactor.set(0.85, 0.85);
	add(arvore2);

    arvore = new FlxSprite(1247, 219).loadGraphic(Paths.image("tutorial/arvore"));
    arvore.scale.set(0.8, 0.8);
    arvore.scrollFactor.set(0.85, 0.85);
	add(arvore);

    gramas = new FlxSprite(-830, 525).loadGraphic(Paths.image("tutorial/gramas"));
    gramas.scale.set(0.8, 0.8);
    gramas.scrollFactor.set(0.9, 0.9);
	add(gramas);

    estrada = new FlxSprite(-1151, 729).loadGraphic(Paths.image("week-woody/estrada"));
    estrada.scale.set(0.8, 0.8);
	add(estrada);

    ough = new FlxSprite().loadGraphic(Paths.image('week-woody/filter'));
	ough.scale.set(3, 5);
	ough.scrollFactor.set(0, 0);
	ough.screenCenter();
	ough.zIndex = 120;
	ough.alpha = 0.05;
    add(ough);
}

function onEvent(name, v1, v2)
{
    switch (name)
	{
		case 'Mania':
			switch (v1)
			{
				case 'bf':
					isCameraOnForcedPos = true;
					snapCamToPos(1170, 600);
				case 'normal':
					isCameraOnForcedPos = false;
            }
    }
}