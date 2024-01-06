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
			class CallRandomFunction {};
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
			class initArsenal {};
			class toggleEarplugs {};
			class initVillageMarkers {};
			class loadLocalClasses {};
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
			class MilitaryTrafficPatrol {};
			class Guard {};
			class GuardBuilding {};
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
			class SpawnGarisson {};
			class onEnemyDetected {};
			class PatrolBuildings {};
			class MoveInBuilding {};
			class CivilianCommuter {};
			class Stroll {};
			class Occupy {};
			class resumeTask {};
			class SeekShelter {};
			//class SearchBuilding {};
		};
		class Garrison
		{
			class GetBuildingPositions {};
			class GetBuildingPositionsInMarker {};
			class GetRndBuilding {};
			class GetRndBuildingPosition {};
			class GetRndBuildingWithPositions {};

		};
		class Debug
		{
			//class unit_debug_marker {};
			class drawMapLine {};
			class TrackGroup {};
			class TrackGroup_Add {};
			class TrackGroup_Update {};
            class DebugMsg {};
			class rptLog {};
			class Log {};
			class logMessage {};
			class startDebugView {};
			class getDebugMessages {};
		};
		class Intel
		{
			class AddIntel {};
			class CollectIntel {};
			class RevealPOI {};
		};
		class Helper
		{
			class GetRandomCirclePosition {};
			class NearestObjectDis {};
			class GetCircularSpawnPos {};
			class RandomMarkerPos {};
			class calcMarkerArea {};
			class getBuildingsInMarker {};
			class getSideColor {};
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
			class createCrashSites {};
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
			class initTraps {};
			class updateTraps {};
		};
		class Spawning
		{
			//class initPatrolZone {};
			class initVillages {};
			//class activatePatrolZone {};
			//class deactivatePatrolZone {};
			class onEnemySoldierSpawn {};
			class onCivilianSpawn {};
			class spawnPatrol {};
			class spawnMilitaryVehicle {};
			class spawnCivilianVehicle {};
			class spawnCivilianStroller {};
			class getDynamicSquadsize {};
			class findSpawnPosBuilding {};
			class populateVillageZone {};
			class populateLocationZone {};
			class AmbientPatrols {};
			class MilitaryTraffic {};
			class CivilianCommuters {};
			class onEnemyGroupSpawn {};
			class onCivilianGroupSpawn {};
			class OnVehicleSpawn {};
		};
		class Zones
		{
			class InitZone {};
			class InitLocationZone {};
			class ActivateZone {};
			class DeactivateZone {};
			class SerializeZoneGroups {};
			class DeserializeZoneGroups {};

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
			class BuildComCenter_VN_US1 {};
			class BuildComCenter_VN_US2 {};
			class BuildComCenter_VN_NVA1 {};
			class BuildComCenter_VN_NVA2 {};
			class BuildComCenter_spe1 {};
			class BuildComCenter_spe_ger1 {};
            class BuildMotorPool {};
			class BuildMotorPool_VN {};
			class BuildMotorPool_SPE {};
			class AmmoDepot {};
			class AmmoDepot2 {};
			class AmmoDepot3 {};
			class AmmoDepot4 {};
			class AmmoDepot5 {};
			class AmmoDepot_VN_US1 {};
			class AmmoDepot_VN_NVA1 {};
			class AmmoDepot_spe1 {};
			class AmmoDepot_spe2 {};
			class AmmoDepot_spe3 {};
			class CrashSite {};
			class MortarSite {};
			class MortarSite2 {};
			class MortarSite_VN_US1 {};
			class MortarSite_VN_NVA1 {};
			class MortarSite_spe1 {};
			class Roadblock {};
			class Roadblock2 {};
			class Roadblock3 {};
			class Roadblock4 {};
			class Roadblock_VN1 {};
			class Roadblock_VN2 {};
			class isoTemplateStore {};
			class isoTemplateRestore {};
			class LoadTemplates {};
		};
		class Chronos
		{
			class Chronos_Init {
				 postInit = 1;
			};
			class Chronos_Run {};
			class Chronos_Register {};
			class Chronos_Dispatch {};
		};
		class Statistics
		{
			class StartStatistics {};
			class LoadStatistics {};
			class WriteStatisticsToBriefing {};
			class SaveStatistics {};
			class ParseStatistics {};
			class PingStatistics {};
			class StartSession {};
			class EndSession {};
		};
		class Searchleader
		{
			class PlayerDetection {};
			class recordSighting {};
			class ReportToHQ {};
			class SearchLeader {};
			class SearchLeaderInit {};
			class SearchLeaderRadio {};
			class CreateKnownPosition {};
			class onPlayerSpotted {};

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
			class InsertionTruck {};
			class MilitaryTraffic {};
			class MoveVehicle {};
			class MotorizedSearchGroup {};
			class SearchChopper {};
			class SearchGroup {};
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
};
