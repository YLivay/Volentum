///projectileShoot( projectile, x, y, speed, direction, damage, knockback, friendly )
{
    var inst = instance_create( argument1, argument2, argument0 );
    
    inst.xSpeed = lengthdir_x( argument3, argument4 ) * global.timescale;
    inst.ySpeed = lengthdir_y( argument3, argument4 ) * global.timescale;
    inst.damage = argument5;
    inst.knockback = argument6;
    inst.friendly = argument7;
    
    if ( inst.friendly ) {
        inst.tangible = TANGIBLE_PLAYER_ATTACK;
    }
    else {
        inst.tangible = TANGIBLE_ENEMY_ATTACK;
    }
    
    return inst;
}
