///circleAroundStep( pivotX: n, pivotY: n, moveSpeed: n )
{
    circleAroundNeedsJump = false;
    if ( point_distance( x, y, circleAroundDestX, circleAroundDestY ) <= argument2 ) {
        circleAroundFindNext( argument0, argument1 );
    }
    movableStep( point_direction( x, y, circleAroundDestX, circleAroundDestY ), argument2 );
}
