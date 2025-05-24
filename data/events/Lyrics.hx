var camLyric:FlxCamera = new FlxCamera();
camLyric.bgColor = FlxColor.TRANSPARENT;
FlxG.cameras.add(camLyric, false);

function create() {
    add(txt = new FunkinText(0, 0, 0, '', 64)).borderSize = 2.5;
    txt.font = Paths.font('vcrosd.ttf');
    txt.borderColor = FlxColor.GRAY;
    txt.camera = camLyric;
}

function onEvent(_) {
    if(_.event.name == 'Lyrics') {
        txt.text = _.event.params[0];
        txt.screenCenter();
    }
}