///isMovable( obj:n ): b - Returns true if an object is movable.
{
    return ds_list_find_index( global._movables, argument0 ) != -1;   
}
