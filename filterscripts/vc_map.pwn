/*
	Vice City Map 0.1
	by adri1
*/

#include <a_samp>

/* Textdraw info */
#define map_td_X 0.0
#define map_td_Y 90.0
#define map_td_SIZE_X 110.0
#define map_td_SIZE_Y 150.0

/* Map limits */
#define vc_limit_X_WEST 130.0
#define vc_limit_X_EAST 2970.0
#define vc_limit_Y_NORTH 665.0
#define vc_limit_Y_SOUTH -2735.0

/*
	Vice city offset
	"VC2SA was moved +4000X +2000Y"
*/
#define vc_offset_X 4000.0
#define vc_offset_Y 2000.0

/* Vice city map object model ID */
#define VC_MAP_MODELID	-23000

// Timer (player) interval
#define UPDATE_INTERVAL	100


new
	bool:player_vc_map[MAX_PLAYERS],
	player_vc_map_pos_timer[MAX_PLAYERS],
	Text:td_MAP,
	PlayerText:ptd_ME[MAX_PLAYERS],

	Float:map_width,
	Float:prop_X,
	Float:mv_X,

	Float:map_height,
	Float:prop_Y,
	Float:mv_Y;


public OnFilterScriptInit()
{
	/*
		Vice City map object
		original object: 19166 (gtasamap3)
	*/
	AddSimpleModel(-1, 19166, VC_MAP_MODELID, "vc_map.dff", "vc_map.txd");

	//Map textdraw
	td_MAP = TextDrawCreate(map_td_X, map_td_Y, "");
	TextDrawFont(td_MAP, 5);
	TextDrawTextSize(td_MAP, map_td_SIZE_X, map_td_SIZE_Y);
	TextDrawBackgroundColor(td_MAP, 0);
	TextDrawSetPreviewModel(td_MAP, VC_MAP_MODELID);
	TextDrawSetPreviewRot(td_MAP, 90.0, 180.0, 0.0, 0.60);

	//Calc
	map_width = floatsub(vc_limit_X_EAST, vc_limit_X_WEST);
	prop_X = floatdiv(map_td_SIZE_X, map_width);
	mv_X = floatsub(map_width, vc_limit_X_EAST);

	map_height = floatsub(vc_limit_Y_SOUTH, vc_limit_Y_NORTH);
	prop_Y = floatdiv(map_td_SIZE_Y, map_height);
	mv_Y = floatsub(map_height, vc_limit_Y_SOUTH);
	return 1;
}

public OnFilterScriptExit()
{
	TextDrawDestroy(td_MAP);
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(player_vc_map[i])
			{
				KillTimer(player_vc_map_pos_timer[i]);
				if(ptd_ME[i] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(i, ptd_ME[i]);
					ptd_ME[i] = PlayerText:INVALID_TEXT_DRAW;
				}

				player_vc_map_pos_timer[i] = 0;
				player_vc_map[i] = false;
			}
		}
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!strcmp(cmdtext, "/map", true))
	{
		if(player_vc_map[playerid])
		{
			KillTimer(player_vc_map_pos_timer[playerid]);
			if(ptd_ME[playerid] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawDestroy(playerid, ptd_ME[playerid]);
				ptd_ME[playerid] = PlayerText:INVALID_TEXT_DRAW;
			}

			TextDrawHideForPlayer(playerid, td_MAP);
			player_vc_map_pos_timer[playerid] = 0;
			player_vc_map[playerid] = false;
		}
		else
		{
			player_vc_map[playerid] = true;
			player_vc_map_pos_timer[playerid] = SetTimerEx("updatePlayerMapIcon", UPDATE_INTERVAL, true, "i", playerid);
			TextDrawShowForPlayer(playerid, td_MAP);
		}
		return 1;
	}
	return 0;
}

forward updatePlayerMapIcon(playerid);
public updatePlayerMapIcon(playerid)
{
	new Float:pos[3];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	pos[0] -= vc_offset_X;
	pos[1] -= vc_offset_Y;

	SetPlayerPoint_VC(playerid, "hud:radar_waypoint", 5.0, 5.0, pos[0], pos[1]);
	return 1;
}

SetPlayerPoint_VC(playerid, icon[], Float:icon_size_X, Float:icon_size_Y, Float:x, Float:y)
{
	/* Map limits */
	if(x > vc_limit_X_EAST) x = vc_limit_X_EAST;
	else if(x < vc_limit_X_WEST) x = vc_limit_X_WEST;

	if(y > vc_limit_Y_NORTH) y = vc_limit_Y_NORTH;
	else if(y < vc_limit_Y_SOUTH) y = vc_limit_Y_SOUTH;
	
	/* Conversion */
	x += mv_X;		
	y += mv_Y;

	new
		Float:td_X = map_td_X + floatmul(prop_X, x) - floatdiv(icon_size_X, 2),
		Float:td_Y = map_td_Y + floatmul(prop_Y, y) - floatdiv(icon_size_Y, 2);

	/* Player Textdraw */
	if(ptd_ME[playerid] != PlayerText:INVALID_TEXT_DRAW)
	{
		PlayerTextDrawDestroy(playerid, ptd_ME[playerid]);
		ptd_ME[playerid] = PlayerText:INVALID_TEXT_DRAW;
	}

	ptd_ME[playerid] = CreatePlayerTextDraw(playerid, td_X, td_Y, icon);
	PlayerTextDrawTextSize(playerid, ptd_ME[playerid], icon_size_X, icon_size_Y);
	PlayerTextDrawFont(playerid, ptd_ME[playerid], 4);
	PlayerTextDrawShow(playerid, ptd_ME[playerid]);
	return 1;
}