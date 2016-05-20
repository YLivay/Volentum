///ds_vector_cross( id: n, num1: n, num2: n, num3: n )
/*
 * Calculates a cross product of a vector given its ID.
 * This function supports only the 3 dimensional cross product.
 * Yes, I know theres a generic formula and the 7 dimensional one,
 * but at this point i'm too lazy to implement it. Deal with it :D
 *
 * Arguments:
 *   id       - the vector instance ID
 *   the rest - the vector values
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
    else if ( ds_list_size( data ) != 3 ) {
        _ds_vector_error( concat( 'Cannot calculate cross product for vector (', argument0, '). Only 3-dimensional operation is supported.' ), false );
        return -1;
    }
    
    var result = ds_vector_create( data[| 1] * argument3 - data[| 2] * argument2,
                                   data[| 2] * argument1 - data[| 0] * argument3,
                                   data[| 0] * argument2 - data[| 1] * argument1 );
    if ( result == -1 ) {
        _ds_vector_error(concat('Cannot calculate cross product for vector (', argument0, '). Failed to create new vector.'), false);
        return -1;
    }
    return result;
}

