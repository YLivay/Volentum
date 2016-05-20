///_ds_vector_error( msg: s, abort?: b )
{
    var abort = true;
    if ( argument_count == 2 ) {
        abort = argument[1];
    }
    
    if ( !global.vectors_suppress_errors )
        show_error( argument[0], abort );
}

