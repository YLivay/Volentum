///movableStep( direction:n, speed:n )
{
    var activeAcceleration;
    
    destDirection = argument0;
    destSpeed = argument1;
    
    if ( destSpeed != 0 ) {
        destXSpeed = lengthdir_x( destSpeed, destDirection ) * global.timescale;
        destYSpeed = lengthdir_y( destSpeed, destDirection ) * global.timescale;
        activeAcceleration = acceleration * global.timescale * global.timescale;
    }
    else {
        destXSpeed = 0;
        destYSpeed = 0;
        activeAcceleration = deacceleration * global.timescale;
    }
    
    // Snap speed to speed limit if close enough
    if ( point_distance( xSpeed, ySpeed, destXSpeed, destYSpeed ) < activeAcceleration ) {
        xSpeed = destXSpeed;
        ySpeed = destYSpeed;
    }
    // Otherwise, accelerate towards speed limit
    else {
        var changeDirection;
        changeDirection = point_direction( xSpeed, ySpeed, destXSpeed, destYSpeed );
        xSpeed += lengthdir_x( activeAcceleration, changeDirection );
        ySpeed += lengthdir_y( activeAcceleration, changeDirection );
    }
    
    // Assign x and y to variables because they can't contain fractions. LOL.
    var prevX, prevY;
    prevX = x;
    prevY = y;
    
    x += xSpeed;
    y += ySpeed;

    with ( all ) {
        if ( !isMovable( id ) )
            continue;
            
        if ( place_meeting( x, y, other.id ) && id != other.id ) {
            var pushDirection, pushStrength, distance;
            pushDirection = point_direction( other.x, other.y, x, y );
            movablePush( other.id, id, pushDirection, other.mass * 0.5, true );
            movablePush( id, other.id, pushDirection + 180, mass * 0.5, true );

            /*pushStrength = mass / other.mass;
            distance = point_distance( other.x, other.y, x, y );
            xSpeed += lengthdir_x( 0.5 / pushStrength, pushDirection );
            ySpeed += lengthdir_y( 0.5 / pushStrength, pushDirection );
            other.xSpeed -= lengthdir_x( pushStrength * 0.5, pushDirection );
            other.ySpeed -= lengthdir_y( pushStrength * 0.5, pushDirection );*/
        }
    }
    
    x = prevX;
    y = prevY;
    
    speed = point_distance( 0, 0, xSpeed, ySpeed );
    direction = point_direction( 0, 0, xSpeed, ySpeed );
    var prevSpeed = speed;
    var prevDir = direction;
    move_bounce_solid( true );
    if ( prevSpeed != speed || prevDir != direction ) {
        show_debug_message( 'collision detected' );
        event_perform( ev_other, onCollision );
    }
    if ( id != objFormation.id ) {
        move_outside_solid( point_direction( x, y, objFormation.x, objFormation.y ), maxSpeed * global.timescale );
    }
    else {
        move_outside_solid( direction, maxSpeed * global.timescale );
    }
    xSpeed = lengthdir_x( speed, direction );
    ySpeed = lengthdir_y( speed, direction );
    x += xSpeed;
    y += ySpeed;
    speed = 0;
    direction = 0;
    
    depth = -y;
}
