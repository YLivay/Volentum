///ds_vector_create_array( array: n[], length? )
/*
 * Creates a new vector from an array.
 * Arguments:
 *   array             - an array of vector values
 *   length [optional] - the number of dimensions to define. By default takes the entire array.
 *
 * Returns the new vector instance ID or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var size;
    if ( argument_count == 1 )
        size = array_length_1d( argument[0] );
    else
        size = argument[1];
    
    // Create the actual vector data.
    var data = ds_list_create();
    var array = argument[0];
    for ( var i = 0; i < size; i += 1 )
        data[| i] = array[@ i];
    
    return provider_instance_create( 'ds_vector', data );
}

