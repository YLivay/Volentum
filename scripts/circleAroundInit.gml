///circleAroundInit( pivotX: n, pivotY: n, radius: n, maxJump: n )
{
    var dir = point_direction( argument0, argument1, x, y );
    circleAroundDestX = argument0 + lengthdir_x( argument2, dir );
    circleAroundDestY = argument1 + lengthdir_y( argument2, dir );
    circleAroundRadius = argument2;
    circleAroundMaxJump = argument3;
    
    circleAroundDir = choose( -1, 1 );
    
}
