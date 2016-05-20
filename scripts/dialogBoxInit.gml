///dialogBoxInit( dialogBoxSprite: n, captionX: n, captionY: n, portaitX: n, portraitY: n, textX: n, textY: n, maxLines: n, typeSpeed: n )
{
    global.dialogBoxSprite = argument0;
    global.dialogBoxCaptionX = argument1;
    global.dialogBoxCaptionY = argument2;
    global.dialogBoxPortraitX = argument3;
    global.dialogBoxPortraitY = argument4;
    global.dialogBoxTextX = argument5;
    global.dialogBoxTextY = argument6;
    global.dialogBoxMaxLines = argument7;
    global.dialogBoxDefaultSpeed = argument8;
    
    global.dialogBoxDisplayLines = ds_list_create();
    ds_list_add( global.dialogBoxDisplayLines, '' );
    global.dialogBoxPendingLines = ds_queue_create();
    
    global.dialogBoxHasCurrentLine = false;
    global.dialogBoxCurrentLine = '';
    global.dialogBoxCharIndex = 0;
    global.dialogBoxDelayLeft = 0;
    global.dialogBoxCurrentSpeed = global.dialogBoxDefaultSpeed;
    global.dialogBoxCurrentCaption = '';
    global.dialogBoxCurrentCaptionColor = c_white;
    global.dialogBoxCurrentPortrait = -1;
    global.dialogBoxCurrentPortraitImage = -1;
}
