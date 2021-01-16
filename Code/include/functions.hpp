class CfgFunctions
{
  class A3E
  {
    class Common
    {
		class BootstrapEscape {
#ifndef A3E_EDITOR
			preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
			postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
			recompile = 0;
#endif
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
		class systemChat {};
		class groupChat {};
		class addUserActions {};
		class Hijack {};
		class HealAtBuilding {};
		class GetPlayers {};
		class GetRandomPlayer {};
		class GetPlayerGroup {};
		class Briefing {
		//	postInit = 1;
		};
		class InitLocalPlayer {
#ifndef A3E_EDITOR
			postInit = 0;
#endif
		};			
		class cleanupTerrain {};
		class handleRating {};
		class handleScore {};
		class CheckCampDistance {};
		class FireSmokeFX {};
		class OnVehicleSpawn {};
		class initArsenal {};
		class toggleEarplugs {};
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
			class ExtractionBoat {};
			class ExtractionCar {};
			class ExtractionChopper {};
		};
		class Debug
		{
			class unit_debug_marker {};
			class drawMapLine {};
			class TrackGroup {};
            class debugMsg {};
			class rptLog {};
		};
		class Intel
		{
			class AddIntel {};
			class CollectIntel {};
			class RevealPOI {};
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
            class createMotorPools {};
            class createAmmoDepots {};
			class createMortarSites {};
			class createLocationMarker {};
			class UpdateLocationMarker {};
			class createExtractionPoint {};
			class runExtraction {};
			class runExtractionBoat {};
			class runExtractionCar {};
			class runExtractionHeli {};
			class firedNearExtraction {};
			class weather {};
			class FindSpawnRoad {};
			class EndMissionServer {};
			class SelectExtractionZone {};
			class RoadBlocks {};
			class MissionFlow {};
			class createStartpos {};
		};
		class Spawning
		{
			class initPatrolZone {};
			class initVillages {};
			class activatePatrolZone {};
			class deactivatePatrolZone {};
			class onEnemySoldierSpawn {};
			class spawnPatrol {};
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
			class BuildComCenter4 {};
			class BuildComCenter5 {};
            class BuildMotorPool {};
			class AmmoDepot {};
			class AmmoDepot2 {};
			class AmmoDepot3 {};
			class AmmoDepot4 {};
			class AmmoDepot5 {};			
			class CrashSite {};
			class MortarSite {};
			class MortarSite2 {};
			class Roadblock {};
			class Roadblock2 {};
			class Roadblock3 {};
			class Roadblock4 {};	
			class isoTemplateStore {};		
			class isoTemplateRestore {};	
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
#ifndef A3E_EDITOR
			file = "Revive\functions\revive";
			#include "..\Revive\functions\revive\revive.hpp"
#endif
		};
	};
	class ATHSC
	{
		class HSC
		{
#ifndef A3E_EDITOR
			file = "Revive\functions\HSC";
			#include "..\Revive\functions\HSC\hsc.hpp"
#endif
		};
	};
	class ace
	{
		class ace
		{
			class HandleUnconscious {};
			class ATCam {};
			class CaptiveHandle {};
			class GroundHandler {};
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
