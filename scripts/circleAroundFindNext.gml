///circleAroundFindNext( pivotX: n, pivotY: n,  )
{
    var dir = point_direction( argument0, argument1, x, y );
    
    var angleShift = 360 * 32 / ( 2 * pi * circleAroundRadius );
    
    // Try finding a free next space
    var found = false;
    circleAroundNeedsJump = false;
    for ( i = 1; i < 180 / angleShift; i++ ) {
        nextAngle = dir + angleShift * i * circleAroundDir;
        nextDestX = argument0 + lengthdir_x( circleAroundRadius, nextAngle );
        nextDestY = argument1 + lengthdir_y( circleAroundRadius, nextAngle );
        
        if ( !place_meeting( nextDestX, nextDestY, objSolid ) ) {
            found = true;
            break;
        }
        circleAroundNeedsJump = true;
        if ( point_distance( x, y, nextDestX, nextDestY ) > circleAroundMaxJump ) {
            circleAroundNeedsJump = false;
            break;
        }
    }
    
    // If not found, try other direction
    if ( !found ) {
        circleAroundDir *= -1;
        for ( i = 1; i < 180 / angleShift; i++ ) {
            nextAngle = dir + angleShift * i * circleAroundDir;
            nextDestX = argument0 + lengthdir_x( circleAroundRadius, nextAngle );
            nextDestY = argument1 + lengthdir_y( circleAroundRadius, nextAngle );
            
            if ( !place_meeting( nextDestX, nextDestY, objSolid ) ) {
                found = true;
                break;
            }
            circleAroundNeedsJump = true;
            if ( point_distance( x, y, nextDestX, nextDestY ) > circleAroundMaxJump ) {
                circleAroundNeedsJump = false;
                break;
            }
        }
    }
    
    // If still not found, well shit, just pounce the player
    if ( !found ) {
    }
    else {
        circleAroundDestX = nextDestX;
        circleAroundDestY = nextDestY;
    }
    
    return found;
}
