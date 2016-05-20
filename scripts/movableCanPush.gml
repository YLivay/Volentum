///movableCanPush( movable1: n, movable2: n )
{
    var m1 = argument0, m2 = argument1;

    var pushes = m1.tangible & 0xF;
    var pushableBy = m2.tangible >> 4;
    
   return pushes & pushableBy != 0;
}
