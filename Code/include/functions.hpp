class CfgFunctions
{
  class A3E
  {
    class Common
    {
		class BootstrapEscape {
			preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
			postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
			recompile = 0;
		};
		class RandomMarkerPos {};
		class GetSideColor {};
		class RandomSpawnPos {};
		class KeyDown {};
		class RandomPatrolPos {};
		class WriteParamBriefing {};
		class findFlatArea{};
		class findFlatAreaNear{};
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
		class GetRandomPlayer {};
		class GetPlayerGroup {};
		class Briefing {
			//postInit = 1;
		};
		class InitLocalPlayer {
			postInit = 0;
		};
		class cleanupTerrain {};
		class handleRating {};
		class handleScore {};
		class CheckCampDistance {};
		class FireSmokeFX {};

		};
		class AI
		{
			class RandomPatrolRoute {};
			class EngageReportedGroup {};
			class InCombat {};
			class Move {};
			class Search {};
			class SearchDrone {};
			class LeafletDrone {};
			class Patrol {};
			class Flee {};
			class FireArtillery {};
			class CallCAS {};
			class OrderSearch {};
			class SetTaskState {};
			class GetTaskState {};
			class AquaticPatrol {};
			class AddStaticGunner {};
			class ExtractionChopper {};
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
			class initServer {
                    preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                    postInit = 0; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                    recompile = 0; // 1 to recompile the function upon mission start
            };
			class initPlayer {};
			class watchKnownPosition {};
			class parameterInit {}; 
            class createComCenters {};
            class createMotorPool {};
            class createAmmoDepots {};
			class createMortarSites {};
			class createLocationMarker {};
			class createExtractionPoint {};
			class runExtraction {};
			class runExtractionBoat {};
			class firedNearExtraction {};
			class weather {};
			class FindSpawnRoad {};
			class EndMissionServer {};
			class SelectExtractionZone {};
			class RoadBlocks {};
			class MissionFlow {};
		};
		class Templates
		{
            class BuildPrison {};
			class BuildPrison1 {};
			class BuildPrison2 {};
			class BuildPrison3 {};
			class BuildPrison4 {};
			class BuildPrison5 {};
            class BuildComCenter {};
			class BuildComCenter2 {};
			class BuildComCenter3 {};
            class BuildMotorPool {};
            class AmmoDepot {};
			class AmmoDepot2 {};
			class CrashSite {};
			class MortarSite {};
			class MortarSite2 {};
			class Roadblock {};
			class Roadblock2 {};
			class Roadblock3 {};
		};
		class Chronos
		{
			class Chronos_Init {};
			class Chronos_Run {};
			class Chronos_Register {};
			class Chronos_Dispatch {};
		};
		class Statistics
		{
			class LoadStatistics {};
			class WriteStatisticsToBriefing {};
			class SaveStatistics {};
			class ParseStatistics {};
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
			class GarrisonUnits {};
		};
	};
	class ATR
	{
		class Revive
		{
			file = "Revive\functions\revive";
			#include "..\Revive\functions\revive\revive.hpp"
		};
	};
	class ATHSC
	{
		class HSC
		{
			file = "Revive\functions\HSC";
			#include "..\Revive\functions\HSC\hsc.hpp"
		};
	};
	class ace
	{
		class ace
		{
			class HandleDisconnect {};
			class HandleUnconscious {};
			class Countdown {};
		};
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
