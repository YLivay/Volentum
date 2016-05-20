///unflag( name:s )
{
    if ( ds_map_exists( global.flags, argument0 ) ) {
        ds_map_delete( global.flags, argument0 );
        return true;
    }
    return false;
}

