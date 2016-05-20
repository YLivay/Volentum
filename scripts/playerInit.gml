///playerInit( selectedCharacter, lockedCharacters? )
{
    global.selectedCharacter = argument[0];
    
    if ( argument_count == 2 ) {
        global.lockedCharacters = argument[1];
    }
    else {
        global.lockedCharacters = ds_list_create();
    }
    
    global.hp = PLAYER_HP;
    global.invincibility = 0;
}
