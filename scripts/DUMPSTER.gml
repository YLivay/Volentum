// WHERE CODE COMES TO DIE
// Collision code for movables.
    x += xSpeed;
    y += ySpeed;
    
    if ( tangible ) {
        with ( all ) {
            if ( !isMovable( id ) )
                continue;
            
            if ( tangible && place_meeting( x, y, other.id ) && id != other.id ) {
                var myVelocity = ds_vector_create( xSpeed, ySpeed );
                var otherVelocity = ds_vector_create( other.xSpeed, other.ySpeed );
                var collisionVector = ds_vector_create_from_direction( point_direction( x, y, other.x, other.y ), 1 );
                ds_vector_project( myVelocity, myVelocity, collisionVector );
                ds_vector_destroy( collisionVector );
                collisionVector = ds_vector_create_from_direction( point_direction( other.x, other.y, x, y ), 1 );
                ds_vector_project( otherVelocity, otherVelocity, collisionVector );
                ds_vector_destroy( collisionVector );
                
                var v1 = ds_vector_copy( myVelocity ), v2 = ds_vector_copy( otherVelocity );
                ds_vector_scale( ds_vector_add_vector( ds_vector_scale( v1, mass - other.mass ), ds_vector_scale( v2, 2 * other.mass ) ), 1 / ( mass + other.mass ) );
                var newSpeed = ds_vector_sub_vector( ds_vector_copy( myVelocity ), v1 );
                xSpeed -= ds_vector_x( newSpeed );
                ySpeed -= ds_vector_y( newSpeed );
                ds_vector_destroy( v1 );
                ds_vector_destroy( v2 );
                ds_vector_destroy( newSpeed );
                
                v1 = ds_vector_copy( myVelocity );
                v2 = ds_vector_copy( otherVelocity );
                ds_vector_scale( ds_vector_add_vector( ds_vector_scale( v2, other.mass - mass ), ds_vector_scale( v1, 2 * mass ) ), 1 / ( mass + other.mass ) );
                var newSpeed = ds_vector_sub_vector( ds_vector_copy( otherVelocity ), v2 );
                other.xSpeed -= ds_vector_x( newSpeed );
                other.ySpeed -= ds_vector_y( newSpeed );
                ds_vector_destroy( v1 );
                ds_vector_destroy( v2 );
                ds_vector_destroy( newSpeed );
                
                ds_vector_destroy( myVelocity );
                ds_vector_destroy( otherVelocity );
            }
        }
    }
    
    x = prevX;
    y = prevY;
    
    
    
    
    
    
