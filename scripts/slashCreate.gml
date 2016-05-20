///slashCreate( slash, x, y, direction, damage, knockback, slasher )
{
    var slash = instance_create( argument1, argument2, argument0 );
    
    slash.image_angle = argument3;
    slash.friendly = argument6 == objFormation.id;
    slash.damage = argument4;
    slash.knockback = argument5;
    slash.xSpeed = lengthdir_x( 1, slash.image_angle ) * global.timescale;
    slash.ySpeed = lengthdir_y( 1, slash.image_angle ) * global.timescale;
    slash.slasher = argument6;
    if ( irandom_range( 0, 1 ) == 1 ) {
        slash.image_yscale *= -1;
    }
    
    if ( slash.friendly ) {
        slash.tangible = TANGIBLE_PLAYER_ATTACK;
    }
    else {
        slash.tangible = TANGIBLE_ENEMY_ATTACK;
    }
    
    return slash;
}
