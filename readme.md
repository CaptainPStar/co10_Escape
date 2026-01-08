# Arma 3 Mission: Co10 Escape

This Arma3 mission is the official successor of the original Escape mission from Arma 2, which was the first of its kind. The name is always prefixed with "co10" to differentiate it from the "Escape from XXX" missions that were released with Arma 3 by Bohemia Interactive.

## Overview

In this mission, you and your squad have been captured by enemy forces during a covert operation to gather intelligence on their presence ahead of a planned invasion. You're now being held captive and awaiting interrogation by high ranking enemy officers. However, loyal locals have hidden a stash of weapons in your prison, and it's up to you to retrieve them, overcome your guards, and escape. Once you're out, your objective is to find a map of the area, make contact with friendly forces, and reach the designated evacuation zone.

The mission is fully dynamic, meaning that every playthrough will be different. It's also quite challenging and designed to be played more than once.

## About the Mission

Escape was originally developed by Engima of Östgöta Ops for ArmA2. When ArmA3 was released, Vormulac and HyperZ made the effort to port the mission over to ArmA3. From that point on, Captain P. Star and Scruffy improved and fixed the mission to its current state. 
Most of the scripts have been replaced and updated to A3 standards and many new features and submodules where added.
At this point Escape is mostly rewritten

The last official release was 1.10.



## Available Versions

The mission is available with the following mod configurations:

- Vanilla
- Vanilla Apex
- CUP
- GM
- SOGPF
- SPE
- RHS (outdated)

The mission is available on the following terrains (with the mods above when applicable):

- Altis
- Stratis
- Tanoa
- Malden 2035
- Bornholm
- Chernarus
- Chernarus (Summer)
- Podagorsk
- Panthera
- Panthera (Winter)
- Isla Duala
- Lingor
- Dingor
- Abramia
- Sahrani
- United Sahrani
- Celle
- Takistan
- Porto
- Thirsk
- Thirsk (Winter)
- Capraia
- Clafghan
- Al Rayak
- Lythium
- Fallujah
- Esseker
- Australia
- Everon (CUP)
- Malden (CUP)
- Kolgujev (CUP)
- Nogova (CUP)
- Beketov
- Isles of Cumbrae
- Schwemlitz
- Diyala
- Kastellorizo
- Valtatie 5
- and more...

## Installation

**Warning:** This repository is bleeding edge development. While it is most up-to-date with new features, there may be bugs or some versions may even be unplayable.

You can find the newest packed version ready for use on your server mpmissions-folder here: http://co10esc.anzp.de/


To pack and install the mission on your own, follow these steps:

1. Clone the repository with `git clone <repo_url>`
2. Run `git submodule update --init --recursive` in the repository folder to fetch the revive submodule
3. Navigate to subfolder "Editing_and_Porting\Tools\Compiler" of the repository.
4. Start "EscapeCompiler.exe"
5. Select the repository folder (the folder with "Editing_and_Porting", "Code", "Configs",... folders in it).
6. Select the output folder.
7. Wait until all mission pbos are extracted to that folder (takes a few seconds as there are above 1000 individual missions in escape).
8. After completion the build folder will open. Copy all relevant missions to your local or server's mpmissions folder.

**Note:** Make sure that the server and all clients have the corresponding mods and terrains installed in order to play the mission.


For the old compilation method you may run `compile.py` from the main folder but this fole is depreciated

## Credits

- Original Mission (Arma2) by Engima of Östgöta Ops.
- Mission ported to Arma3 by Vormulac and HyperZ.
- Continued development, rewrite of codebase and new features by Captain P. Star and Scruffy.
- (most) Island ports and unit configs by Scruffy.
- Mission-compiler by Captain P. Star
- Additional scripting and fixing by abelian, dystopian1, FrozenLiquidity, Cyprus, DPM.
- Magrepack by outlawed.
- Additional ports and configs by SurvivorOfZeds (IFA3+LEN), Nils5940 (IFA3), CRCError1970 (Malden and Kolgujev), and supercereal4 (Malden 2035).
- Testing: Maikeks, Darcy, Memphis Belle, Aurelia, Freshman, Roy, and many more.

## License

This mission is released under the [APL-SA license](https://www.bohemia.net/community/licenses/arma-public-license-share-alike) with the addition to release forks of this mission clearly marked as such.
For this it is sufficient to rename your mission by adding your tag or server and changing the version string in define.hpp.

## Feedback

Please post bugs and feedback in our Gitlab at the [Github bugtracker](https://github.com/CaptainPStar/co10_Escape/issues)<br>
You can join us at our Discord server at https://discord.gg/0kV3JvVEhmnMfmq1
