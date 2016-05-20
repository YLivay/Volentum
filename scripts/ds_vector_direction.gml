///ds_vector_direction( id: n )
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument[0] );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate direction for vector (', argument[0], '). Vector doesn not exist.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    else if ( ds_list_size( data ) != 2 ) {
        _ds_vector_error( concat( 'Cannot calculate direction for vector (', argument0, '). Needed 2 dimensions, but was given ', ds_list_size( data ), '.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    return point_direction( 0, 0, data[| 0], data[| 1] );
}
