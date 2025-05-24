import funkin.backend.utils.WindowUtils;
import funkin.backend.system.framerate.Framerate;
import openfl.text.TextField;
import openfl.display.Sprite;
import openfl.text.TextFormat;
import funkin.backend.system.MainState;

// GET OUT OF MY FUCKING HEAD PLEASE.
var fpsTxt:TextField;
var format:TextFormat;
var _bg:Sprite;

var redirectStates:Map<FlxState, String> = [
    TitleState => 'maythirty/Title',
    MainMenuState => 'maythirty/MainMenu',
    //FreeplayState => 'maythirty/Freeplay',
];

function new() {
    format = new TextFormat(Paths.getFontName(Paths.font('_sans.ttf')), 12, FlxColor.WHITE);
    Main.instance.addChild(_bg = new Sprite());
    _bg.graphics.beginFill(0x000000);
    _bg.graphics.drawRect(0, 0, 100, 100);
    _bg.graphics.endFill();
    _bg.alpha = .5;
    Main.instance.addChild(fpsTxt = new TextField()).defaultTextFormat = format;
    _bg.x = _bg.y = 7;
    fpsTxt.x = fpsTxt.y = 8;
    MainState.betaWarningShown = false;
}

function preStateSwitch() {
    WindowUtils.winTitle = 'Friday Night Funkin: 30MAY';
    Framerate.codenameBuildField.visible = Framerate.fpsCounter.fpsNum.visible = Framerate.fpsCounter.fpsLabel.visible = Framerate.memoryCounter.memoryText.visible = Framerate.memoryCounter.memoryPeakText.visible = false;

    for (redirectState in redirectStates.keys()) {
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) {
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
        }
    }
}

function update(elapsed:Float) {
    fpsTxt.text = 'FPS: ' + Framerate.fpsCounter.fpsNum.text + '\nRAM: ' + Framerate.memoryCounter.memoryText.text + Framerate.memoryCounter.memoryPeakText.text + '\nHappy Birthday, Eli!';
    fpsTxt.width = fpsTxt.textWidth + 10;
    fpsTxt.height = fpsTxt.textHeight + 10;
    setSize(fpsTxt.width, fpsTxt.height);

    if(Framerate.debugMode > 0) {
        fpsTxt.visible = _bg.visible = true;
    } else {
        fpsTxt.visible = _bg.visible = false;
    }

    if(FlxG.keys.justPressed.F5) FlxG.resetState();
}

function setSize(width, height) {
    _bg.graphics.clear();
    _bg.graphics.beginFill(0x000000);
    _bg.graphics.drawRect(0, 0, width, height);
    _bg.graphics.endFill();
}

function destroy() {
    WindowUtils.resetTitle();
    Framerate.codenameBuildField.visible = Framerate.fpsCounter.fpsNum.visible = Framerate.fpsCounter.fpsLabel.visible = Framerate.memoryCounter.memoryText.visible = Framerate.memoryCounter.memoryPeakText.visible = true;
    Main.instance.removeChild(fpsTxt);
    Main.instance.removeChild(_bg);
}