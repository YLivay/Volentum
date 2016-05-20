///ds_vector_set_length( id: n, length: n )
{
    var length = ds_vector_length( argument0 );
    if ( length == global.VECTORS_NAN_VALUE ) {
        return -1;
    }

    ds_vector_scale( argument0, argument1 / length );
    return argument0;
}
