///wanderStep()
{
    switch ( wanderState ) {
        case WanderStates.IDLE:
            wanderIdleTime -= 1 * global.timescale;
            if ( wanderIdleTime <= 0 ) {
                show_debug_message( 'wandering' );
                if ( wanderHasPivot ) {
                    wanderFindNext( wanderPivotX, wanderPivotY );
                }
                else {
                    wanderFindNext();
                }
                wanderState = WanderStates.WANDER;
            }
            else {
                movableStep( 0, 0 );
            }
            break;
        
        case WanderStates.WANDER:
            wanderGiveUpTime -= 1 * global.timescale;
            if ( point_distance( x, y, wanderDestX, wanderDestY ) <= wanderSpeed || wanderGiveUpTime <= 0 ) {
                wanderIdleTime = irandom( wanderMaxIdleTime );
                wanderState = WanderStates.IDLE;
                show_debug_message( 'Idling' );
            }
            else {
                movableStep( point_direction( x, y, wanderDestX, wanderDestY ), wanderSpeed );
            }
            break;
    }
}
