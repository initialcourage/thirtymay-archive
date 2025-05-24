function create() {
    camZooming = true;
    camGame.fade(FlxColor.BLACK, 0, false);
    camHUD.alpha = 0;

    add(soloTxt = new FunkinText(-440, 329, 0, 'SOLO TIME!!!', 64, false)).camera = camHUD;
    soloTxt.color = FlxColor.YELLOW;
}

function onSongStart() {
    camZooming = false;
    camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 128, true);
    FlxTween.tween(camGame, {zoom: 0.76}, (Conductor.stepCrochet / 1000) * 128, {onComplete: (_) -> defaultCamZoom = 0.82});
}

function stepHit() {
    switch(curStep) {
        case 128:
            camZooming = true;
            FlxTween.tween(camHUD, {alpha: 1}, .4);
        case 512 | 1028:
            defaultCamZoom = 0.72;
        case 640:
            defaultCamZoom = 0.96;
            camHUD.flash(FlxColor.fromRGB(253, 161, 255), .5);
            add(pHeart);
        case 704:
            camHUD.flash(FlxColor.fromRGB(161, 255, 166), .5);
            remove(pHeart);
            add(gHeart);
        case 768:
            defaultCamZoom = 0.72;
            camHUD.flash(FlxColor.WHITE, .5);
            remove(gHeart);
        case 1152:
            defaultCamZoom = 0.68;
    }
}