///ds_vector_y( id: n )
{
    //Initialize the ds_vector if not initialized already.
    ds_vector_init();
    
    var data = provider_get_instance( 'ds_vector', argument[0] );
    if ( data == -1 ) {
        _ds_vector_error( concat( 'Cannot get vector y ( ', argument[0], ' ). Vector does not exist.' ), false );
        return -1;
    }
    
    return data[| 1];
}
