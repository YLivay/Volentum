///levelAddSpawnGroup( level: n, weight: n, enemies... )
{
    var group = ds_map_create();
    group[? 'weight'] = argument[1];
    
    var spawns = ds_list_create();
    for ( var i = 2; i < argument_count; i++ ) {
        ds_list_add( spawns, argument[i] );
    }
    group[? 'spawns'] = spawns;
    
    var data = global.levelData[| argument[0]];
    data[? 'totalWeight'] += argument[1];
    var levelSpawnGroups = data[? 'spawnGroups'];
    ds_list_add( levelSpawnGroups, group );
    
    return group;
}
