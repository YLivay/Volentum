///characterX( character? )
{
    var workingChar;
    if ( argument_count == 0 ) {
        workingChar = character;
    }
    else {
        workingChar = argument[0];
    }
    
    return objFormation.x + lengthdir_x( FORMATION_RADIUS, characterDirection( 1, workingChar ) );
}
