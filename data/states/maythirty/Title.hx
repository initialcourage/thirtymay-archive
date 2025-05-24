import flixel.addons.display.FlxBackdrop;
import funkin.backend.MusicBeatState;
import flixel.effects.FlxFlicker;
import funkin.backend.utils.DiscordUtil;

function create() {
    DiscordUtil.changePresence('Happy Birthday, Eli!!!', "Title Screen");

    MusicBeatState.skipTransIn = true;
    FlxG.camera.flash(FlxColor.BLACK, .25);
    if(FlxG.sound.music == null || FlxG.sound.music != null) {
        CoolUtil.playMusic(Paths.music('freakyTitle'));
        Conductor.changeBPM(130);
    }

    add(bg = new FlxBackdrop(Paths.image('menus/bg'))).velocity.set(35, 35);
    add(logo = new FunkinSprite()).loadSprite(Paths.image('menus/logoThirty'));
    logo.screenCenter();
    logo.scale.set(0.65, 0.65);
    logo.addAnim('bump', 'logoBumpin', 24, true);
    add(pressenter = new FunkinSprite(0, FlxG.height / 1.2)).loadSprite(Paths.image('menus/titlescreen/pressenter'));
    pressenter.screenCenter(FlxAxes.X);
}

function update() {
    if(FlxG.keys.justPressed.ENTER) {
        FlxFlicker.flicker(pressenter, 3, false);
        new FlxTimer().start(1.5, function() FlxG.switchState(new MainMenuState()));
        CoolUtil.playMenuSFX(1);
        FlxTween.tween(FlxG.sound.music, {volume: 0}, 1);
    }
}

function beatHit() {
    logo.playAnim('bump');
}