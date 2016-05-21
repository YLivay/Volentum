///gameInit
{
    flags_init();
    
    enum Characters {
        ALF = 0,
        MIA = 1,
        FREY = 2,
        BRIAN = 3,
    }
    
    enum CharacterSprites {
        IDLE_LOWER = 0,
        IDLE_UPPER = 1,
        IDLE_BACK = 2,
        MOVE_LOWER = 3,
        MOVE_UPPER = 4,
        MOVE_BACK = 5,
        ATTACK_UPPER = 6,
        ATTACK_BACK = 7,
    }
    
    global.characterSprites = ds_map_create();
    var charSprites = ds_map_create();
    charSprites[? CharacterSprites.IDLE_LOWER] = sprAlfLowerIdle;
    charSprites[? CharacterSprites.IDLE_UPPER] = sprAlfUpperIdle;
    charSprites[? CharacterSprites.IDLE_BACK] = sprAlfBackIdle;
    
    charSprites[? CharacterSprites.MOVE_LOWER] = sprAlfLowerMoving;
    charSprites[? CharacterSprites.MOVE_UPPER] = sprAlfUpperMoving;
    charSprites[? CharacterSprites.MOVE_BACK] = sprAlfBackMoving;
    
    charSprites[? CharacterSprites.ATTACK_UPPER] = sprAlfUpperAttacking;
    charSprites[? CharacterSprites.ATTACK_BACK] = sprAlfBackAttacking;
    global.characterSprites[? Characters.ALF] = charSprites;
    
    charSprites = ds_map_create();
    charSprites[? CharacterSprites.IDLE_LOWER] = sprMiaLowerIdle;
    charSprites[? CharacterSprites.IDLE_UPPER] = sprMiaUpperIdle;
    charSprites[? CharacterSprites.IDLE_BACK] = sprMiaBackIdle;
    
    charSprites[? CharacterSprites.MOVE_LOWER] = sprMiaLowerMoving;
    charSprites[? CharacterSprites.MOVE_UPPER] = sprMiaUpperMoving;
    charSprites[? CharacterSprites.MOVE_BACK] = sprMiaBackMoving;
    
    charSprites[? CharacterSprites.ATTACK_UPPER] = sprMiaUpperAttack;
    charSprites[? CharacterSprites.ATTACK_BACK] = sprMiaBackAttack;
    global.characterSprites[? Characters.MIA] = charSprites;
    
    charSprites = ds_map_create();
    charSprites[? CharacterSprites.IDLE_LOWER] = sprFreyLowerIdle;
    charSprites[? CharacterSprites.IDLE_UPPER] = sprFreyUpperIdle;
    charSprites[? CharacterSprites.IDLE_BACK] = sprFreyBackIdle;
    
    charSprites[? CharacterSprites.MOVE_LOWER] = sprFreyLowerMoving;
    charSprites[? CharacterSprites.MOVE_UPPER] = sprFreyUpperMoving;
    charSprites[? CharacterSprites.MOVE_BACK] = sprFreyBackMoving;
    
    charSprites[? CharacterSprites.ATTACK_UPPER] = sprFreyUpperAttack;
    charSprites[? CharacterSprites.ATTACK_BACK] = sprFreyBackAttack;
    global.characterSprites[? Characters.FREY] = charSprites;
    
    global.cinematics = false;
    keyMappingInit();
    
    global._movables = ds_list_create();
    global.timescale = 1;
    
    // Assign levels to checkpoints based on their x ordering. Right = higher level.
    tempCheckpoints = ds_priority_create();
    tempDoors = ds_priority_create();
    with ( objCheckpoint ) {
        ds_priority_add( other.tempCheckpoints, id, x );
    }
    
    with ( objDoor ) {
        ds_priority_add( other.tempDoors, id, x );
    }
    
    global.checkpoints = ds_list_create();
    while ( !ds_priority_empty( tempCheckpoints ) ) {
        var checkpoint = ds_priority_delete_min( tempCheckpoints );
        checkpoint.level = ds_list_size( global.checkpoints );
        ds_list_add( global.checkpoints, checkpoint );
    }
    ds_priority_clear( tempCheckpoints );
    ds_priority_destroy( tempCheckpoints );
    
    global.levelEntryDoors = ds_list_create();
    global.levelExitDoors = ds_list_create();
    var isEntryDoor = true;
    while ( !ds_priority_empty( tempDoors ) ) {
        var doors = ds_list_create();
        var level = 0;
        if ( isEntryDoor ) {
            level = ds_list_size( global.levelEntryDoors );
        }
        else {
            level = ds_list_size( global.levelExitDoors );
        }
        
        var priority = ds_priority_find_priority( tempDoors, ds_priority_find_min( tempDoors ) );
        show_debug_message( string( priority ) );
        do {
            door = ds_priority_delete_min( tempDoors );
            door.level = level;
            door.isEntry = isEntryDoor;
            ds_list_add( doors, door );
            show_debug_message( ds_priority_find_priority( tempDoors, ds_priority_find_min( tempDoors ) ) );
        }
        until ( ds_priority_find_priority( tempDoors, ds_priority_find_min( tempDoors ) ) != priority );
        
        if ( isEntryDoor ) {
            ds_list_add( global.levelEntryDoors, doors );
        }
        else {
            ds_list_add( global.levelExitDoors, doors );
        }
        isEntryDoor = !isEntryDoor;
    }
    ds_priority_clear( tempDoors );
    ds_priority_destroy( tempDoors );
    
    levelInit();
    
    with ( objSpawnGroup ) {
        level = -1;
    }
    
    with ( objSpawnGroup ) {
        show_debug_message( 'Finding checkpoint for spawn group ' + string( x ) );
        // Find the right most checkpoint.
        var bestCheckpoint = noone;
        for ( var i = global.levelCount; i >= 0; i -= 1 ) {
            var checkpoint = global.checkpoints[| i];
            if ( checkpoint != undefined && x > checkpoint.x && ( bestCheckpoint == noone || checkpoint.x > bestCheckpoint.x ) ) {
                bestCheckpoint = checkpoint;
            }
        }
        
        show_debug_message( 'Set it to level ' + string( bestCheckpoint.level ) );
        var data = global.levelData[| bestCheckpoint.level];
        var spawnGroupObjs = data[? 'spawnGroupObjs'];
        ds_list_add( spawnGroupObjs, id );
    }
    
    levelReset( false );
}
