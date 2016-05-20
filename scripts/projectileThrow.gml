///projectileThrow( projectile, x, y, destX, destY, speed, jumpHeight, damage, knockback, friendly )
{
    var inst = instance_create( argument1, argument2, argument0 );
    
    with ( inst ) {
        jumpInit( argument3, argument4, argument5, argument6 );
    }
    
    inst.damage = argument7;
    inst.knockback = argument8;
    inst.friendly = argument9;
    
    if ( inst.friendly ) {
        inst.tangible = TANGIBLE_PLAYER_ATTACK;
    }
    else {
        inst.tangible = TANGIBLE_ENEMY_ATTACK;
    }
    
    return inst;
}
