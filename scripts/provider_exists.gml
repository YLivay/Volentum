///provider_exists( type:s, scope?: m )
/*
 * Checks if an ID provider exists.
 *
 * Arguments:
 *   type   - the provider's type name (string)
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   true if the provider exists.
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
    
    // Return if the provider exists.
    return ds_map_exists( scope, providerName );
}

