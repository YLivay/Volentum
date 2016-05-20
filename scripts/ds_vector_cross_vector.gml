///ds_vector_cross_vector( id: n, source: m )
/*
 * Calculates a cross product of a vector given its ID with a vector.
 * This function supports only the 3 dimensional cross product.
 * Yes, I know theres a generic formula and the 7 dimensional one,
 * but at this point i'm too lazy to implement it. Deal with it :D
 *
 * Arguments:
 *   id     - the vector instance ID
 *   source - the vector values
 *
 * Returns the cross product vector or an error or -1 if the operation is invalid.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    // Get the actual vector data.
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate cross product for vector (', argument0, '). Vector does not exist.' ), false );
        return -1;
    }
    
    var otherData = provider_get_instance( 'ds_vector', argument1 );
    if ( otherData == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate cross product for vector (', argument0, '). Other vector (', argument1, ') does not exist or is invalid.' ), false );
        return -1;
    }
    
    var size = ds_list_size( data );
    if ( size != 3 || size != ds_list_size( otherData ) ) {
        _ds_vector_error( concat( 'Cannot add to vector (', argument0, '). Only 3-dimensional operation is supported.' ), false );
        return -1;
    }
    
    var result = ds_vector_create( data[| 1] * otherData[| 2] - data[| 2] * otherData[| 1],
                                   data[| 2] * otherData[| 0] - data[| 0] * otherData[| 2],
                                   data[| 0] * otherData[| 1] - data[| 1] * otherData[| 0] );
    if ( result == -1 ) {
        _ds_vector_error( concat( 'Cannot calculate cross product for vector (', argument0, '). Failed to create new vector.' ), false );
        return -1;
    }
    return result;
}

