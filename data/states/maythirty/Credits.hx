import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.DiscordUtil;

var curSelect:Int = 0;

var developers:Array<FunkinText> = CoolUtil.coolTextFile(Paths.txt('config/developerNames'));
var descriptions:Map<String, String> = [
    'whos.eli' => "Did every sprite and made all the in-game songs. (Happy birthday to you btw, man.)",
    'resurrectionsolar' => "Charted all the songs.",
    'terminalangst' => "Coded everything & made the menu music. (Title Theme, Main Menu Theme, Pause Theme, Game Over Theme and Credits Theme.)"
];

var creditDevs:FlxTypedGroup<FunkinText>;

function create() {
    DiscordUtil.changePresence('Happy Birthday, Eli!!!', "Credits Menu");

        if(FlxG.sound.music == null || FlxG.sound.music != null) {
        CoolUtil.playMusic(Paths.music('freakyCredits'));
        Conductor.changeBPM(100);
    }

    add(bg = new FlxBackdrop(Paths.image('menus/bg-desat'))).velocity.set(30, 30).degrees = 50;
    bg.color = FlxColor.fromRGB(105, 75, 105);

    add(infoBar = new FunkinSprite(0, FlxG.height / 1.32)).makeSolid(FlxG.width, 200, FlxColor.WHITE);
    infoBar.alpha = 0.65;

    add(devDescs = new FunkinText(0, FlxG.height / 1.2, 720, '', 32, true));
    devDescs.alignment = 'center';

    add(noteBG = new FunkinSprite(0, 10)).makeSolid(720, 100, FlxColor.BLACK);
    noteBG.alpha = 0.75;
    add(myNote = new FunkinText(0, 10, 720, 'I still cannot believe that I\'ve known this guy for 2 whole years, I\'m genuinely happy I have gotten this opportunity to make something like this with him for his birthday. Eli, I wish you a happy 17th, and I genuinely thank you, for being my friend. - Alice', 24, true));
    myNote.alignment = 'center';
    myNote.screenCenter(FlxAxes.X);
    noteBG.screenCenter(FlxAxes.X);

    add(creditDevs = new FlxTypedGroup());
    for (i=>developers in developers) {
        creditDevs.add(devNames = new FunkinText(0, FlxG.height / 1.3, 0, '', 48, true));
        devNames.borderSize = devDescs.borderSize = myNote.borderSize = 2.5;
    }
    
    add(devIcons = new FunkinSprite(0, FlxG.height / 9.2));
    devIcons.scale.set(0.6, 0.6);

    devIcons.addAnim('eli', 'eli_icon', 12, true);
    devIcons.addAnim('solar', 'solar_icon', 12, true);
    devIcons.addAnim('alice', 'terminal_icon', 12, true);

    changeItem(0);
}

function update() {
    if(controls.LEFT_P || controls.RIGHT_P) changeItem(controls.LEFT_P ? -1 : 1);
    if(controls.BACK) {
        CoolUtil.playMenuSFX(2);
        new FlxTimer().start(1, function() FlxG.switchState(new MainMenuState()));
    }
}

function changeItem(change:Int = 0) {
    curSelect = FlxMath.wrap(curSelect + change, 0, creditDevs.length-1);

    CoolUtil.playMenuSFX(0);

    devIcons.loadSprite(Paths.image('menus/credits/' + developers[curSelect]));

    switch(developers[curSelect]) {
        default:
            creditDevs.members[devNames].text = 'Eli (whos.eli)';
        case 'resurrectionsolar':
            creditDevs.members[devNames].text = 'Solar (resurrectionsolar)';
            devIcons.y = 78;
        case 'terminalangst':
            creditDevs.members[devNames].text = 'Alice (terminalangst)';
            devIcons.y = 78;
    }
    devDescs.text = 'Description: ' + descriptions.get(developers[curSelect]);
    creditDevs.members[devNames].screenCenter(FlxAxes.X);
    devDescs.screenCenter(FlxAxes.X);
    devIcons.screenCenter(FlxAxes.X);
}

function beatHit() {
    devIcons.scale.set(0.65, 0.65);

    FlxTween.tween(devIcons.scale, {x: 0.6, y: 0.6}, .3);
}