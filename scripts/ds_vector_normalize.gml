///ds_vector_normalize( id: n )
{
    var length = ds_vector_set_length( argument0, 1 );
    if ( length == global.VECTORS_NAN_VALUE ) {
        return -1;
    }
    return argument0;
}
