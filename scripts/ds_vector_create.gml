///ds_vector_create( num1, num2, num3... )
/*
 * Creates a new vector.
 * This function is limited for 16 dimension vectors, if you need more:
 * use ds_vector_create_array, ds_vector_create_list or ds_vector_create_vector
 * Arguments are numbers for each dimension.
 *
 * Returns the new vector instance ID or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    // Create the actual vector data.
    var data = ds_list_create();
    for ( var i = 0; i < argument_count; i += 1 )
        data[| i] = argument[i];
    
    return provider_instance_create( 'ds_vector', data );
}

