///provider_create( type: s, scope?: m)
/*
 * Creates a new ID provider.
 * A scope is a ds_map which you can optionally specify to be used as the scope
 * for the provider you're creating. Using a custom scope lets you define the
 * same provider type multiple times. This way, you can have instance IDs that are
 * local to the scope you're using rather than globally should you need to.
 *
 * Arguments:
 *   type   - the provider's type name (string)
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   true if succeeded.
 */
{
    // Initialize the ID provider if not already initialized.
    provider_init();
    
    var providerName, scope, provider;
    providerName = argument[0];
    if ( argument_count == 1 )
        scope = global.providers;
    else
        scope = argument[1];
    
    // If provider doesn't already exist.
    if ( !ds_map_exists( scope, providerName ) ) {
        provider = ds_map_create();
        ds_map_add_list( provider, 'indexes', ds_list_create() );
        ds_map_add_list( provider, 'freeIndexes', ds_queue_create() );
        ds_map_add_map( scope, providerName, provider );
        return true;
    }
    
    // If provider does exist, raise an error.
    _provider_error( 'Error defining a new provider type (' + string( providerName ) + '):#Provider already exists.', false );
    return false;
}

