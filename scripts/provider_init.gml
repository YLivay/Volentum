///provider_init( suppress errors?: b )
/*
 * Initializes the id provider system.
 * Arguments:
 *   suppress errors [optional] - If true, errors will be suppressed. False by default.
 */
{
    if ( is_flagged( 'id_provider' ) )
        exit;
    
    global.providers = ds_map_create();
    if ( argument_count == 0 )
        global.providers_suppress_errors = false;
    else
        global.providers_suppress_errors = argument[0];

    flag( 'id_provider' );
}

