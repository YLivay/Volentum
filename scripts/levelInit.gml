///levelInit()
{
    global.levelData = ds_list_create();
    global.levelCount = instance_number( objCheckpoint );
    global.currentLevel = 0;
    
    // Frey level - introduce skeletons
    levelDefine( 0, 2 );
    levelAddSpawnGroup( 0, 1, objSkeleton );
    
    // Mia level - introduce dark mages
    levelDefine( 1, 2 );
    levelAddSpawnGroup( 1, 1, objDarkMage );
    
    // Alf level - Add protected arrow trap and clumps of skeletons
    levelDefine( 2, 3 );
    levelAddSpawnGroup( 2, 1, objSkeleton, objSkeleton );
    levelAddSpawnGroup( 2, 1, objSkeleton, objSkeleton, objSkeleton );
    
    // Level 4 - introduce spiders
    levelDefine( 3, 4 );
    levelAddSpawnGroup( 3, 2, objSkeleton, objSpider );
    levelAddSpawnGroup( 3, 1, objSkeleton, objDarkMage );
    levelAddSpawnGroup( 3, 1, objSpider, objDarkMage );
    levelAddSpawnGroup( 3, 2, objSpider, objSpider, objSpider );
    
    // Level 5 - introduce spider nests
    levelDefine( 4, 5 );
    levelAddSpawnGroup( 4, 1, objSkeleton, objSkeleton );
    levelAddSpawnGroup( 4, 1, objSkeleton, objSkeleton, objSkeleton );
    levelAddSpawnGroup( 4, 1, objSkeleton, objDarkMage, objDarkMage );
    levelAddSpawnGroup( 4, 1, objSpider, objSpider, objSpider, objSkeleton );
    levelAddSpawnGroup( 4, 1, objSpider, objSpider, objSpider, objDarkMage );
    
    // Level 6 - introduce brutes
    levelDefine( 5, 7 );
    levelAddSpawnGroup( 5, 1, objBrute, objSkeleton );
    levelAddSpawnGroup( 5, 3, objSkeleton, objDarkMage, objSpider );
    levelAddSpawnGroup( 5, 1, objBrute, objDarkMage );
    levelAddSpawnGroup( 5, 1, objBrute, objSpider, objSpider );
    levelAddSpawnGroup( 5, 1, objSkeleton, objSkeleton, objSkeleton, objSkeleton );
}
