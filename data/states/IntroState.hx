import funkin.backend.MusicBeatState;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.DiscordUtil;

function create() {
    MusicBeatState.skipTransIn = true;
    DiscordUtil.changePresence('Hey..');

    FlxG.cameras.flash(FlxColor.BLACK, .25);
    FlxG.sound.play(Paths.sound('menu/intro'));

    add(bg = new FlxBackdrop(Paths.image('menus/bg-desat'))).velocity.set(35, 35);
    bg.alpha = 0.65;

    add(fg = new FunkinSprite()).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
    fg.alpha = 0.45;

    add(logo = new FunkinSprite()).loadSprite(Paths.image('menus/cneLogo'));
    logo.screenCenter();

    add(txt = new FunkinText(0, FlxG.height / 1.5, FlxG.width, 'Made in Codename Engine. (Oh yeah, also.. HAPPY BIRTHDAY ELI!!)', 24, true));
    txt.screenCenter(FlxAxes.X);
    txt.alignment = "center";
    txt.borderSize = 2.5;
    txt.antialiasing = Options.antialiasing;

    new FlxTimer().start(4, function() FlxG.switchState(new ModState('Warning')));
}