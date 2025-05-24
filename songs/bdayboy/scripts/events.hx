import funkin.backend.scripting.events.StateEvent;
import hxvlc.flixel.FlxVideoSprite;

function create() {
    camZooming = true;
    camHUD.alpha = 0;
    camGame.fade(FlxColor.BLACK, 0);
}

function postCreate() {
    insert(0, vid = new FlxVideoSprite(210, 150)).load(Assets.getPath(Paths.file('videos/breakdancenasui.mp4'), [':input-repeat=65535']));
    vid.camera = camHUD;
    vid.alpha = 0.92;
    vid.scale.set(1.7, 1.7);
}

function stepHit() {
    switch(curStep) {
        case 16:
            camHUD.alpha = 1;
            camGame.fade(FlxColor.BLACK, 0.1, true);
            camHUD.flash(FlxColor.WHITE, 1);
        case 272:
            defaultCamZoom = 0.6;
            camGame.flash(FlxColor.fromRGB(147, 96, 181));
            for(i in stage.stageSprites) i.colorTransform.color = FlxColor.fromRGB(147, 96, 181);
            for(e in [boyfriend, dad, gf]) e.colorTransform.color = FlxColor.BLACK;
        case 304:
            camGame.flash(FlxColor.fromRGB(147, 96, 181));
            for (i in stage.stageSprites) i.setColorTransform();
            for(e in [boyfriend, dad, gf]) e.setColorTransform();
            defaultCamZoom = 0.7;
        case 648 | 652 | 780:
            defaultCamZoom += 0.05;
        case 656:
            defaultCamZoom -= 0.1;
        case 784:
            defaultCamZoom = 0.5;
            camGame.flash(FlxColor.BLACK);
            for(i in stage.stageSprites) i.colorTransform.color = FlxColor.BLACK;
            for(e in [boyfriend, dad, gf]) e.colorTransform.color = FlxColor.WHITE;
        case 912:
            defaultCamZoom = 0.68;
            camGame.flash(FlxColor.BLACK);
            for (i in stage.stageSprites) i.setColorTransform();
            for(e in [boyfriend, dad, gf]) e.setColorTransform();
        //shitty method i know but FUUUCK OFFF.
        case 1520 | 1521 | 1522 | 1523 | 1524 | 1525 | 1526 | 1527 | 1528 | 1529 | 1530 | 1531 | 1532 | 1533 | 1534 | 1535:
            defaultCamZoom += 0.005;
        case 1536:
            camHUD.flash(FlxColor.WHITE, 1.12);
            vid.play();
    }
}