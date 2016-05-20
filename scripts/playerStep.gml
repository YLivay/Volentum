///playerStep()
{
    global.invincibility = max( global.invincibility - 1 * global.timescale, 0 );
    
    if ( global.hp <= 0 ) {
        global.screenColor = c_white;
        if ( global.screenAlpha > 0 ) {
            global.screenAlpha *= 1.03;
        }
        else {
            global.screenAlpha = 0.01;
        }
        global.timescale *= 0.98;
        if ( global.screenAlpha >= 1 ) {
            levelReset();
        }
    }
    else {
        global.screenAlpha = max( global.screenAlpha - 0.05, 0 );
    }
}
