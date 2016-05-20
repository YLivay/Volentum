///characterStep()
{
    x = characterX();
    y = characterY();
    
    isMoving = x != xprevious || y != yprevious;
    
    if ( prevIsMoving != isMoving ) {
        frame = 0;
    }
    
    if ( global.selectedCharacter == character ) {
        focus = min( focus + FOCUS_REPLENISH * global.timescale / room_speed, 100 );
    }
    else {
        focus = max( focus - FOCUS_DEPLETE * global.timescale / room_speed, 0 );
    }
    
    depth = -y;
}
