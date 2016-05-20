///ds_list_delete_value( list:l, value:? ): n - Deletes a value from the list and returns its old index.
{
    var result = ds_list_find_index( argument0, argument1 );
    if ( result != -1 ) {
        ds_list_delete( argument0, result );
    }
    return result;
}
