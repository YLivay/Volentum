///enemyAIInit( hp: n, invincibility: n, viewDistance: n, loseViewDistance: n, alertDuration: n, searchDuration: n, injuredSprite: n, onDead: n )
{
    hp = argument0;
    invincibility = argument1;
    viewDistance = argument2;
    loseViewDistance = argument3;
    alertDuration = argument4 * room_speed;
    searchDuration = argument5 * room_speed;
    injuredSprite = argument6;
    onDead = argument7;
    
    spawnX = x;
    spawnY = y;
    destX = x;
    destY = y;
    
    enum AIStates {
        STATELESS,
        IDLE,
        ALERTED,
        ATTACKING,
        SEARCHING,
        STUNNED,
        DYING,
    }
    
    aiState = AIStates.STATELESS;
    aiPrevState = aiState;
    playerInRange = false;
    alert = 0;
    search = 0;
    stun = 0;
    
    moveFrame = 0;
    attackFrame = 0;

    attackDelay = 0;
    currentInvincibility = 0;
    stunSprite = sprite_index;
    stunImageIndex = image_index;
    dyingDelay = 1.5 * room_speed;
    dead = false;
}
