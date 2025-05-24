function postCreate() {
    healthBar.visible = healthBarBG.visible = iconP1.visible = iconP2.visible = doIconBop = false;
    //

    add(healthTxt = new FunkinText(-25, 0, FlxG.width, '', 16, true));
    healthTxt.camera = camHUD;

    scoreTxt.alignment = missesTxt.alignment = accuracyTxt.alignment = healthTxt.alignment = "right";
    accuracyTxt.x = missesTxt.x = scoreTxt.x = FlxG.width / 1.7;
    missesTxt.y = accuracyTxt.y - 20;
    scoreTxt.y = missesTxt.y - 20;
    healthTxt.y = scoreTxt.y - 20;
}

function postUpdate() {
    healthTxt.text = 'Health: ' + Math.round(health * 50) + '%';
}