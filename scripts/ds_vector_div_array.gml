///ds_vector_div_array( id: n, array: n[] )
/*
 * Divides a vectors values given its ID with an array.
 * Arguments:
 *   id    - the vector instance ID
 *   array - an array of vector values
 *
 * Returns the vector ID (for chaining calls) or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot divide vector ( ', argument0, ' ). Vector does not exist.' ), false );
        return -1;
    }
    else if ( !is_array( argument1 ) ) {
        _ds_vector_error( concat( 'Cannot divide vector ( ', argument0, ' ). Array does not exist or is invalid.' ), false );
        return -1;
    }
    
    var size = ds_list_size( data );
    if ( size != array_length_1d( argument1 ) ) {
        _ds_vector_error( concat( 'Cannot divide vector ( ', argument0, ' ). Needed ', size, ' dimensions, but was given ', array_length_1d( argument1 ), '.' ), false );
        return -1;
    }
    
    for ( var i = 0; i < size; i += 1 )
        data[| i] /= argument1[@ i];
    
    return argument0;
}

