///doKnockback( direction?: n )
{
    if ( friendly ) {
        movablesToPush = getMovablesCollidingWith( id );
        ds_list_delete_value( movablesToPush, id );
        ds_list_delete_value( movablesToPush, objFormation.id );
        var movablesToPushCount = ds_list_size( movablesToPush );
        
        if ( movablesToPushCount ) {
            for ( var i = 0; i < movablesToPushCount; i++ ) {
                var movableToPush = movablesToPush[| i];
                var pushDir = point_direction( objFormation.x, objFormation.y, movableToPush.x, movableToPush.y );
                if ( argument_count == 1 ) {
                    pushDir = argument[0];
                }
                movablePush( id, movableToPush, pushDir, knockback );
                if ( object_get_parent( movableToPush.object_index ) == objEnemy ) {
                    movableToPush.aiState = AIStates.ATTACKING;
                }
            }
            return movablesToPush;
        }
        else {
            ds_list_destroy( movablesToPush );
        }
    }
    else if ( place_meeting( x, y, objFormation ) ) {
        var pushDir = point_direction( x, y, objFormation.x, objFormation.y );
        if ( argument_count == 1 ) {
            pushDir = argument[0];
        }
        movablePush( id, objFormation.id, pushDir, knockback );
            
        var list = ds_list_create();
        ds_list_add( list, objFormation.id );
        return list;
    }
    return undefined;
}
