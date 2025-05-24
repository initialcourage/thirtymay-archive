var ratings:Array<Dynamic> = [
    ['AWFUL !', 0.5],
    ['BAD', 0.8],
    ['GOOD', 0.9],
    ['CRUNK', 1],
    ['GODLY!!', 1],
];

function postCreate() {
    accuracyTxt.visible = scoreTxt.visible = missesTxt.visible = iconP1.visible = iconP2.visible = false;

    add(judgement = new FunkinText(0, healthBarBG.y - 35, 0, '', 20, false)).camera = camHUD;

    judgement.font = Paths.font('vcrosd.ttf');
    judgement.color = FlxColor.YELLOW;
}

function postUpdate() {
    var rating:String = getRating(accuracy);

    if (Options.ghostTapping) {
        judgement.text = 'YOU SPINNIN\' ' + rating + ' | MISSES: ' + misses + ' | SCORE: ' + songScore + ' | HEALTH: ' + Math.round(health * 50) + '%';
    } else {
        judgement.text = 'YOU SPINNIN\' ' + rating + ' | COMBO BREAKS: ' + misses + ' | SCORE: ' + songScore + ' | HEALTH: ' + Math.round(health * 50) + '%';
    }
    judgement.screenCenter(FlxAxes.X);
}

//hiii yasher :3
function getRating(accuracy:Float):String    {
    if(accuracy < 0) return "...";
    for (rating in ratings) {
        if (accuracy < rating[1]) return rating[0];
    }
    return ratings[ratings.length - 1][0];
}

function onStrumCreation(_) _.strum.x -= 55;
function onPostStrumCreation(_) _.strum.x += 50 * _.strumID;