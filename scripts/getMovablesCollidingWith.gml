#define getMovablesCollidingWith
///getMovablesCollidingWith( obj?: n )
{
    collidingMovables = ds_list_create();
    collidingMovablesObj = id;
    if ( argument_count == 1 ) {
        collidingMovablesObj = argument[0];
    }
    
    withMovables( _getMovablesCollidingWith );
    return collidingMovables;
}

#define _getMovablesCollidingWith
///_getMovablesCollidingWith()
{
    if ( place_meeting( x, y, other.collidingMovablesObj ) ) {
        ds_list_add( other.collidingMovables, id );
    }
}