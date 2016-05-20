///ds_vector_dot( id: n, num1, num2, num3... )
/*
 * Calculates a dot product of a vector given its ID.
 * This function is limited for 15 dimension vectors, if you need more:
 * use ds_vector_dot_array, ds_vector_dot_list or ds_vector_dot_vector
 * Arguments:
 *   id       - the vector instance ID
 *   the rest - the vector values
 *
 * Returns the dot product or an error / the NaN value if the operation is invalid.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument[0] );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector (', argument[0], '). Vector doesn not exist.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    else if ( ds_list_size( data ) != argument_count - 1 ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector (', argument[0], '). Needed ', ds_list_size( data ), ' dimensions, but was given ', argument_count - 1, '.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var result = 0;
    for ( var i = 0; i < size; i += 1 )
        result += data[| i] * argument[i + 1];
    
    return result;
}

