import flixel.addons.display.FlxBackdrop;

var iconArray:Array<HealthIcon> = [];
var songList:Array<String> = CoolUtil.coolTextFile(Paths.txt('config/freeplayList'));
var songs:FlxTypedGroup<FunkinText>;

function create() {
    if(FlxG.sound.music == null || FlxG.sound.music != null) CoolUtil.playMenuSong();

    add(bg = new FlxBackdrop(Paths.image('menus/bg-desat'))).velocity.set(20, 20);
    bg.color = 0xFF9B49;

    add(songBG = new FunkinSprite(30, 70)).makeSolid(430, 585, FlxColor.BLACK);
    songBG.alpha = 0.67;

    add(songs = new FlxTypedGroup());
    for(i=> songList in songList) {
        songs.add(songList = new FunkinText(50, 0, 0, songList, 48, true));
        songList.borderSize = 4;
        songList.borderColor = FlxColor.fromRGB(30, 30, 30);
        songList.y = 80 + ((songList.ID = i) * 128);
        songList.color = FlxColor.fromRGB(230, 130, 50);
    }

    
}