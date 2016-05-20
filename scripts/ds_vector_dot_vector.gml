///ds_vector_dot_vector( id: n, source: m )
/*
 * Calculates a dot product of a vector given its ID with another vector.
 * Arguments:
 *   id     - the vector instance ID
 *   source - the source vector containing the vector values
 *
 * Returns the dot product or an error / the NaN value if the operation is invalid.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector ( ', argument0, ' ). Vector doesnot exist.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    var otherData = provider_get_instance( 'ds_vector', argument1 );
    if ( otherData == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector ( ', argument0, ' ). Other vector ( ', argument1, ' ) doesnot exist or is invalid.' ), false );
        return global.VECTORS_NAN_VALUE;
    }
    
    var size = ds_list_size( data );
    if ( size != ds_list_size( otherData ) ) {
        _ds_vector_error( concat( 'Cannot calculate dot product for vector ( ', argument0, ' ). Needed ', size, ' dimensions, but was given ', ds_list_size( otherData ), '.' ), false );
        return global.VECTORS_NAN_VALUE;
    }

    var result = 0;
    for ( var i = 0; i < size; i += 1 )
        result += data[| i] * otherData[| i];
    
    return result;
}

