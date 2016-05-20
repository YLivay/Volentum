///withMovables( script )
{
    var movableCount = ds_list_size( global._movables );
    for ( var i = 0; i < movableCount; i++ ) {
        var movable = global._movables[| i];
        if ( movable ) {
            if ( instance_exists( movable ) ) {
                with ( movable ) {
                    script_execute( argument0 );
                }
            }
            else {
                movableDestroy( movable );
            }
        }
    }
}
