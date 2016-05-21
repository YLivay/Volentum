///enemyAIDamage
{
    if ( currentInvincibility <= 0 ) {
        hp = 0;
        if ( hp <= 0 ) {
            aiState = AIStates.DYING;
        }
        else {
            currentInvincibility = invincibility * room_speed;
        }
    }
}
