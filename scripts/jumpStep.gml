///jumpStep()
{
    var jumpDistance = point_distance( startJumpX, startJumpY, endJumpX, endJumpY );
    var jumpDirection = point_direction( x, y, endJumpX, endJumpY );
    
    if ( point_distance( x, y, endJumpX, endJumpY ) < jumpSpeed * global.timescale ) {
        x = endJumpX;
        y = endJumpY;
        currentJumpHeight = 0;
        return true;
    }
    
    x += lengthdir_x( jumpSpeed, jumpDirection ) * global.timescale;
    y += lengthdir_y( jumpSpeed, jumpDirection ) * global.timescale;
    var jumpCovered = point_distance( startJumpX, startJumpY, x, y ) / jumpDistance;
    currentJumpHeight = jumpHeight * sin( degtorad( jumpCovered * 180 ) );
    return false;
}
