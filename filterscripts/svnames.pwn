
//Creditos Sam Jasen Creditos
#include <a_samp>
#define NombreServer1 "hostname Sam Jasen"
#define NombreServer2 "hostname Sam Jasen"
#define NombreServer3 "hostname Sam Jasen"
#define NombreServer4 "hostname Sam Jasen"
new timernombres;

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Sam Jasen [Respeta Creditos por favor] ");
	print("--------------------------------------\n");
	timernombres = SetTimer("RandomNombres",1000,1);
	return 1;
}

public OnFilterScriptExit()
{
	KillTimer(timernombres);
	return 1;
}

forward RandomNombres();
public RandomNombres()
{
    new rsrcm = random(4);
    switch(rsrcm)
    {
	    case 0: SendRconCommand( "[VC-RP] Virtual City RP - Actualizacion V3.0");
	    case 1: SendRconCommand( "[VC-RP] Virtual City RP - Stats de Regalo!");
	    case 2: SendRconCommand( "[VC-RP] Virtual City RP - Juego de Rol!");
	    case 3: SendRconCommand( "[VC-RP] Virtual City RP - GM Unica!");
	}
	return 1;
}
