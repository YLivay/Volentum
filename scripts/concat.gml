///concat( val1, val2, val3... )
/**
 * Concatenates values to space separated string.
 * Arguments are values to concatenate
 */
{
    var result = '';
    for ( var i = 0; i < argument_count; i += 1 ) {
        if ( is_array( argument[i] ) ) {
            var array = argument[i];
            var length = array_length_1d( array );
            for ( var j = 0; j < length; j += 1 )
                result += concat( array[j] );
        }
        else if ( is_string( argument[i] ) )
            result += argument[i];
        else
            result += string( argument[i] );
    }
    return result;
}
