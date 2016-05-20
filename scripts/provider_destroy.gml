///provider_destroy( type: s, scope?: m )
/*
 * Destroys an ID provider.
 * Note that the provider cannot free the actual instances it contains.
 * For that, either use provider_get_instances or this function's result,
 * iterate through the list of instances and free them yourself.
 *
 * Arguments:
 *   type - the provider's type name (string)
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   The list of instances values or -1 if failed.
 */
{
    // Initialize the ID provider if not already initialized.
    provider_init();
    
    var providerName, scope, provider, indexes, freeIndexes, result;
    providerName = argument[0];
    if ( argument_count == 1 )
        scope = global.providers;
    else
        scope = argument[1];
    
    // If provider doesn't already exist.
    if ( ds_map_exists( scope, providerName ) ) {

        // Get the list of instances values before destroying the provider itself.
        result = provider_get_instances( providerName, scope );
        provider = ds_map_find_value( scope, providerName );
        
        // Free indexes
        indexes = ds_map_find_value( provider, 'indexes' );
        ds_list_clear( indexes );
        ds_list_destroy( indexes );
        
        // Free free indexes (lol)
        freeIndexes = ds_map_find_value( provider, 'freeIndexes' );
        ds_queue_clear( freeIndexes );
        ds_queue_destroy( freeIndexes );
        
        // Free actual provider map
        ds_map_clear( provider );
        ds_map_destroy( provider );
        
        // Remove provider key from scope map
        ds_map_delete( scope, providerName );
        
        return result;
    }
    return -1;
}

