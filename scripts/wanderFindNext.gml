///wanderFindNext( pivotX?: n, pivotY?: n )
{
    var pivotX = x, pivotY = y;
    if ( argument_count == 2 ) {
        pivotX = argument[0];
        pivotY = argument[1];
    }
    
    wanderGiveUpTime = wanderMaxGiveUpTime;
    wanderDestX = x;
    wanderDestY = y;
    
    // Try for like.. a lot.
    for ( var i = 0; i < 50; i++ ) {
        var wanderDirection = random( 360 );
        var wanderRange = irandom_range( wanderMaxRange / 2, wanderMaxRange );
        
        wanderDestX = pivotX + lengthdir_x( wanderRange, wanderDirection );
        wanderDestY = pivotY + lengthdir_y( wanderRange, wanderDirection );
        if ( !collision_line( x, y, wanderDestX, wanderDestY, objSolid, true, true ) &&
             !place_meeting( wanderDestX, wanderDestY, objSolid ) ) {
            break;
        }
    }
}
