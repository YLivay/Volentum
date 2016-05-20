///dialogBoxWrite( msg: s )
{
    ds_queue_enqueue( global.dialogBoxPendingLines, argument0 );
}
