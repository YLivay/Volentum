///ds_vector_dot_list( id: n, list: ln )
/*
 * Calculates a dot product of a vector given its ID with a list.
 * Arguments:
 *   id   - the vector instance ID
 *   list - a list of vector values
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
    else if ( !ds_exists( argument1, ds_type_list ) ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector ( ', argument0, ' ). List does not exist or is invalid.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var size = ds_list_size( data );
    if ( size != ds_list_size( argument1 ) ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector ( ', argument0, ' ). Needed ', size, ' dimensions, but was given ', ds_list_size( argument1 ), '.' ), false );
        return global.VECTORS_NAN_VALUE;
    }

    var result = 0;
    for ( var i = 0; i < size; i += 1 )
        result += data[| i] * argument1[| i];
    
    return result;
}

