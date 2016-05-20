///ds_vector_mult( id: n, scale: n )
/*
 * Scales a vectors values given its ID.
 * This function is limited for 15 dimension vectors, if you need more:
 * use ds_vector_mult_array, ds_vector_mult_list or ds_vector_mult_vector
 * Arguments:
 *   id    - the vector instance ID
 *   scale - the scale
 *
 * Returns the vector ID (for chaining calls) or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot multiply vector ( ', argument0, ' ). Vector does not exist.' ), false );
        return -1;
    }
    
    var size = ds_list_size( data );
    for ( var i = 0; i < size; i += 1 )
        data[| i] *= argument1;
    
    return argument0;
}

