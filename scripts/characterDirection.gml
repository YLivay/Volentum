///characterDirection( moveDir, character? )
{
    var workingChar;
    if ( argument_count == 1 ) {
        workingChar = character;
    }
    else {
        workingChar = argument[1];
    }
    
    if ( argument[0] == 1 ) {
        return objFormation.angle + workingChar * 120;
    }
    else {
        return objFormation.angle + workingChar * 120 + 180;
    }
}
