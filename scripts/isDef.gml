///isDef( something:s ): b
{
    if ( !ds_map_exists( global._isDef, argument0 ) ) {
        global._isDef[? argument0] = true;
        return true;
    }
    return false;
}
