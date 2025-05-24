var camCred:FlxCamera = new FlxCamera();
camCred.bgColor = FlxColor.TRANSPARENT;
FlxG.cameras.add(camCred, false);

var myVCRSONGS:Array<Dynamic> = ['scratchedup', 'luvstruk', 'walkdown'];

function create() {
    add(bar = new FunkinSprite(0, 720)).makeSolid(FlxG.width, 85, FlxColor.BLACK).alpha = 0;
    add(txt = new FunkinText(0, 720, 0, "BITCH", 24, true)).borderSize = 1;
    txt.alpha = 0;
    bar.screenCenter(FlxAxes.X);
    txt.antialiasing = bar.antialiasing = Options.antialiasing;
    txt.camera = bar.camera = camCred;
    if(this.SONG.meta.name == 'plaqueboymatt') txt.font = Paths.font('contm.ttf');
    if (myVCRSONGS.contains(this.SONG.meta.name)) {
        txt.font = Paths.font('vcrosd.ttf');
        txt.size = 16;
    }
}

function onEvent(_) {
    if(_.event.name == "Credits") {
        txt.text = "Composer(s): " + _.event.params[0] + ", Artist(s): " + _.event.params[1] + ", Coder(s): " + _.event.params[2] + ", Charter(s): " + _.event.params[3];
        txt.screenCenter(FlxAxes.X);
        if (myVCRSONGS.contains(this.SONG.meta.name)) {
            FlxTween.tween(txt, {alpha: 1, y: 690}, 0.5, {ease: FlxEase.smootherStepOut});
        } else {
            FlxTween.tween(txt, {alpha: 1, y: 685}, 0.5, {ease: FlxEase.smootherStepOut});
        }
        FlxTween.tween(bar, {alpha: 0.75, y: 680}, 0.5, {ease: FlxEase.smootherStepOut});
        new FlxTimer().start(_.event.params[4], function() {
        FlxTween.tween(txt, {alpha: 0, y: 720}, 0.75, {ease: FlxEase.smootherStepIn});
        FlxTween.tween(bar, {alpha: 0, y: 720}, 0.75, {ease: FlxEase.smootherStepIn});
        });
    }
}