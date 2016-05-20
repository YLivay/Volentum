///characterY( character? )
{
    var workingChar;
    if ( argument_count == 0 ) {
        workingChar = character;
    }
    else {
        workingChar = argument[0];
    }
    
    return objFormation.y + lengthdir_y( FORMATION_RADIUS, characterDirection( 1, workingChar ) );
}
