///ds_vector_set_vector( id: n, source: m )
/*
 * Sets a vectors values given its ID from another vector.
 * Arguments:
 *   id     - the vector instance ID
 *   source - the source vector containing the vector values
 *
 * Returns the vector ID (for chaining calls) or -1 if failed.
 */
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument0 );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot set to vector ( ', argument0, ' ). Vector does not exist.' ), false );
        return -1;
    }
    var otherData = provider_get_instance( 'ds_vector', argument1 );
    if ( otherData == -1 ) {
        _ds_vector_error( concat( 'Cannot set to vector ( ', argument0, ' ). Other vector ( ', argument1, ' ) does not exist or is invalid.' ), false );
        return -1;
    }
    else if ( ds_list_size( data ) != ds_list_size( otherData ) ) {
        _ds_vector_error( concat( 'Cannot set to vector ( ', argument0, ' ). Needed ', ds_list_size( data ), ' dimensions, but was given ', ds_list_size( otherData ), '.' ), false );
        return -1;
    }
    
    ds_list_copy( data, otherData );
    return argument0;
}

