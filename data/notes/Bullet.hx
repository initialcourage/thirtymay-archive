function onNoteCreation(_) {
    if(_.noteType != 'Bullet') return;
    _.cancel(true);

    _.note.frames = Paths.getFrames('game/notes/types/bullets');
    _.note.animation.addByPrefix('scroll', 'up_bullet', 24, true);
    _.note.scale.set(_.noteScale, _.noteScale);
}

function onPlayerHit(_) {
    if(_.noteType == 'Bullet') {
        _.showSplash = false;
        _.preventStrumGlow();

        dad.playAnim('dodge', true);
        boyfriend.playAnim('shoot', true);
        _.preventAnim();
        FlxG.sound.play(Paths.sound('game/mechanics/gunshot'));
    }
}

function onPlayerMiss(_) {
    if(_.noteType == 'Bullet') {
         _.cancel(true);
        health = 0;       
    }

}