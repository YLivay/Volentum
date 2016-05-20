///levelReset
{
    global.timescale = 1;
    var checkpoint = global.checkpoints[| global.currentLevel];
    if ( instance_exists( objFormation ) ) {
        objFormation.x = checkpoint.x;
        objFormation.y = checkpoint.y;
    }
    global.hp = PLAYER_HP;
    global.invincibility = 0;
    global.levelSpawned = false;
}
