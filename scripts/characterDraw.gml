///characterDraw( drawUpperPart )
{
    // Enable if we dont want animations for moving backwards
    /*if ( x != xprevious ) {
        image_xscale = sign( x - xprevious );
    }
    else {
        image_xscale = sign( lengthdir_x( 1, formationDirection( 1 ) ) );
    }*/
    
    // Enable if we do want animations for moving backwards
    draw_sprite_ext( sprShadow, 0, x, y, 1, 1, 0, c_white, 0.4 );
    
    image_xscale = sign( lengthdir_x( 1, formationDirection( 1 ) ) );
    
    if ( image_xscale == 0 ) {
        image_xscale = 1;
    }
    
    var back = undefined, lower = undefined, upper = undefined, drawUpper = argument0;
    if ( isMoving ) {
        lower = spriteMap[? CharacterSprites.MOVE_LOWER];
        back = spriteMap[? CharacterSprites.MOVE_BACK];
        upper = spriteMap[? CharacterSprites.MOVE_UPPER];
    }
    else {
        lower = spriteMap[? CharacterSprites.IDLE_LOWER];
        back = spriteMap[? CharacterSprites.IDLE_BACK];
        upper = spriteMap[? CharacterSprites.IDLE_UPPER];
    }
    
    if ( drawUpper && back != undefined ) {
        draw_sprite_ext( back, frame, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
    }
    if ( lower != undefined ) {
        draw_sprite_ext( lower, frame, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
    }
    if ( drawUpper && upper != undefined ) {
        draw_sprite_ext( upper, frame, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
    }
    
    if ( global.selectedCharacter == character ) {
        draw_sprite( sprSelector, sprite_index, x, y - 40 );
    }
    
    var distanceMade = max( min( point_distance( xprevious, yprevious, x, y ) / objFormation.maxSpeed, 1.2 ), -1.2 );
    var directionSign = sign( x - xprevious );
    if ( directionSign == 0 ) {
        directionSign = 1;
    }
    var directionVsFacingDirection = image_xscale * directionSign;
    frame = ( frame + directionVsFacingDirection * distanceMade * 0.15 * global.timescale ) mod sprite_get_number( lower );
    if ( frame < 0 ) {
        frame += sprite_get_number( lower );
    }
}
