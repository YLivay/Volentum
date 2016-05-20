///ds_vector_div_vector( id: n, source: m )
/*
 * Divides a vectors values given its ID with another vector.
 * Arguments:
 *   id     - the vector instance ID
 *   source - the source vector containing the vector valuesr
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
    var otherData = provider_get_instance( 'ds_vector', argument1 );
    if ( otherData == -1 ) {
        _ds_vector_error( concat( 'Cannot divide vector ( ', argument0, ' ). Other vector ( ', argument1, ' ) does not exist or is invalid.' ), false );
        return -1;
    }
    
    var size = ds_list_size( data );
    if ( size != ds_list_size( otherData ) ) {
        _ds_vector_error( concat( 'Cannot divide vector ( ', argument0, ' ). Needed ', size, ' dimensions, but was given ', ds_list_size( otherData ), '.' ), false );
        return -1;
    }
    
    for ( var i = 0; i < size; i += 1 )
        data[| i] /= otherData[| i];
    
    return argument0;
}

