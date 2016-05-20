///ds_vector_init( suppress errors?: b, NaN value?: n )
/*
 * Initializes the vector system.
 * Arguments:
 *   suppress errors [optional] - If true, errors will be suppressed. False by default
 *   NaN value [optional] - A value that will be returned when errors are suppressed but
 *                          the result makes no sense (e.g. dot product with non equal dimensions).
 *                          by default it's -13371337 because 1337.
 *
 * Returns true if succeeded.
 */
{
    if ( flag( 'vectors' ) )
        exit;
    
    if ( argument_count == 2 )
        global.VECTORS_NAN_VALUE = argument[1];
    else
        global.VECTORS_NAN_VALUE = -13371337;
    
    if ( argument_count >= 1 )
        global.vectors_suppress_errors = argument[0];
    else
        global.vectors_suppress_errors = false;
    
    if ( !provider_create( 'ds_vector' ) ) {
        unflag( 'vectors' );
        return false;
    }
    return true;
}

