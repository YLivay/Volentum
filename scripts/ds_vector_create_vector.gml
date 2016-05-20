///ds_vector_create_vector( id: n, length?: n )
/*
 * Creates a new vector from another vector.
 * Arguments:
 *   id                - a vector instance ID containing the vector values
 *   length [optional] - number of dimensions to define. By default takes the entire vector
 *
 * Returns the new vector instance ID or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    // Create the actual vector data.
    var data = ds_list_create();
    var otherData = provider_get_instance( 'ds_vector', argument[0] );
    if ( otherData == -1 ) {
        _ds_vector_error( concat( 'Cannot create vector from existing vector. Existing vector (', argument[0], ') does not exist.' ), false );
        return -1;
    }
    
    if ( argument_count == 1 )
        ds_list_copy( data, otherData );
    else {
        for ( var i = 0; i < argument[1]; i += 1 )
            data[| i] = otherData[| i];
    }
    
    return provider_instance_create( 'ds_vector', data );
}

