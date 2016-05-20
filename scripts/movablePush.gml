///movablePush( pusher: n, pushee: n, direction: n, strength: n, addForce?: b )
{
    var pusher = argument[0], pushee = argument[1], pushDirection = argument[2], pushStrength = argument[3], addForce = false;
    
    if ( argument_count < 4 || argument_count > 5 ) {
        show_error( 'Invalid number of arguments given to movablePush. Expected 4 or 5, got ' + string( argument_count ), true );
    }
    
    if ( pushee == objFormation.id && objAlf.isBarrierActive ) {
        exit;
    }
    
    if ( argument_count == 5 ) {
        addForce = argument[4];
    }
    
    if ( movableCanPush( pusher, pushee ) ) {
        pushStrength /= pushee.mass;
        
        if ( !addForce ) {
            pushee.xSpeed = lengthdir_x( pushStrength, pushDirection ) * global.timescale;
            pushee.ySpeed = lengthdir_y( pushStrength, pushDirection ) * global.timescale;
        }
        else {
            pushee.xSpeed += lengthdir_x( pushStrength, pushDirection ) * global.timescale;
            pushee.ySpeed += lengthdir_y( pushStrength, pushDirection ) * global.timescale;
        }
    }
}
