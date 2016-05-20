///provider_get_instance( type: s, id: n, scope?: m )
/*
 * Gets an instance value for a given ID provider type given the instance ID.
 *
 * Arguments:
 *   type   - the provider's type name (string)
 *   id     - the instance's ID.
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   The instance value or -1 if failed.
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
        var provider, indexes, instance;
        provider = ds_map_find_value(scope, providerName);
        indexes = ds_map_find_value(provider, 'indexes');
        instance = -1;
        
        // If the instance ID makes sense (Is in the instances IDs list)
        if ( instanceId >= 0 && ds_list_size( indexes ) > instanceId ) {
            instance = ds_list_find_value( indexes, instanceId );
            
            // If the instance has been freed already
            if ( is_real( instance ) && instance == -1 ) {
                _provider_error( 'Error when getting an instance (' + string( instanceId ) + ') for provider (' + string( providerName ) + '):#Instance does not exist (most likely been freed).', false );
                return -1;
            }
        }
        else
        {
            _provider_error( 'Error when getting an instance (' + string( instanceId ) + ') for provider (' + string( providerName ) + '):#Invalid instance ID.', false );
            return -1;
        }
        return instance;
    }

    // If provider does exist, raise an error.
    _provider_error( 'Error getting an instance (' + string( instanceId ) + ') for provider (' + string( providerName ) + '):#Provider does not exist.', false);
    return -1;
}

