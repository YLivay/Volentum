///levelSpawn()
{
    // Spawn for everything but the boss level.
    if ( global.currentLevel < global.levelCount - 1 ) {
        var level = global.levelData[| global.currentLevel];
        var toSpawn = level[? 'initialSpawnGroups'];
        var spawnGroupObjs = ds_list_create();
        ds_list_copy( spawnGroupObjs, level[? 'spawnGroupObjs'] );
        
        for ( var i = 0; i < toSpawn; i++ ) {
            var index = floor( random( ds_list_size( spawnGroupObjs ) ) );
            var spawnGroupObj = ds_list_find_value( spawnGroupObjs, index );
            ds_list_delete( spawnGroupObjs, index );
            
            var weight = irandom( level[? 'totalWeight'] );
            var groups = level[? 'spawnGroups'];
            var group;
            var j = 0;
            do {
                group = groups[| j];
                weight -= group[? 'weight'];
                j += 1;
            }
            until ( weight <= 0 );
            
            var groupSpawns = group[? 'spawns'];
            var groupSpawnSize = ds_list_size( groupSpawns );
            var dirOffset = irandom( 360 );
            for ( j = 0; j < groupSpawnSize; j++ ) {
                instance_create( spawnGroupObj.x + lengthdir_x( 32, dirOffset ), spawnGroupObj.y + lengthdir_y( 32, dirOffset ), groupSpawns[| j] );
                dirOffset += 360 / groupSpawnSize;
            }
        }
        
        ds_list_clear( spawnGroupObjs );
        ds_list_destroy( spawnGroupObjs );
    }
    global.levelSpawned = true;
}
