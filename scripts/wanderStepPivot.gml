///wanderStepPivot( pivotX: n, pivotY: n )
{
    switch ( wanderState ) {
        case WanderStates.IDLE:
            wanderIdleTime -= 1;
            if ( wanderIdleTime <= 0 ) {
                wanderFindNext( argument0, argument1 );
                wanderState = WanderStates.WANDER;
            }
            break;
        
        case WanderStates.WANDER:
            wanderGiveUpTime -= 1;
            if ( point_distance( x, y, destX, destY ) <= point_distance( 0, 0, xSpeed, ySpeed ) || wanderGiveUpTime <= 0 ) {
                wanderIdleTime = irandom( wanderMaxIdleTime );
                wanderState = WanderStates.IDLE;
            }
            break;
    }
}
