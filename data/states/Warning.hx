import funkin.backend.MusicBeatState;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.DiscordUtil;

function create() {
    MusicBeatState.skipTransIn = true;

    FlxG.cameras.flash(FlxColor.BLACK, .25);

    add(bg = new FlxBackdrop(Paths.image('menus/bg-desat'))).velocity.set(35, 35);
    bg.alpha = 0.65;
    bg.color = FlxColor.RED;

    add(fg = new FunkinSprite()).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
    fg.alpha = 0.45;

    add(txt = new FunkinText(0, FlxG.height / 2.2, FlxG.width, 'This mod contains flashing lights, photosensitive content, and is overall loud, proceed if you wanna risk ya life or somethin.\n\n\nPress [ENTER] to continue.', 24, true)).font = Paths.font('vcrosd.ttf');
    txt.screenCenter(FlxAxes.X);
    txt.alignment = "center";
    txt.borderSize = 2.5;
    txt.antialiasing = Options.antialiasing;
}

function update() {
    if(FlxG.keys.justPressed.ENTER) FlxG.switchState(new TitleState());
}