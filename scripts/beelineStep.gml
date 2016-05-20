///beelineStep( destX, destY, speed, keepRange )
{
    // TODO: fucking pathfinding.
    var dist = point_distance( x, y, argument0, argument1 );
    if ( dist > argument3 ) {
        movableStep( point_direction( x, y, argument0, argument1 ), argument2 );
    }
    else {
        movableStep( point_direction( x, y, argument0, argument1 ) + 180, argument2 );
    }
}
