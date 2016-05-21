///formationStep()
{
    if ( isKeyDown( Keys.LEFT ) ) {
        angle += rotationSpeed * global.timescale;
    }
    if ( isKeyDown( Keys.RIGHT ) ) {
        angle -= rotationSpeed * global.timescale;
    }
    
    var moveDir = 0;
    var moveSpeed = 0;
    if ( isKeyDown( Keys.UP ) ) {
        moveDir += 1;
        moveSpeed = maxSpeed;
    }
    if ( isKeyDown( Keys.DOWN ) ) {
        moveDir -= 1;
        moveSpeed = maxSpeed;
    }
    
    for ( var i = 0; i < ds_list_size( global.switchKeys ); i++ ) {
        if ( isKeyPressed( global.switchKeys[| i] ) ) {
            playerSwitchCharacter( global.switchKeys[| i] );
            audio_play_sound( sndBeep, 0, false );
            break;
        }
    }
    
    movableStep( formationDirection( moveDir ), moveSpeed );
}
