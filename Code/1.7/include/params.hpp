class Params
{
    class Param_Loadparams
    {
            title = "Parameter Load & Save (save parameters between sessions)";
            values[] = {0, 1, 2};
            texts[] = {"Use settings below and save (settings will be restored on mission restart)", "Load previously saved settings (Use below if none found)", "Use settings below without saving"};
            default = 1;
	};
	class Param_Spacer1
    {
            title = "==================== Difficulty Settings ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
    class Param_EnemySkill
	{
            title = "Enemy Skill";
            values[] = {0, 1, 2, 3, 4};
            texts[] = {"Cadet", "Easy", "Normal", "Hard", "Extreme"};
            default = 1;
	};
	class Param_EnemyFrequency
	{
		title="Enemy Groupsize";
		values[]={1,2,3};
		texts[]={"Few (suitable for 1-3 players)", "Some (suitable for 4-6 players)", "A lot (suitable for 7-8 players)"};
		default = 1;
	};
	class Param_EnemySpawnDistance
	{
		title="Enemy Spawn Distance";
		values[]={800,1050,1300};
		texts[]={"Short (better performance)", "Medium", "Far (for good rigs)"};
		default = 1300;
	};
	class Param_VillageSpawnCount
	{
		title="Village Patrol Spawns";
		values[]={80000, 40000, 10000};
		texts[]={"Low (better performance)", "Medium", "High (Very demanding)"};
		default = 40000;
	};
	class Param_SearchChopper
	{
		title="Search Chopper Type";
		values[]={0,1,2};
		texts[]={"Standard","Easy","Hard"};
		default = 0;
	};
	class Param_Spacer2
    {
            title = "==================== Environment Settings ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
	class Param_TimeOfDay	
	{	
	    title="Time Of Day";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
		texts[]={"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","Random"};
		default = 24;
		//function = "A3E_fnc_paramDaytime"; // (Optional) Function called when player joins, selected value is passed as an argument
	};
	class Param_TimeMultiplier	
	{	
	    title="Time Multiplier (Fasttime)";
		values[]={1,6,12,24,36};
		texts[]={"1:1 (Normal)","1:6 (Day = 4 Hours)","1:12 (Day = 2 Hours)","1:24 (Day = 1 Hour)","1:36 (Day = 40 Minutes)"};
		default = 1;
	};
	class Param_Weather {
		title="Weather";
		values[] = {0,1,2,3,4,-1};
		texts[] = {"Clear","Overcast","Rain","Fog","Storm","Random"};
		default = -1;
	};
	class Param_DynamicWeather {
		title="Dynamic Weather";
		values[] = {0,1};
		texts[] = {"Constant","Random"};
		default = 1;
	};
	class Param_Grass
	{	
		title="Grass Visibility";
		values[]={50,25,12,6,2};
		texts[]={"No Grass", "Proximity", "Normal", "Far", "Very Far"};
		default = 12;
	};
	class Param_Spacer3
    {
            title = "==================== Gameplay Settings ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
	class Param_RevealMarkers
	{
		title="Display of markers on map";
		values[]={0,1,2,3};
		texts[]={"Always show (with type)","Always show marker but hide type (questionmark)","Show marker upon discovery","Never show markers"};
		default = 1;
	};
	class Param_Artillery
	{
		title="Artillery";
		values[]={0.5,1,2};
		texts[]={"Reduced","Default","Death in fire"};
		default = 1;
	};
	class Param_War_Torn
	{
		title="War-Torn mode (CSAT and AAF are fighting each other)";
		values[]={0,1};
		texts[]={"Disabled","Enabled"};
		default = 0;
	};
	class Param_ReviveView
	{
		title="Unconscious View";
		values[]={0,1};
		texts[]={"First-/Third-Person","Hindsight Cam"};
		default = 1;
	};
	class Param_ExtractionSelection
	{
		title="Extraction Points";
		values[]={0, 1, 2};
		texts[]={"Random", "Close", "Far"};
		default = 0;
	};
	class Param_Waffelbox
	{
		title="Additional Weaponbox (with less random content) at depots";
		values[]={0,1};
		texts[]={"Off", "On"};
		default = 0;
	};
	class Param_NoNightvision
	{
		title="NVG-Goggles and TWS Scopes";
		values[]={0,1};
		texts[]={"All", "No Goggles and TWS"};
		default = 0;
	};
	class Param_Spacer4
    {
            title = "==================== Debug Settings ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
	class Param_Debug
	{
		title="Debug";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 0;
	};
};