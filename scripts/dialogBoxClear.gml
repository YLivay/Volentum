///dialogBoxClear()
{
    ds_list_clear( global.dialogBoxDisplayLines );
    ds_list_add( global.dialogBoxDisplayLines, '' );
    ds_queue_clear( global.dialogBoxPendingLines );
    
    global.dialogBoxHasCurrentLine = false;
    global.dialogBoxCurrentLine = '';
    global.dialogBoxCharIndex = 0;
    global.dialogBoxDelayLeft = 0;
    global.dialogBoxCurrentSpeed = global.dialogBoxDefaultSpeed;
}
