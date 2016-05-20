///ds_vector_exists( id: n )
/*
 * Checks if a vector exists given it's ID.
 * Arguments are self explanatory, I hope.
 *
 * Returns true if the vector exists, false otherwise.
 */
{
    // Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    return provider_instance_exists( 'ds_vector', argument0 );
}

