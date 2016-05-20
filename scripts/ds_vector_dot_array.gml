///ds_vector_dot_array( id: n, array: n[] )
/*
 * Calculates a dot product of a vector given its ID with an array.
 * Arguments:
 *   id    - the vector instance ID
 *   array - an array of vector values
 *
 * Returns the dot product or an error / the NaN value if the operation is invalid.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector ( ', argument0, ' ). Vector does not exist.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    else if ( !is_array( argument1 ) ) {
        _ds_vector_error( concat( 'Cannot add to vector ( ', argument0, ' ). Array does not exist or is invalid.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var size = ds_list_size( data );
    if ( size != array_length_1d( argument1 ) ) {
        _ds_vector_error( concat( 'Cannot add to vector ( ', argument0, ' ). Needed ', size, ' dimensions, but was given ', array_length_1d( argument1 ), '.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var result = 0;
    for ( var i = 0; i < size; i += 1 )
        result += data[| i] * argument1[@ i];
    
    return result;
}

