///enemyAIPrepareDraw( idleSprite, movingSprite )
{
    if ( aiState == AIStates.STUNNED ) {
        sprite_index = stunSprite;
        image_index = stunImageIndex;
        exit;
    }
    else if ( aiState == AIStates.DYING ) {
        sprite_index = injuredSprite;
        image_index = 0;
        exit;
    }
    
    if ( aiState == AIStates.ATTACKING ) {
        image_xscale = sign( objFormation.x - x );
    }
    else {
        image_xscale = sign( x - xprevious );
    }
    if ( image_xscale == 0 ) {
        image_xscale = 1;
    }
    
    if ( x != xprevious || y != yprevious ) {
        var distanceMade = max( min( point_distance( xprevious, yprevious, x, y ) / maxSpeed, 1.2 ), -1.2 );
        var directionSign = sign( x - xprevious );
        if ( directionSign == 0 ) {
            directionSign = 1;
        }
        var directionVsFacingDirection = image_xscale * directionSign;
        moveFrame = ( moveFrame + directionVsFacingDirection * distanceMade * 0.15 * global.timescale ) mod sprite_get_number( argument1 );
        if ( moveFrame < 0 ) {
            moveFrame += sprite_get_number( argument1 );
        }
        
        sprite_index = argument1;
        image_index = moveFrame;
    }
    else {
        sprite_index = argument0;
        image_index = 0;
    }
}
