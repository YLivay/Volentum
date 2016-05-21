///dialogBoxWrite( msg: s )
{
    ds_queue_enqueue( global.dialogBoxPendingLines, argument0 );
    global.dialogBoxHidden = false;
    with ( objCinematics ) {
        timeline_running = false;
    }
}
