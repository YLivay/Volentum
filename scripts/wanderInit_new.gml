///wanderInit( maxIdleTime: n, wanderRange: n )
{
    wanderMaxIdleTime = argument0;
    wanderMaxRange = argument1;
    wanderMaxGiveUpTime = 10 * room_speed;
    
    enum WanderStates {
        IDLE,
        WANDER,
    }
    
    wanderFindNext();
}
