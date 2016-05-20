///flag( name:s )
{
    var result = ds_map_exists( global.flags, argument0 );
    ds_map_replace( global.flags, argument0, true );
    return result;
}

