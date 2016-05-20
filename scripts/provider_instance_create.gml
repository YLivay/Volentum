///provider_instance_create( type: s, value: ?, scope?: m )
/*
 * Creates a new instance for a given ID provider type.
 *
 * Arguments:
 *   type   - the provider's type name (string)
 *   value  - the instance value to provide an instance ID for.
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   The provided instance ID or -1 if failed.
 */
{
    // Initialize the ID provider if not already initialized.
    provider_init();
    
    var providerName, instanceValue, scope;
    providerName = argument[0];
    instanceValue = argument[1];
    if ( argument_count == 2 )
        scope = global.providers;
    else
        scope = argument[2];
    
    if ( ds_map_exists( scope, providerName ) ) {
        var provider, indexes, freeIndexes, newIndex;
        provider = ds_map_find_value( scope, providerName );
        indexes = ds_map_find_value( provider, 'indexes' );
        freeIndexes = ds_map_find_value( provider, 'freeIndexes' );
        
        // If the free indexes queue is empty, create NEW index.
        if ( ds_queue_empty( freeIndexes ) ) {
            ds_list_add( indexes, instanceValue );
            newIndex = ds_list_size( indexes ) - 1;
        }
        // If not, reuse and index from the free indexes queue.
        else {
            newIndex = ds_queue_dequeue( freeIndexes );
            ds_list_replace( indexes, newIndex, instanceValue );
        }
        return newIndex;
    }

    // If provider does exist, raise an error.
    _provider_error('Error creating a new instance for provider (' + string(providerName) + '):#Provider does not exist.', false);
    return -1;
}

