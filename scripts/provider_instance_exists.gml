///provider_instance_exists( type: s, id: n, scope?: m )
/*
 * Checks if an instance exists for a given provider type given the instance ID.
 *
 * Arguments:
 *   type   - the provider's type name (string)
 *   id     - the instance's ID.
 *   scope  - the provider's scope map. Optional, defaults to a built-in global map.
 *
 * Returns:
 *   true if the instance exists.
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
    
    var temp = global.providers_suppress_errors, result;
    global.providers_suppress_errors = true;
    result = provider_get_instance( providerName, instanceId, scope );
    global.providers_suppress_errors = temp;
    
    return ( !is_real(result) || result != -1 );
}

