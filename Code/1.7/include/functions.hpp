class CfgFunctions
{
	class A3E
	{
		class Common
		{
			class RandomMarkerPos {};
			class GetSideColor {};
			class RandomSpawnPos {};
			class KeyDown {};
			class RandomPatrolPos {};
			class WriteParamBriefing {};
            class findFlatArea{};
			class RotatePosition{};
			class GetEnemyCount{};
			class paramWeather{};
			class paramDaytime{};
			class systemChat {};
			class groupChat {};
			class addUserActions {};
			class Hijack {};
			class HealAtBuilding {};
			class GetPlayers {};
			class GetPlayerGroup {};
			class Briefing {};
		};
		class AI
		{
			class RandomPatrolRoute {};
			class EngageReportedGroup {};
			class InCombat {};
			class Move {};
			class Search {};
			class SearchDrone {};
			class Patrol {};
			class Flee {};
			class FireArtillery {};
			class OrderSearch {};
			class SetTaskState {};
			class GetTaskState {};
			class AquaticPatrol {};
			class AddStaticGunner {};
		};
		class Debug
		{
			class unit_debug_marker {};
			class drawMapLine {};
			class TrackGroup {};
            class debugMsg {};
			class rptLog {};
			class systemChat {};
		};
		class Server
		{
			class watchKnownPosition {};
			class initServer {
                    preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                    postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                    recompile = 0; // 1 to recompile the function upon mission start
            };
			class parameterInit {}; 
            class createComCenters {};
            class createAmmoDepots {};
			class createMortarSites {};
			class createLocationMarker {};
			class createExtractionPoint {};
			class runExtraction {};
		};
		class Templates
		{
            class BuildPrison {};
            class BuildComCenter {};
            class AmmoDepot {};
			class CrashSite {};
			class MortarSite {};
		};
		class Chronos
		{
			class Chronos_Init {};
			class Chronos_Run {};
			class Chronos_Register {};
			class Chronos_Dispatch {};
		};
	};
	class drn
	{
		class DRN
		{
			class AmbientInfantry {}; 
			class MoveInfantryGroup {}; 
			class MonitorEmptyGroups {};
			class PopulateLocation {};
			class DepopulateLocation {};
			class InitGuardedLocations {};
			class DynamicWeatherEffects {};
			class InsertionTruck {};
			class MilitaryTraffic {};
			class MoveVehicle {};
			class MotorizedSearchGroup {};
			class RoadBlocks {};	
			class SearchChopper {};
			class SearchGroup {};
			class InitVillageMarkers{};
			class PopulateVillage {};
			class DepopulateVillage {};
			class InitVillagePatrols {};
			class InitAquaticPatrols {};
			class PopulateAquaticPatrol {};
			class DepopulateAquaticPatrol {};
			class InitAquaticPatrolMarkers {};
		};
	};
	class AT
	{
	};
	
	class MB
	{
		class Weather
		{
			class randomWeather2 {
				file  = "functions\Weather\randomWeather2.sqf";
			};
		};
	};
};