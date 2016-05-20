///ds_vector_length( id: n )
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument[0] );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate length for vector (', argument[0], '). Vector doesn not exist.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var result = 0, size = ds_list_size( data );
    for ( var i = 0; i < size; i += 1 )
        result += power( data[| i], 2 );
    
    return sqrt( result );
}
