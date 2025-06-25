if(PlayState.difficulty != 'alt') {
function postCreate() {
    camZooming = true;
    camGame.fade(FlxColor.BLACK, 0);
    camHUD.alpha = 0;
}

function onSongStart() camZooming = false;

function stepHit() {
    switch(curStep) {
        case 1:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000)*160, true);
            FlxTween.tween(camGame, {zoom: 0.7}, (Conductor.stepCrochet / 1000)*160, {onComplete: (_) -> defaultCamZoom = 0.7});
            FlxTween.tween(camHUD, {alpha: 1}, 0.2);
        case 1808 | 1812 | 1816 | 1818 | 1820 | 1821 | 1822 | 1823:
            defaultCamZoom += 0.05;
        case 1824:
            defaultCamZoom = 0.4;
            FlxTween.num(health, 2, 1, {ease:FlxEase.cubeIn}, _ -> health = _);
    }
}

function onDadHit(_) camGame.shake(0.007, .1);
}