///movableDestroy( id?: n )
{
    var mId = id;
    if ( argument_count == 1 ) {
        mId = argument[0];
    }
    ds_list_delete_value( global._movables, mId );
}
