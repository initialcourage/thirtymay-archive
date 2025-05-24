var bouncingHUD:Bool = false;

function create() {
    camZooming = true;
    camGame.fade(FlxColor.BLACK, 0, false);
    camHUD.alpha = 0;

    add(soloTxt = new FunkinText(-440, 329, 0, 'SOLO TIME!!!', 64, false)).camera = camHUD;
    soloTxt.color = FlxColor.YELLOW;
    soloTxt.font = Paths.font('vcrosd.ttf');
}

function onSongStart() {
    camZooming = false;
    camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 64, true);
    FlxTween.tween(camGame, {zoom: 0.87}, (Conductor.stepCrochet / 1000) * 64, {onComplete: (_) -> defaultCamZoom = 0.85});
}

function stepHit() {
    switch(curStep) {
        case 64:
            FlxTween.tween(camHUD, {alpha: 1}, .4);
        case 188 | 189 | 190 | 191:
            defaultCamZoom += 0.05;
        case 192:
            defaultCamZoom = 0.84;
            camGame.flash(FlxColor.WHITE, 0.3);
            bouncingHUD = true;
        case 304:
            FlxTween.tween(soloTxt, {x: 410}, 2, {ease: FlxEase.circOut});
        case 320:
            camGame.flash(FlxColor.WHITE, 0.87);
            stage.stageSprites['bitchasslight'].alpha = 0.34;
            stage.stageSprites['darkness'].alpha = 0.65;
            FlxTween.tween(soloTxt, {x: 1280}, 2, {ease: FlxEase.circOut, onComplete: (_) -> remove(soloTxt)});
        case 446:
            defaultCamZoom += 0.12;
        case 448:
            bouncingHUD = false;
            camGame.flash(FlxColor.WHITE, 0.87);
            defaultCamZoom -= 0.12;
            stage.stageSprites['bitchasslight'].alpha = 0;
            stage.stageSprites['darkness'].alpha = 0;
        case 576:
            camGame.flash(FlxColor.WHITE, 0.87);
            defaultCamZoom = 1.2;
            camHUD.alpha = 0;
        case 600:
            defaultCamZoom = 0.87;
    }
}

function beatHit() {
    

    if(bouncingHUD) camHUD.y += 20;
}

function update() {
    soloTxt.y = FlxG.random.int(328, 330);
    soloTxt.angle = FlxG.random.int(1, -1);

    camHUD.y = lerp(camHUD.y, 0, 0.1, true);
}