///ds_vector_set_direction( id: n, angle: n )
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate direction for vector (', argument0, '). Vector doesn not exist.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    else if ( ds_list_size( data ) != 2 ) {
        _ds_vector_error( concat( 'Cannot calculate direction for vector (', argument0, '). Needed 2 dimensions, but was given ', ds_list_size( data ), '.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var length = sqrt( power( data[| 0], 2 ) + power( data[| 1], 2 ) );
    data[| 0] = lengthdir_x( length, argument1 );
    data[| 1] = lengthdir_y( length, argument1 );
}
