///portraitInit()
{
    enum Expressions {
        NORMAL,
        HAPPY,
        SAD,
        ANGRY,
        SURPRISED,
    }
    
    global.portraits = ds_map_create();
    var alfPortraits = ds_map_create();
    alfPortraits[? 'sprite'] = sprAlfPortraits;
    alfPortraits[? Expressions.NORMAL] = 0;
    alfPortraits[? Expressions.HAPPY] = 1;
    alfPortraits[? Expressions.SAD] = 2;
    alfPortraits[? Expressions.ANGRY] = 3;
    alfPortraits[? Expressions.SURPRISED] = 4;
    global.portraits[? Characters.ALF] = alfPortaits;
    
    var miaPortraits = ds_map_create();
    miaPortraits[? 'sprite'] = sprMiaPortraits;
    miaPortraits[? Expressions.NORMAL] = 0;
    miaPortraits[? Expressions.HAPPY] = 1;
    miaPortraits[? Expressions.SAD] = 2;
    miaPortraits[? Expressions.ANGRY] = 3;
    miaPortraits[? Expressions.SURPRISED] = 4;
    global.portraits[? Characters.MIA] = miaPortaits;
    
    var freyPortraits = ds_map_create();
    freyPortraits[? 'sprite'] = sprFreyPortraits;
    freyPortraits[? Expressions.NORMAL] = 0;
    freyPortraits[? Expressions.HAPPY] = 1;
    freyPortraits[? Expressions.SAD] = 2;
    freyPortraits[? Expressions.ANGRY] = 3;
    freyPortraits[? Expressions.SURPRISED] = 4;
    global.portraits[? Characters.FREY] = freyPortaits;
    
    var brianPortraits = ds_map_create();
    brianPortraits[? 'sprite'] = sprBrianPortraits;
    brianPortraits[? Expressions.NORMAL] = 0;
    brianPortraits[? Expressions.HAPPY] = 1;
    brianPortraits[? Expressions.SAD] = 2;
    brianPortraits[? Expressions.ANGRY] = 3;
    brianPortraits[? Expressions.SURPRISED] = 4;
    global.portraits[? Characters.BRIAN] = brianPortaits;
}
