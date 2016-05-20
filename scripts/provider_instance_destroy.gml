///provider_instance_destroy( type: s, id: n, scope?: m )
/*
 * Destroys (frees) an instance's ID for a given ID provider type.
 * Note: It does not free the actual instance - only it's ID allocation.
 *
 * Arguments:
 *   type   - the provider's type name (string)
 *   id     - the instance ID.
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   The destroyed instance value or -1 if failed.
 */
{
    // Initialize the ID provider if not already initialized.
    provider_init();
    
    var providerName, instanceId, scope;
    providerName = argument[0];
    instanceId = argument[1];
    if ( argument_count == 2 )
        scope = global.providers;
    else
        scope = argument[2];

    if ( ds_map_exists( scope, providerName ) ) {
        var provider, indexes, freeIndexes, instance;
        provider = ds_map_find_value( scope, providerName );
        indexes = ds_map_find_value( provider, 'indexes' );
        freeIndexes = ds_map_find_value( provider, 'freeIndexes' );
        instance = -1;
        
        // If the instance ID makes sense (Is in the instances IDs list)
        if ( instanceId >= 0 && ds_list_size(indexes) > instanceId ) {
            instance = ds_list_find_value( indexes, instanceId );
            
            // If the instance has been freed already
            if ( is_real(instance) && instance == -1 ) {
                _provider_error( 'Error when freeing an instance (' + string( instanceId ) + ') for provider (' + string( providerName ) + '):#Instance does not exist (most likely been freed).', false );
                return -1;
            }
            
            // Mark index as freed by putting -1 there and adding the index to the free indexes queue
            ds_list_replace( indexes, instanceId, -1 );
            ds_queue_enqueue( freeIndexes, instanceId );
        }
        else {
            _provider_error( 'Error when freeing an instance (' + string( instanceId ) + ') for provider (' + string( providerName ) + '):#Invalid instance ID.', false );
            return -1;
        }
        return instance;
    }
    
    // If provider does exist, raise an error.
    _provider_error( 'Error freeing an instance (' + string( instanceId ) + ') for provider (' + string( providerName ) + '):#Provider does not exist.', false);
    return -1;
}

