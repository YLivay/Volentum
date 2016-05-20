///formationInit( rotationSpeed )
{
    rotationSpeed = argument0;
    
    angle = 0;
    
    instance_create( characterX( Characters.ALF ), characterY( Characters.ALF ), objAlf );
    instance_create( characterX( Characters.MIA ), characterY( Characters.MIA ), objMia );
    instance_create( characterX( Characters.FREY ), characterY( Characters.FREY ), objFrey );
}
