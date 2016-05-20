///ds_vector_project( vec1: n, vec2: n, vec3: n )
{
    var length = ds_vector_length( argument2 );
    if ( ds_vector_length( argument0 ) == 0 || ds_vector_length( argument1 ) == 0 || length == 0 ) {
        ds_vector_set( argument0, 0, 0 );
        return argument0;
    }

    var temp = ds_vector_copy( argument2 );
    ds_vector_scale( temp, ds_vector_dot_vector( argument1, argument2 ) / length );
    ds_vector_set_vector( argument0, temp );
    ds_vector_destroy( temp );
    return argument0;
}
