///ds_vector_create_list( list: ln, length?: n )
/*
 * Creates a new vector from a list.
 * Arguments:
 *   list              - a list of vector values
 *   length [optional] - number of dimensions to define. By default takes the entire list
 *
 * Returns the new vector instance ID or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    // Create the actual vector data.
    var data = ds_list_create();
    if ( argument_count == 1 )
        ds_list_copy( data, argument[0] );
    else {
        var list = argument[0];
        for ( var i = 0; i < argument[1]; i += 1 )
            data[| i] = list[| i];
    }
    
    return provider_instance_create( 'ds_vector', data );
}

