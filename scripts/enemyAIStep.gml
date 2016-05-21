///enemyAIStep()
{
    playerDistance  = point_distance( x, y, objFormation.x, objFormation.y );
    
    currentInvincibility = max( currentInvincibility - 1 * global.timescale, 0 );
    
    switch ( aiState ) {
        // Hack to skip the first tick to get a reliable previous AI state before actually running any state code.
        case AIStates.STATELESS:
            aiState = AIStates.IDLE;
            break;
        
        case AIStates.IDLE:
            if ( playerDistance < viewDistance ) {
                if ( alertDuration ) {
                    aiState = AIStates.ALERTED;
                    alert = alertDuration;
                }
                else {
                    aiState = AIStates.ATTACKING;
                }
            }
            break;
        
        case AIStates.ALERTED:
            if ( playerDistance > loseViewDistance ) {
                if ( searchDuration ) {
                    aiState = AIStates.SEARCHING;
                    search = searchDuration * room_speed;
                }
                else {
                    aiState = AIStates.IDLE;
                }
            }
            else {
                alert = max( alert - 1 * global.timescale, 0 );
                if ( alert <= 0 ) {
                    aiState = AIStates.ATTACKING;
                }
            }
            break;
        
        
        case AIStates.ATTACKING:
            if ( playerDistance > loseViewDistance ) {
                if ( searchDuration ) {
                    aiState = AIStates.SEARCHING;
                    search = searchDuration;
                }
                else {
                    aiState = AIStates.IDLE;
                }
            }
            break;
        
        case AIStates.SEARCHING:
            if ( playerDistance < loseViewDistance ) {
                if ( alertDuration ) {
                    aiState = AIStates.ALERTED;
                    alert = alertDuration;
                }
                else {
                    aiState = AIStates.ATTACKING;
                }
            }
            else {
                search = max( search - 1 * global.timescale, 0 );
                if ( search <= 0 ) {
                    aiState = AIStates.IDLE;
                }
            }
            break;
        
        case AIStates.STUNNED:
            if ( aiPrevState != aiState ) {
                stunSprite = sprite_index;
                stunImageIndex = image_index;
                audio_play_sound( sndHit, 0, false );
            }
            
            moveFrame = 0;
            attackFrame = 0;
            
            stun = max( stun - 1 * global.timescale, 0 );
            if ( stun <= 0 ) {
                if ( playerDistance < loseViewDistance ) {
                    aiState = AIStates.ATTACKING;
                }
                else {
                    if ( searchDuration ) {
                        aiState = AIStates.SEARCHING;
                        search = searchDuration;
                    }
                    else {
                        aiState = AIStates.IDLE;
                    }
                }
            }
            break;
        
        case AIStates.DYING:
            if ( aiPrevState != aiState ) {
                audio_play_sound( sndKill, 0, false );
            }
        
            tangible = TANGIBLE_INTANGIBLE;
            if ( !dead ) {
                dyingDelay = max( dyingDelay - 1 * global.timescale, 0 );
                if ( dyingDelay <= 0 ) {
                    event_perform( ev_other, onDead );
                    dead = true;
                }
            }
            break;
    }
}
