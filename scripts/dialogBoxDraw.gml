///dialogBoxDraw( x, y, font, color, color2 )
{
    if ( global.dialogBoxSprite != -1 ) {
        draw_sprite( global.dialogBoxSprite, 0, argument0, argument1 );
    }
    
    if ( global.dialogBoxCurrentPortrait != -1 ) {
        draw_sprite( global.dialogBoxCurrentPortrait, global.dialogBoxCurrentPortraitImage, argument0 + global.dialogBoxPortraitX, argument1 + global.dialogBoxPortraitY );
    }
    
    draw_set_font( argument2 );
    if ( global.dialogBoxCurrentCaption != '' ) {
        draw_text_ext_color( argument0 + global.dialogBoxCaptionX + 1, argument1 + global.dialogBoxCaptionY + 1, global.dialogBoxCurrentCaption, -1, -1, c_black, c_black, c_black, c_black, 1 );
        draw_text_ext_color( argument0 + global.dialogBoxCaptionX, argument1 + global.dialogBoxCaptionY, global.dialogBoxCurrentCaption, -1, -1, global.dialogBoxCurrentCaptionColor, global.dialogBoxCurrentCaptionColor, global.dialogBoxCurrentCaptionColor, global.dialogBoxCurrentCaptionColor, 1 );
    }
    
    var displayLinesCount = ds_list_size( global.dialogBoxDisplayLines );
    for ( var i = 0; i < displayLinesCount; i += 1 ) {
        var line = global.dialogBoxDisplayLines[| i];
        draw_text_ext_color( argument0 + global.dialogBoxTextX + 1, argument1 + global.dialogBoxTextY + i * string_height( '1' ) + 1, line, -1, -1, c_black, c_black, c_black, c_black, 1 );
        draw_text_ext_color( argument0 + global.dialogBoxTextX, argument1 + global.dialogBoxTextY + i * string_height( '1' ), line, -1, -1, argument3, argument3, argument4, argument4, 1 );
    }
}
