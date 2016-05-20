///tileGet( x, y, default )
{
    if ( argument0 < 0 || argument0 >= global.levelWidth || argument1 < 0 || argument1 >= global.levelHeight ) {
        return argument2;
    }
    return global.levelTiles[ argument0, argument1 ];
}
