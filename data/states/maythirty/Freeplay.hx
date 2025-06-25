import flixel.addons.display.FlxBackdrop;

var songList:Array<String> = CoolUtil.coolTextFile(Paths.txt('config/freeplayList'));
var songs:FlxTypedGroup<FunkinText>;

var curSelect:Int = 0;

function create() {
    if(FlxG.sound.music == null || FlxG.sound.music != null) CoolUtil.playMenuSong();

    add(bg = new FlxBackdrop(Paths.image('menus/bg-desat'))).velocity.set(20, 20);
    bg.color = 0x804E26;

    add(songBG = new FunkinSprite(30, 70)).makeSolid(430, 585, FlxColor.BLACK);
    songBG.alpha = 0.67;
    songBG.screenCenter(FlxAxes.X);

    add(songs = new FlxTypedGroup());
    for(i=> songList in songList) {
        songs.add(songList = new FunkinText(50, 0, 0, songList, 48, true));
        songList.y = 80 + ((songList.ID = i) * 128);
        songList.color = FlxColor.fromRGB(230, 130, 50);
        songList.alpha = 0.65;
        songList.borderSize = 4;
        songList.borderColor = FlxColor.fromRGB(30, 30, 30);
        songList.alignment = 'center';
        songList.screenCenter(FlxAxes.X);
    }

    add(diffText = new FunkinText(0, FlxG.height / 1.1, 0, 'This song has an alternate difficulty, if you want to play it, press [TAB].', 32, true));
    diffText.color = FlxColor.fromRGB(230, 130, 50);
    diffText.borderSize = 4;
    diffText.borderColor = FlxColor.fromRGB(30, 30, 30);
    diffText.screenCenter(FlxAxes.X);

    changeSelection(0);
    
}

function update() {
    if(controls.UP_P || controls.DOWN_P) changeSelection(controls.DOWN_P ? 1 : -1);
    if(controls.ACCEPT) select(songList[curSelect], 'hard');
    if(FlxG.keys.justPressed.TAB && Assets.exists(Paths.chart(songList[curSelect], 'alt'))) select(songList[curSelect], 'alt');
    if(controls.BACK) FlxG.switchState(new MainMenuState());
}

function changeSelection(change:Int = 0) {
    curSelect = FlxMath.wrap(curSelect + change, 0, songList.length - 1);

    songs.forEach(function(item:FunkinText) {
        if (item.ID == curSelect) { 
            item.alpha = 1; 
        } else item.alpha = 0.65;
        
    });

    if (Assets.exists(Paths.chart(songList[curSelect], 'alt'))) diffText.alpha = 1; else diffText.alpha = 0.2;
}

function select(song:String, diff:String) {
    PlayState.loadSong(songList[curSelect], diff);
    FlxG.switchState(new PlayState());
}