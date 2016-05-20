///characterInit( character )
{
    // One of the Characters enum values.
    character = argument0;
    
    isMoving = false;
    prevIsMoving = false;
    
    spriteMap = global.characterSprites[? character];
    frame = 0;
    
    focus = 100;
}
