/*
Textdraw Creado Por: Axelander.CA
Ultima Modificación: 18/08/2018
Facebook: Facebook.com/Axel Mkanna
Respetar Creditos Por favor no seas govir
*/
//==============================================================================
#include <a_samp>
//==============================================================================
new Text:BZR0;
new Text:BZR1;
new Text:BZR2;
new Text:BZR3;
new Text:BZR4;
new Text:BZR5;
new Text:BZR6;
//==============================================================================
public OnGameModeInit()
{
BZR0 = TextDrawCreate(711.000000, 344.000000, "_");
TextDrawBackgroundColor(BZR0, 255);
TextDrawFont(BZR0, 1);
TextDrawLetterSize(BZR0, 0.500000, 11.200000);
TextDrawColor(BZR0, -1);
TextDrawSetOutline(BZR0, 0);
TextDrawSetProportional(BZR0, 1);
TextDrawSetShadow(BZR0, 1);
TextDrawUseBox(BZR0, 1);
TextDrawBoxColor(BZR0, 50);
TextDrawTextSize(BZR0, 0.000000, 0.000000);

BZR1 = TextDrawCreate(711.000000, 344.000000, "_");
TextDrawBackgroundColor(BZR1, 255);
TextDrawFont(BZR1, 1);
TextDrawLetterSize(BZR1, 0.500000, -0.399999);
TextDrawColor(BZR1, -1);
TextDrawSetOutline(BZR1, 0);
TextDrawSetProportional(BZR1, 1);
TextDrawSetShadow(BZR1, 1);
TextDrawUseBox(BZR1, 1);
TextDrawBoxColor(BZR1, 65535);
TextDrawTextSize(BZR1, 0.000000, 0.000000);

BZR2 = TextDrawCreate(711.000000, 4.000000, "_");
TextDrawBackgroundColor(BZR2, 255);
TextDrawFont(BZR2, 1);
TextDrawLetterSize(BZR2, 0.500000, 11.200000);
TextDrawColor(BZR2, -1);
TextDrawSetOutline(BZR2, 0);
TextDrawSetProportional(BZR2, 1);
TextDrawSetShadow(BZR2, 1);
TextDrawUseBox(BZR2, 1);
TextDrawBoxColor(BZR2, 50);
TextDrawTextSize(BZR2, 0.000000, 0.000000);

BZR3 = TextDrawCreate(711.000000, 110.000000, "_");
TextDrawBackgroundColor(BZR3, 255);
TextDrawFont(BZR3, 1);
TextDrawLetterSize(BZR3, 0.500000, -0.399999);
TextDrawColor(BZR3, -1);
TextDrawSetOutline(BZR3, 0);
TextDrawSetProportional(BZR3, 1);
TextDrawSetShadow(BZR3, 1);
TextDrawUseBox(BZR3, 1);
TextDrawBoxColor(BZR3, 65535);
TextDrawTextSize(BZR3, 0.000000, 0.000000);

BZR4 = TextDrawCreate(232.000000, 13.000000, "Virtual~w~City");
TextDrawBackgroundColor(BZR4, 255);
TextDrawFont(BZR4, 2);
TextDrawLetterSize(BZR4, 0.810000, 4.099999);
TextDrawColor(BZR4, 65535);
TextDrawSetOutline(BZR4, 0);
TextDrawSetProportional(BZR4, 1);
TextDrawSetShadow(BZR4, 1);

BZR5 = TextDrawCreate(252.000000, 53.000000, "Role~W~Play");
TextDrawBackgroundColor(BZR5, 255);
TextDrawFont(BZR5, 2);
TextDrawLetterSize(BZR5, 0.700000, 2.299999);
TextDrawColor(BZR5, 65535);
TextDrawSetOutline(BZR5, 0);
TextDrawSetProportional(BZR5, 1);
TextDrawSetShadow(BZR5, 1);

}
//==============================================================================
public OnPlayerRequestClass(playerid, classid)
{
TextDrawShowForPlayer(playerid, BZR0);
TextDrawShowForPlayer(playerid, BZR1);
TextDrawShowForPlayer(playerid, BZR2);
TextDrawShowForPlayer(playerid, BZR3);
TextDrawShowForPlayer(playerid, BZR4);
TextDrawShowForPlayer(playerid, BZR5);
TextDrawShowForPlayer(playerid, BZR6);
return 1;
}
//==============================================================================
public OnPlayerSpawn(playerid)
{
TextDrawHideForPlayer(playerid, BZR0);
TextDrawHideForPlayer(playerid, BZR1);
TextDrawHideForPlayer(playerid, BZR2);
TextDrawHideForPlayer(playerid, BZR3);
TextDrawHideForPlayer(playerid, BZR4);
TextDrawHideForPlayer(playerid, BZR5);
TextDrawHideForPlayer(playerid, BZR6);
return 1;
}
//==============================================================================
