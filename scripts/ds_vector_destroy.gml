///ds_vector_destroy( id: n )
/*
 * Destroys a vector given it's ID.
 * Arguments are self explanatory, I hope.
 *
 * Returns true if succeeded, false otherwise.
 */
{
    // Initialize the ds_position if not initialized already.
    ds_vector_init();
    
    var data = provider_instance_destroy( 'ds_vector', argument0 );
    if ( data == -1 )
        return false;
    
    // Free the actual position data.
    if ( is_real(data) && ds_exists( data, ds_type_list ) ) {
        ds_list_clear( data );
        ds_list_destroy( data );
    }
    return true;
}

