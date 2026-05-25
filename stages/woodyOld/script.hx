import funkin.backend.Conductor;
import funkin.objects.Bopper;

var dance:FlxSprite;

function onLoad() 
{
    var bg:BGSprite = new BGSprite('extras/older/background', -111, -60, 0.9, 0.9);
	add(bg);

    dance = new Bopper(-10, 260).loadAtlas('extras/older/dance');
	dance.addAnimByPrefix("idle", "pipoca e estevam dance", 24, false);
	dance.animation.play("idle");
	dance.scrollFactor.set(1, 1);
	dance.antialiasing = true;
	add(dance);
}

function onCountdownTick(){
    dance.animation.play("idle", true);
}

function onBeatHit(){
    dance.animation.play("idle", true);
}