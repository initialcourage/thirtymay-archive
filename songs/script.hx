var shader:CustomShader = new CustomShader('ntsc');

function postCreate() {
    camHUD.antialiasing = Options.antialiasing;
    if(Options.gameplayShaders) camGame.addShader(shader);
}

function postUpdate() { 
    allowGitaroo = false; // FUCK YOU YOU STUPID BITCH.
}
function onDadHit(_) if (iconP1.animation.curAnim.curFrame != 1) _.healthGain = 0.015;
function onStartCountdown() FlxG.cameras.add(countDown = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
function onCountdown(_) _.scale = 0.45;
function onPostCountdown(_) _.sprite?.camera = countDown;
function onGameOver() PlayState.deathCounter++;