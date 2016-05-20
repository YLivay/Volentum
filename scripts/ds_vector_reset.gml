///ds_vector_reset( id: n )
/*
 * Resets a vectors values to 0.
 * Arguments:
 *   id       - the vector instance ID
 *
 * Returns the vector ID (for chaining calls) or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 )
        return -1;
    
    var size = ds_list_size( data );
    for ( var i = 0; i < size; i += 1 )
        data[| i] = 0;
    
    return argument0;
}

