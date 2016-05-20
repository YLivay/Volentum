///dialogBoxStep()
{
    if ( !global.dialogBoxHasCurrentLine && !ds_queue_empty( global.dialogBoxPendingLines ) ) {
        global.dialogBoxHasCurrentLine = true;
        global.dialogBoxCurrentLine = ds_queue_dequeue( global.dialogBoxPendingLines );
        global.dialogBoxCharIndex = 0;
        global.dialogBoxDelayLeft = 0;
        global.dialogBoxCurrentSpeed = global.dialogBoxDefaultSpeed;
    }
    
    global.dialogBoxDelayLeft -= global.dialogBoxCurrentSpeed;
    if ( global.dialogBoxHasCurrentLine ) {
        while ( global.dialogBoxDelayLeft <= 0 ) {
            if ( ds_list_size( global.dialogBoxDisplayLines ) > global.dialogBoxMaxLines ) {
                ds_list_delete( global.dialogBoxDisplayLines, 0 );
            }
            
            if ( global.dialogBoxCharIndex < string_length( global.dialogBoxCurrentLine ) ) {
                global.dialogBoxCharIndex += 1;
                var char = string_char_at( global.dialogBoxCurrentLine, global.dialogBoxCharIndex );
                while ( char == DIALOG_BOX_CHAR ) {
                    global.dialogBoxCharIndex += 1;
                    var operation = string_char_at( global.dialogBoxCurrentLine, global.dialogBoxCharIndex );
                    
                    global.dialogBoxCharIndex += 1;
                    var duration = '';
                    while ( string_pos( string_char_at( global.dialogBoxCurrentLine, global.dialogBoxCharIndex ), '0123456789.') != 0 ) {
                        char = string_char_at( global.dialogBoxCurrentLine, global.dialogBoxCharIndex );
                        if ( char == '.' && string_pos( '.', duration ) != 0 ) {
                            break;
                        }
                        duration += string_char_at( global.dialogBoxCurrentLine, global.dialogBoxCharIndex );
                        global.dialogBoxCharIndex += 1;
                    }
                    duration = real( duration );
                    
                    if ( operation == 'w' ) {
                        global.dialogBoxCharIndex -= 1;
                        global.dialogBoxDelayLeft = duration * global.dialogBoxCurrentSpeed;
                        exit;
                    }
                    else if ( operation == 's' ) {
                        global.dialogBoxCurrentSpeed = duration;
                    }
                    char = string_char_at( global.dialogBoxCurrentLine, global.dialogBoxCharIndex );
                }
                
                if ( char != DIALOG_BOX_CHAR ) {
                    var line = ds_list_find_value( global.dialogBoxDisplayLines, ds_list_size( global.dialogBoxDisplayLines ) - 1 );
                    ds_list_replace( global.dialogBoxDisplayLines, ds_list_size( global.dialogBoxDisplayLines ) - 1, line + char );
                }
            }
            else {
                ds_list_add( global.dialogBoxDisplayLines, '' );
                
                if ( ds_queue_empty( global.dialogBoxPendingLines ) ) {
                    global.dialogBoxHasCurrentLine = false;
                    global.dialogBoxCurrentLine = "";
                    event_user(0);
                }
                else {
                    global.dialogBoxCurrentLine = ds_queue_dequeue( global.dialogBoxPendingLines );
                }
                global.dialogBoxCharIndex = 0;
                global.dialogBoxDelayLeft = 0;
                global.dialogBoxCurrentSpeed = global.dialogBoxDefaultSpeed;
            }
            global.dialogBoxDelayLeft += 1;
        }
    }
    else {
        global.dialogBoxDelayLeft = 0;
    }
}
