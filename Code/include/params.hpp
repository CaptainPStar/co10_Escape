class Params
{
    class Param_Loadparams
    {
            title = "Parameter Load and Save (save params between sessions)";
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
		texts[]={"Few (1-3)", "Some (3-5)", "Large (5-7)"};
		default = 2;
	};
	class Param_EnemySpawnDistance
	{
		title="Enemy Spawn Distance";
		values[]={500,800,1200};
		texts[]={"Short (better performance, spawn in view possible)", "Medium", "Far (for good rigs)"};
		default = 800;
	};
	class Param_VillageSpawnCount
	{
		title="Village Patrol Spawns";
		values[]={1, 2, 3};
		texts[]={"Low (better performance)", "Medium", "High (Very demanding)"};
		default = 1;
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
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26};
		texts[]={"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","Random","Daytime","Nighttime"};
		default = 25;
		//function = "A3E_fnc_paramDaytime"; // (Optional) Function called when player joins, selected value is passed as an argument
	};
	class Param_TimeMultiplier	
	{	
	    title="Time Multiplier (Fasttime)";
		values[]={1,6,12,24,36};
		texts[]={"1:1 (Normal)","1:6 (Day = 4 Hours)","1:12 (Day = 2 Hours)","1:24 (Day = 1 Hour)","1:36 (Day = 40 Minutes)"};
		default = 6;
	};
	class Param_Weather {
		title="Weather";
		values[] = {0,1,2,3,4,-1};
		texts[] = {"Clear","Overcast","Rain","Fog","Storm","Random"};
		default = 0;
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
    class Param_MotorPools
	{
        title="Enable Motor Pools";
        values[]={0,1};
        texts[]={"Disabled - No motor pools","Random - Spawns motor pools, works for all maps"};
        default = 1;
	};
	class Param_VehicleLock
	{
		title="Lock Vehicles";
		values[]={0, 1, 2};
		texts[]={"None", "Armed", "All"};
		default = 0;
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
            title = "==================== Statistic Settings ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
	class Param_SendStatistics
	{
		title="Send statistics at mission end";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	class Param_Spacer5
    {
            title = "==================== DLC Settings ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
	class Param_UseDLCApex
	{
		title="Allow usage of units from Apex DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	class Param_UseDLCHelis
	{
		title="Allow usage of units from Helicopters DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	class Param_UseDLCMarksmen
	{
		title="Allow usage of premium classes from Marksmen DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	/*class Param_UseDLCJets
	{
		title="Allow usage of units from Jets DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};*/
	class Param_UseDLCLaws
	{
		title="Allow usage of units from Laws of War DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	class Param_UseDLCTanks
	{
		title="Allow usage of units from Tanks DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	class Param_UseDLCContact
	{
		title="Allow usage of units from Contact DLC";
		values[]={0,1};
		texts[]={"No", "Yes"};
		default = 1;
	};
	class Param_Spacer6
	{
            title = "==================== 3rd-party scripts ====================";
            values[] = {0};
            texts[] = {""};
            default = 0;
	};
	class Param_Magrepack
	{
		title="Mag repack";
		values[]={0,1};
		texts[]={"Disabled", "Enabled"};
		default = 0;
	};
	class Param_Spacer7
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