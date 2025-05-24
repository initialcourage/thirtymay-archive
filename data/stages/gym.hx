function create() {
    insert(5, beefBoss = new FunkinSprite(2300, 150)).loadSprite(Paths.image('stages/gym/beefBoss'));
    beefBoss.addAnim('walkcycle', 'beef boss walk', 24, true);
    beefBoss.playAnim('walkcycle');
    beefBoss.moves = true;
    walkBeef();
}

function walkBeef(){
    beefBoss.flipX = true;
    FlxTween.tween(beefBoss, {x: 2300}, 8.5, {onComplete: function(){
        beefBoss.flipX = false;
        FlxTween.tween(beefBoss, {x: -2600}, 8.5, {onComplete: function(){
            walkBeef();
        }});
    }});
}