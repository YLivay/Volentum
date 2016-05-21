///isKeyReleased( key )
{
    if ( argument_count == 1 || !global.cinematics || argument[1] == true ) {
        return keyboard_check_released( global.keyMapping[? argument[0]] );
    }
    return false;
}
