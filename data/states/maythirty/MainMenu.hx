import flixel.addons.display.FlxBackdrop;
import funkin.backend.system.macros.GitCommitMacro;
import flixel.effects.FlxFlicker;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import funkin.backend.utils.DiscordUtil;
import funkin.options.OptionsMenu;

var curSelect:Int = 0;
var selectedSomethin:Bool = false;

var options:Array<FunkinText> = CoolUtil.coolTextFile(Paths.txt('config/menuItems'));
var menuItems:FlxTypedGroup<FunkinText>;

function create() {
    DiscordUtil.changePresence('Happy Birthday, Eli!!!', "Main Menu");

    if(FlxG.sound.music == null || FlxG.sound.music != null) CoolUtil.playMenuSong();

    add(bg = new FlxBackdrop(Paths.image('menus/bg-desat'))).velocity.set(35, 35);
    bg.color = FlxColor.fromRGB(80, 40, 80);
    add(logo = new FunkinSprite(-280, -130)).loadSprite(Paths.image('menus/logoThirty'));
    logo.scale.set(0.35, 0.35);
    logo.addAnim('bump', 'logoBumpin', 24, true);

    add(infoTxt = new FunkinText(FlxG.width / 1.44, 10, 0, '', 32, true));
    infoTxt.text = 'Press [TAB] to switch Mods.\nCODENAME ENGINE (' + GitCommitMacro.commitHash + ')';
    infoTxt.alignment = 'right';

    add(optionsBar = new FunkinSprite(0, FlxG.height / 1.15)).makeSolid(FlxG.width, 100, FlxColor.BLACK);
    optionsBar.alpha = 0.65;

    add(menuItems = new FlxTypedGroup());
    for(i=> options in options) {
        menuItems.add(menuItem = new FunkinText(0, FlxG.height / 1.11, 0, options, 48, true)).borderSize = 2.5;
        menuItem.x = 150 + ((menuItem.ID = i) * 270);
        menuItem.alpha = 0.78;
    }

    changeItem(0);
}

function update() {
    if (!selectedSomethin) {
    if(controls.BACK) FlxG.switchState(new TitleState());
    if(controls.SWITCHMOD) {
        persistentUpdate = !(persistentDraw = true);
        openSubState(new ModSwitchMenu());
    }   
    if(FlxG.keys.justPressed.SEVEN) {
        persistentUpdate = !(persistentDraw = true);
        openSubState(new EditorPicker());
    }

    if(controls.LEFT_P || controls.RIGHT_P) changeItem(controls.LEFT_P ? -1 : 1);
    if(controls.ACCEPT) {
        selectedSomethin = true;
        CoolUtil.playMenuSFX(1);

        FlxFlicker.flicker(menuItems.members[curSelect], 1, 0.06, true);
        new FlxTimer().start(1, function() selectItem());
    }
    }
}

function beatHit() {
    logo.playAnim('bump');
}

function changeItem(change:Int = 0) {
    curSelect = FlxMath.wrap(curSelect + change, 0, menuItems.length-1);

    CoolUtil.playMenuSFX(0);

    menuItems.forEach(function(item:FunkinText) {
        if(item.ID == curSelect) {
            item.color = FlxColor.fromRGB(125, 85, 125);
            item.alpha = 1;
        } else {
            item.color = FlxColor.WHITE;
            item.alpha = 0.78;
        }
    });
        
}

function selectItem() {
    switch(options[curSelect]) {
        case 'Birthday!!':
            PlayState.loadSong('bdayboy', 'hard');
            FlxG.switchState(new PlayState());
        case 'Freeplay': FlxG.switchState(new FreeplayState());
        case 'Options': FlxG.switchState(new OptionsMenu());
        case 'Credits': FlxG.switchState(new ModState('maythirty/Credits'));
    }
}