///movableInit( maxSpeed:n, acceleration:n, deacceleration:n, mass: n, tangible:n, onCollision: n )
{
    maxSpeed = argument0;
    acceleration = argument1;
    deacceleration = argument2;
    mass = argument3;
    tangible = argument4;
    onCollision = argument5;
    
    xSpeed = 0;
    ySpeed = 0;
    destXSpeed = 0;
    destYSpeed = 0;
    destDirection = 0;
    destSpeed = 0;
    
    ds_list_add( global._movables, id );
}
