public var crowd:FunkinSprite;

function create() {
    insert(6, crowd = new FunkinSprite(-670, 340)).loadSprite(Paths.image('stages/nevada/crowd'));
    crowd.addAnim('idle', 'bgchar0', 24, true);
    crowd.addAnim('shocked', 'bgchar shocked0', 24, false);
    crowd.playAnim('idle');
}

function shock() crowd.playAnim('shocked')