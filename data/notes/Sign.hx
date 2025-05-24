function onNoteCreation(_) {
    if(_.noteType != 'Sign') return;
    _.cancel(true);

    _.note.frames = Paths.getFrames('game/notes/types/signs');
    _.note.animation.addByPrefix('scroll', 'up_sign', 24, true);
    _.note.scale.set(_.noteScale, _.noteScale);
}

function onPlayerHit(_) {
    if(_.noteType == 'Sign') {
        _.showSplash = false;
        _.preventStrumGlow();

        boyfriend.playAnim('dodge', true);
        dad.playAnim('attack', true);
        _.preventAnim();
        FlxG.sound.play(Paths.sound('game/mechanics/signwoosh'));
    }
}

function onPlayerMiss(_) {
    if(_.noteType == 'Sign') {
         _.cancel(true);
        health = 0;       
    }

}