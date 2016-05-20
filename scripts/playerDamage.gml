///playerDamage()
{
    if ( !objAlf.isBarrierActive && global.invincibility <= 0 ) {
        global.hp -= 1;
        global.invincibility = PLAYER_INVINCIBILITY * room_speed;
    }
}
