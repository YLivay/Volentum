///playerSwitchCharacter( switchKey )
{
    switch ( argument0 ) {
        case Keys.SWITCH_CLOCKWISE:
            global.selectedCharacter -= 1;
            if ( global.selectedCharacter < 0 ) {
                global.selectedCharacter += 3;
            }
            break;
        
        case Keys.SWITCH_COUNTER_CLOCKWISE:
            global.selectedCharacter = ( global.selectedCharacter + 1 ) mod 3;
            break;
        
        case Keys.SWITCH_RIGHT:
            var xx = characterX( global.selectedCharacter );
            var char2 = ( global.selectedCharacter + 1 ) mod 3;
            var char3 = global.selectedCharacter - 1;
            if ( char3 < 0 ) {
                char3 += 3;
            }
            
            if ( characterX( char2 ) >= characterX( char3 ) ) {
                global.selectedCharacter = char2;
            }
            else {
                global.selectedCharacter = char3;
            }
            break;
        
        case Keys.SWITCH_LEFT:
            var xx = characterX( global.selectedCharacter );
            var char2 = ( global.selectedCharacter + 1 ) mod 3;
            var char3 = global.selectedCharacter - 1;
            if ( char3 < 0 ) {
                char3 += 3;
            }
            
            if ( characterX( char2 ) <= characterX( char3 ) ) {
                global.selectedCharacter = char2;
            }
            else {
                global.selectedCharacter = char3;
            }
            break;
        
        case Keys.SWITCH_FREY:
            global.selectedCharacter = Characters.FREY;
            break;
        
        case Keys.SWITCH_MIA:
            global.selectedCharacter = Characters.MIA;
            break;
        
        case Keys.SWITCH_ALF:
            global.selectedCharacter = Characters.ALF;
            break;
    }
}
