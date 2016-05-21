///isKeyPressed( key: n, ignoreCinematics?: n )
{
    if ( argument_count == 1 || !global.cinematics || argument[1] == true ) {
        return keyboard_check_pressed( global.keyMapping[? argument[0]] );
    }
    return false;
}
