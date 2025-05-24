function create() {
    camHUD.alpha = camGame.alpha = 0;
    camZooming = true;
}

function onSongStart() {
    camHUD.alpha = camGame.alpha = 0.05;
    camGame.zoom += .05;
    camZooming = false;
}

function stepHit() {
    switch(curStep) {
        case 8:
            camGame.zoom += .05;
            camHUD.alpha = camGame.alpha = 0.25;
        case 16:
            camGame.zoom += .05;
            camHUD.alpha = camGame.alpha = 0.5;
        case 24:
            camGame.zoom += .05;
            camHUD.alpha = camGame.alpha = 0.7;
        case 28:
            bump.visible = true;
            camHUD.alpha = camGame.alpha = 1;
        case 32:
            camZooming = true;
            defaultCamZoom = 0.85;
            camHUD.flash(FlxColor.WHITE, .5);
            remove(bump);
        case 800:
            defaultCamZoom = 0.7;
        case 960:
            defaultCamZoom = 0.85;
        case 1344:
            defaultCamZoom = 0.58;
            camHUD.visible = false;
            camGame.flash(FlxColor.WHITE, .5);
        case 1376:
            camZooming = false;
    }
}