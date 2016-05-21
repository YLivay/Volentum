///isKeyDown( key: n, ignoreCinematics?: b )
{
    if ( global.cinematics ) {
        
    }
    if ( argument_count == 1 || !global.cinematics || argument[1] == true ) {
        return keyboard_check( global.keyMapping[? argument[0]] );
    }
    return false;
}
