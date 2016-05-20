///ds_vector_mult( id: n, num1, num2, num3... )
/*
 * Multiplies a vectors values given its ID.
 * This function is limited for 15 dimension vectors, if you need more:
 * use ds_vector_mult_array, ds_vector_mult_list or ds_vector_mult_vector
 * Arguments:
 *   id       - the vector instance ID
 *   the rest - the vector values
 *
 * Returns the vector ID (for chaining calls) or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument[0] );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot multiply vector ( ', argument[0], ' ). Vector does not exist.' ), false );
        return -1;
    }
    else if ( ds_list_size( data ) != argument_count - 1 ) {
        _ds_vector_error( concat( 'Cannot multiply vector ( ', argument[0], ' ). Needed ', ds_list_size( data ), ' dimensions, but was given ', argument_count - 1, '.' ), false );
        return -1;
    }
    
    for ( var i = 0; i < argument_count - 1; i += 1 )
        data[| i] *= argument[i + 1];
    
    return argument[0];
}

