///ds_vector_sub_list( id: n, list: ln )
/*
 * Subtracts from a vectors values given its ID with a list.
 * Arguments:
 *   id   - the vector instance ID
 *   list - a list of vector values
 *
 * Returns the vector ID (for chaining calls) or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot subtract from vector (', argument0, '). Vector does not exist.' ), false );
        return -1;
    }
    else if ( !ds_exists( argument1, ds_type_list ) ) {
        _ds_vector_error( concat( 'Cannot subtract from vector (', argument0, '). List does not exist or is invalid.' ), false );
        return -1;
    }
    
    var size = ds_list_size( data );
    if ( size != ds_list_size( argument1 ) ) {
        _ds_vector_error( concat( 'Cannot subtract from vector (', argument0, '). Needed ', size, ' dimensions, but was given ', ds_list_size( argument1 ), '.'), false );
        return -1;
    }
    
    for ( var i = 0; i < size; i += 1 )
        data[| i] -= argument1[| i];
    
    return argument0;
}

