///provider_get_ids( type: s, scope?: m )
/*
 * Gets a list of all the instance IDs values held for a given ID provider.
 * Not to be confused with provider_get_instances, this returns IDs and not values.
 * The returned list is a newly constructed one. Modifying it doesn't change
 * anything in the provider and you should manually free it after you're done.
 *
 * Arguments:
 *   type - the provider's type name (string)
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   A list of instance IDs or -1 if failed.
 */
{
    // Initialize the ID provider if not already initialized.
    provider_init();
    
    var providerName, scope;
    providerName = argument[0];
    if (argument_count == 1)
        scope = global.providers;
    else
        scope = argument[1];
    
    if ( ds_map_exists( scope, providerName ) ) {
        var provider, indexes, resultList, i, indexesCount;
        provider = ds_map_find_value( scope, providerName );
        indexes = ds_map_find_value( provider, 'indexes' );
        resultList = ds_list_create();
        
        indexesCount = ds_list_size( indexes );
        for ( i = 0; i < indexesCount; i += 1 ) {
            var val = ds_list_find_value( indexes, i );
            if ( !is_real( val ) || val != -1 )
                ds_list_add( resultList, i );
        }
        return resultList;
    }

    // If provider does exist, raise an error.
    _provider_error( 'Error getting indexes for provider (' + string( providerName ) + '):#Provider does not exist.', false );
    return -1;
}

