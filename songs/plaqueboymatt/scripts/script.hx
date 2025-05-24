var ratings:Array<Dynamic> = [
    ['D', 0.5],
    ['C', 0.8],
    ['B', 0.85],
    ['A', 0.9],
    ['S', 1],
    ['P', 1],
];

public var bump:FunkinSprite;

function postCreate() {
    //
    accuracyTxt.visible = missesTxt.visible = scoreTxt.visible = iconP1.visible = iconP2.visible = healthBar.visible = healthBarBG.visible = false;
    //

    add(infoTxt = new FunkinText(0, healthBarBG.y, 0, 'FAGGOT!!', 24, true)).font = Paths.font('contm.ttf');
    add(bump = new FunkinSprite()).loadSprite(Paths.image('game/bumps/' + SONG.meta.name));
    
    infoTxt.camera = bump.camera = camHUD;
    bump.visible = false;
    infoTxt.borderSize = 2.5;
}

function postUpdate() {
    var rating:String = getRating(accuracy);

    if (Options.ghostTapping) {
        infoTxt.text = 'ACCURACY: ' + (FlxMath.roundDecimal(accuracy * 100, 2) == -100 ? 'N/A' : FlxMath.roundDecimal(accuracy * 100, 2) + '%') + ' • HEALTH: ' + Math.round(health * 50) + '% • SCORE: ' + songScore + ' • MISSES: ' + misses + ' • RANK: [' + rating + ']';
    } else {
        infoTxt.text = 'ACCURACY: ' + (FlxMath.roundDecimal(accuracy * 100, 2) == -100 ? 'N/A' : FlxMath.roundDecimal(accuracy * 100, 2) + '%') + ' • HEALTH: ' + Math.round(health * 50) + '% • SCORE: ' + songScore + ' • COMBO BREAKS: ' + misses + ' • RANK: [' + rating + ']';
    }
    infoTxt.screenCenter(FlxAxes.X);
}

//hiii yasher :3
function getRating(accuracy:Float):String    {
    if(accuracy < 0) return "???";
    for (rating in ratings) {
        if (accuracy < rating[1]) return rating[0];
    }
    return ratings[ratings.length - 1][0];
}