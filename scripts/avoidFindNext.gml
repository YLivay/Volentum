///avoidFindNext( pivotX: n, pivotY: n, minRange: n, maxRange: n )
{
    avoidDestX = x;
    avoidDestY = y;
    for ( var i = 0; i < 50; i++ ) {
        var avoidRange = irandom_range( argument2, argument3 );
        var avoidDir = random( 360 );
        var avoidX = argument0 + lengthdir_x( avoidRange, avoidDir );
        var avoidY = argument1 + lengthdir_y( avoidRange, avoidDir );
        
        if ( !place_meeting( avoidX, avoidY, objSolid ) && !collision_line( avoidX, avoidY, argument0, argument1, objSolid, true, true ) ) {
            avoidDestX = avoidX;
            avoidDestY = avoidY;
            return true;
        }
    }
    return false;
}
