///keyMappingInit()
{
    global.keyMapping = ds_map_create();
    
    enum Keys {
        UP,
        DOWN,
        LEFT,
        RIGHT,
        ACTION,
        SPECIAL,
        SWITCH_CLOCKWISE,
        SWITCH_COUNTER_CLOCKWISE,
        SWITCH_RIGHT,
        SWITCH_LEFT,
        SWITCH_FREY,
        SWITCH_MIA,
        SWITCH_ALF,
        ANYKEY,
    }
    
    global.switchKeys = ds_list_create();
    ds_list_add( global.switchKeys,
        Keys.SWITCH_CLOCKWISE,
        Keys.SWITCH_COUNTER_CLOCKWISE,
        Keys.SWITCH_RIGHT,
        Keys.SWITCH_LEFT,
        Keys.SWITCH_FREY,
        Keys.SWITCH_MIA,
        Keys.SWITCH_ALF
    );
    
    keyMappingSet(
        vk_up,
        vk_down,
        vk_left,
        vk_right,
        ord( 'Z' ),
        ord( 'X' ),
        ord( 'W' ),
        ord( 'Q' ),
        ord( 'S' ),
        ord( 'A' ),
        ord( '1' ),
        ord( '2' ),
        ord( '3' ) );
}
