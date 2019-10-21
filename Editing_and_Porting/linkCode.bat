:: Copy this .bat file to a new folder in your "Documents\Arma 3 \YourNickname\missions\" folder

@echo off

:: Change this pathes to the correct folders on your drive
set source=C:\Path\To\Git\Repository
set target=C:\Users\YourName\Documents\Arma 3 - Other Profiles\YourNickname\missions\Escape_Dev.Stratis

:: Change this to correct entries from the Configs (in the Git repository Config folder)
set island=Stratis
set mod=Vanilla


:: Don't change anything below this line except you know what you are doing
mklink /J "%target%\functions" "%source%\Code\functions\"
mklink /J "%target%\Revive" "%source%\Code\Revive\"
mklink /J "%target%\include" "%source%\Code\include\"
mklink /J "%target%\Scripts" "%source%\Code\Scripts\"
mklink /J "%target%\Factions" "%source%\Factions\"
mklink  "%target%\briefing.html" "%source%\Code\briefing.html"
mklink  "%target%\config.sqf" "%source%\Code\config.sqf"
mklink  "%target%\description.ext" "%source%\Code\description.ext"
mklink  "%target%\escape_banner.paa" "%source%\Code\escape_banner.paa"
mklink  "%target%\icon_noplayer_ca.paa" "%source%\Code\icon_noplayer_ca.paa"
mklink  "%target%\EscapeLeaflet_USA_co.paa" "%source%\Code\EscapeLeaflet_USA_co.paa"
mklink  "%target%\cba_settings.sqf" "%source%\Code\cba_settings.sqf"

if not exist "%target%\Island" mkdir  "%target%\Island"
mklink  "%target%\Island\CommunicationCenterMarkers.sqf" "%source%\Islands\%island%\CommunicationCenterMarkers.sqf"
mklink  "%target%\Island\PatrolBoatMarkers.sqf" "%source%\Islands\%island%\PatrolBoatMarkers.sqf"
mklink  "%target%\Island\VillageMarkers.sqf" "%source%\Islands\%island%\VillageMarkers.sqf"
mklink  "%target%\Island\WorldConfig.sqf" "%source%\Islands\%island%\WorldConfig.sqf"

if not exist "%target%\Units" mkdir  "%target%\Units"
mklink "%target%\Units\UnitClasses.sqf" "%source%\Mods\%mod%\UnitClasses.sqf"

xcopy "%source%\Editing_and_Porting\RawMission\mission.sqm" "%target%\mission.sqm*"