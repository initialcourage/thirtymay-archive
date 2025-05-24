import openfl.display.BlendMode;

public var gHeart:FunkinSprite;
public var pHeart:FunkinSprite;

function create() {
    gHeart = new FunkinSprite();
    gHeart.loadSprite(Paths.image('stages/jojoprison/gHeart'));
    gHeart.addAnim('idle', 'green hearts', 60, true);
    pHeart = new FunkinSprite();
    pHeart.loadSprite(Paths.image('stages/jojoprison/pHeart'));
    pHeart.addAnim('idle', 'pink hearts', 60, true);

    insert(7, pucci = new FunkinSprite(-2300)).loadSprite(Paths.image('stages/jojoprison/pucci'));
    pucci.addAnim('walk', 'evil ass pucci instance', 24, true);
    pucci.playAnim('walk');
}

function postCreate() {
    gHeart.playAnim('idle');
    pHeart.playAnim('idle');
    pHeart.screenCenter();
    gHeart.screenCenter();

    gHeart.blend = pHeart.blend = 2;
    gHeart.y = pHeart.y -= 250;
    gHeart.x = pHeart.x -= 50;
}

function walk() {
    FlxTween.tween(pucci, {x: 2300}, 8.5);
}