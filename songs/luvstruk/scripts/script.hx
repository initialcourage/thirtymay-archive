function postCreate() {
    iconP1.visible = doIconBop = false;
    accuracyTxt.font = scoreTxt.font = missesTxt.font = Paths.font('vcrosd.ttf');
    accuracyTxt.y = scoreTxt.y = missesTxt.y = healthBar.y - 30;
}

function postUpdate() {
    iconP2.x = FlxG.width / 5.4;
}