///wanderInit( maxIdleTime: n, wanderRange: n, maxSpeed: n, pivotX?: n, pivotY?: n )
{
    wanderMaxIdleTime = argument[0] * room_speed;
    wanderMaxRange = argument[1];
    wanderSpeed = argument[2];
    wanderHasPivot = argument_count == 5;
    if ( wanderHasPivot ) {
        wanderPivotX = argument[3];
        wanderPivotY = argument[4];
    }
    wanderMaxGiveUpTime = 10 * room_speed;
    
    enum WanderStates {
        IDLE,
        WANDER,
    }
    wanderState = WanderStates.IDLE;
    wanderIdleTime = irandom( wanderMaxIdleTime );
}
