///levelDefine( level: n, initialSpawnGroups: n )
{
    var level = ds_map_create();
    level[? 'totalWeight'] = 0;
    level[? 'spawnGroups'] = ds_list_create();
    level[? 'initialSpawnGroups'] = argument1;
    level[? 'spawnGroupObjs'] = ds_list_create();
    
    global.levelData[| argument0] = level;
    
    return level;
}
