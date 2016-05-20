///dialogBoxSkip()
{
    while ( global.dialogBoxHasCurrentLine == true || !ds_queue_empty( global.dialogBoxPendingLines ) ) {
        global.dialogBoxDelayLeft = 0;
        dialogBoxStep();
    }
}
