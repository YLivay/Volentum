///createLevel()
{     
    enum LevelTileColors {
        NOTHING = 0,
        GROUND = 7183558, // make_color_rgb( 198, 156, 109 ),
        CHECKPOINT = 15974144, // make_color_rgb( 0, 191, 243 ),
        SPAWN_GROUP = 16711680, // make_color_rgb( 0, 0, 255 ),
        DOOR = 4895801,
        TORCH = 62207,
    }
    
    enum LevelTiles {
        SOLID = 0,
        FREE = 1,
    }
    
    global.levelWidth = sprite_get_width( sprLevel );
    global.levelHeight = sprite_get_height( sprLevel );
    var xx, yy, topSide, rightSide, veryRightSide, leftSide, veryLeftSide, bottomSide, tile, pixel;
    
    var dirtyHack = instance_create( 0, 0, objSolid );
    dirtyHack.sprite_index = sprLevel;
    dirtyHack.image_index = 0;
    
    var surf = surface_create( global.levelWidth, global.levelHeight );
    surface_set_target( surf );
    draw_sprite( sprLevel, 0, 0, 0 );
    
    // Build base tiles.
    for ( xx = 0; xx < global.levelWidth; xx += 1 ) {
        for ( yy = 0; yy < global.levelHeight; yy += 1 ) {
            global.levelTiles[xx, yy] = LevelTiles.SOLID;
            if ( position_meeting( xx, yy, dirtyHack ) ) {
                pixel = draw_getpixel( xx, yy );
                if ( pixel == LevelTileColors.GROUND ) {
                    //instance_create( xx * 16, yy * 16, objGround );
                    tileAdd( 3, 2, xx, yy, 1 );
                    global.levelTiles[xx, yy] = LevelTiles.FREE;
                }
            }
        }
    }
    show_debug_message( 'Pass 1 complete' );
    
    surface_reset_target();
    surface_free( surf );
    
    dirtyHack.sprite_index = sprLevelTop;
    dirtyHack.image_index = 0;
    
    surf = surface_create( global.levelWidth, global.levelHeight );
    surface_set_target( surf );
    draw_sprite( sprLevelTop, 0, 0, 0 );
    
    // Put misc stuff
    for ( xx = 0; xx < global.levelWidth; xx += 1 ) {
        for ( yy = 0; yy < global.levelHeight; yy += 1 ) {
            if ( position_meeting( xx, yy, dirtyHack ) ) {
                pixel = draw_getpixel( xx, yy );
                if ( pixel == LevelTileColors.CHECKPOINT ) {
                    instance_create( xx * 16, yy * 16, objCheckpoint );
                }
                else if ( pixel == LevelTileColors.SPAWN_GROUP ) {
                    instance_create( xx * 16, yy * 16, objSpawnGroup );
                }
                else if ( pixel == LevelTileColors.DOOR ) {
                    instance_create( xx * 16, yy * 16, objDoor );
                }
                else if ( pixel == LevelTileColors.TORCH ) {
                    instance_create( xx * 16, yy * 16, objTorch );
                }
            }
        }
    }
    
    with ( dirtyHack ) {
        instance_destroy();
    }
    
    show_debug_message( 'Pass 2 complete' );
    
    surface_reset_target();
    surface_free( surf );
    
    // Put solids and the base of the wall tiles.
    for ( xx = 0; xx < global.levelWidth; xx += 1 ) {
        for ( yy = global.levelHeight - 1; yy >= 0; yy -= 1 ) {
            tile = global.levelTiles[xx, yy];
            rightSide = tileGet( xx + 1, yy, tile );
            leftSide = tileGet( xx - 1, yy, tile );
            topSide = tileGet( xx, yy - 1, tile );
            bottomSide = tileGet( xx, yy + 1, tile );
            
            if ( tile == LevelTiles.SOLID ) {
                if ( rightSide == LevelTiles.FREE || leftSide == LevelTiles.FREE || topSide == LevelTiles.FREE || bottomSide == LevelTiles.FREE ) {
                    instance_create( xx * 16, yy * 16, objBlock );
                }
                
                if ( bottomSide == LevelTiles.FREE ) {
                    // Because tiles logically span 32 pixels instead of the 16 pixel per tile in the tileset,
                    // there cannot be a state where left side AND right or up side AND down side are missing.
                    // They have to be either both there or only ONE of them missing.
                    
                    // Base of pillar
                    if ( leftSide == LevelTiles.FREE ) {
                        tileAdd( 3, 2, xx, yy, 1 );
                        tileAdd( 3, 2, xx, yy - 1, 1 );
                        tileAdd( 3, 2, xx, yy - 2, 1 );
                        
                        tileAdd( 0, 4, xx, yy, 0 );
                        tileAdd( 0, 3, xx, yy - 1, -1 );
                        tileAdd( 0, 2, xx, yy - 2, -2 );
                    }
                    else if ( rightSide == LevelTiles.FREE ) {
                        tileAdd( 3, 2, xx, yy, 1 );
                        tileAdd( 3, 2, xx, yy - 1, 1 );
                        tileAdd( 3, 2, xx, yy - 2, 1 );
                        
                        tileAdd( 2, 4, xx, yy, 0 );
                        tileAdd( 2, 3, xx, yy - 1, -1 );
                        tileAdd( 2, 2, xx, yy - 2, -2 );
                    }
                    else {
                        tileAdd( 1, 4, xx, yy, 0 );
                        tileAdd( 1, 3, xx, yy - 1, -1 );
                        tileAdd( 1, 2, xx, yy - 2, -2 );
                    }
                }
                else {
                    if ( leftSide == LevelTiles.SOLID && tileGet( xx - 1, yy + 1, tile ) == LevelTiles.FREE ) {
                        tileAdd( 1, 4, xx, yy, 1 );
                        tileAdd( 2, 3, xx, yy - 1, 1 );
                        tileAdd( 0, 1, xx, yy, 0 );
                        tileAdd( 0, 1, xx, yy - 1, -1 );
                        tileAdd( 3, 1, xx, yy - 2, -2 );
                    }
                    else if ( rightSide == LevelTiles.SOLID && tileGet( xx + 1, yy + 1, tile ) == LevelTiles.FREE ) {
                        tileAdd( 1, 4, xx, yy, 1 );
                        tileAdd( 1, 3, xx, yy - 1, 1 );
                        tileAdd( 2, 1, xx, yy, 0 );
                        tileAdd( 2, 1, xx, yy - 1, -1 );
                        tileAdd( 4, 1, xx, yy - 2, -2 );
                    }
                    else {
                        if ( topSide == LevelTiles.FREE ) {
                            if ( rightSide == LevelTiles.FREE ) {
                                tileAdd( 3, 2, xx, yy, 1 );
                                tileAdd( 2, 0, xx, yy, -3 );
                            }
                            else if ( leftSide == LevelTiles.FREE ) {
                                tileAdd( 3, 2, xx, yy, 1 );
                                tileAdd( 0, 0, xx, yy, -3 );
                            }
                            else {
                                tileAdd( 3, 2, xx, yy, 1 );
                                tileAdd( 1, 0, xx, yy, -3 );
                            }
                        }
                        else {
                            if ( rightSide == LevelTiles.SOLID && tileGet( xx + 1, yy - 1, tile ) == LevelTiles.FREE ) {
                                tileAdd( 4, 0, xx, yy, -3 );
                            }
                            else if ( leftSide == LevelTiles.SOLID && tileGet( xx - 1, yy - 1, tile ) == LevelTiles.FREE ) {
                                tileAdd( 3, 0, xx, yy, -3 );
                            }
                            else {
                                if ( rightSide == LevelTiles.FREE ) {
                                    tileAdd( 3, 2, xx, yy, 1 );
                                    tileAdd( 2, 1, xx, yy, 0 );
                                }
                                else if ( leftSide == LevelTiles.FREE ) {
                                    tileAdd( 3, 2, xx, yy, 1 );
                                    tileAdd( 0, 1, xx, yy, 0 );
                                }
                                else {
                                    //tileAdd( 1, 1, xx, yy, 2 );
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    instance_create( 0, 0, objControl );
    instance_create( 0, 0, objViewpoint );
    instance_create( 8 * 16, 68 * 16, objFormation );
    
    global.screenAlpha = 1;
}
