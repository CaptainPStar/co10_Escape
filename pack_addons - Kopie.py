import json
import os
import shutil
import subprocess
with open('config.json') as json_data_file:
    data = json.load(json_data_file)
mods = data['Mods'];
islands = data['Islands'];
missions = data['Missions'];
cpbo = data['cpbo'];
addons = data['Addons'];
t = []
for m in missions:
    t.append(m['name'])
addonFolders = list(set(t))
#os.unlink(data['BuildDir'] + '/addons/');

for s in addonFolders:
    print (s)
    listOfMissions = []
    missionNumber = 0
    missionMod = [] #should be the same across all missions in a folder
    for mission in missions:
        if s == mission['name']:
            for mod in mods:
                if mod['name'] == mission['mod']:
                    missionMod = mod
            missionIsland = None
            for island in islands:
                if island['name'] == mission['island']:
                    missionIsland = island
            missiondir = mission['name']+'.'+ missionIsland['class']
            addonMissionFolder = mission['name']+'\\'+mission['name']+str(missionNumber)+'.'+ missionIsland['class'] 
            shutil.copytree(data['BuildDir'] + '/' + missiondir,data['BuildDir'] + '/addons/' +mission['name']+'/'+mission['name']+str(missionNumber)+'.'+ missionIsland['class'])
            listOfMissions.append([mission['name']+str(missionNumber),addonMissionFolder,data['replace']['MISSION_FULL']+" "+missionMod['replace']['MOD'] + " " + data['replace']['VERSION']])
            missionNumber=missionNumber+1
            print ("Copying " + missiondir+" to addonfolder "+addonMissionFolder + " ("+data['replace']['MISSION_FULL']+" "+missionMod['replace']['MOD'] + " " + data['replace']['VERSION']+")")
    cfgFile = open(data['BuildDir'] + '/addons/' +s+'/config.cpp', 'w')
    toFile = "class CfgPatches\n{\n\tclass "+s+"\n\t{\n\t\tname = \""+data['replace']['MISSION_FULL']+" "+missionMod['replace']['MOD']+ " " + data['replace']['VERSION']+"\";\n\t\tauthor = \"NeoArmageddon and Scruffy\";\n\t\turl = \"https://forums.bistudio.com/forums/topic/180080-co10-escape\";\n\t\tunits[] = {};\n\t\tweapons[] = {};\n\t\trequiredVersion = 1.0;\n\t\trequiredAddons[] = {};\n\t};\n};\nclass CfgMissions\n{\n\tclass MPMissions\n\t{\n"""
    for m in listOfMissions:
        toFile += "\t\tclass "+m[0]+"\n\t\t{\n"
        toFile += "\t\t\tbriefingName = \""+m[2]+"\";\n"
        toFile += "\t\t\tdirectory = \""+m[1]+"\";\n"
        toFile += "\t\t};\n"
    toFile += "\t};\n};"
    cfgFile.write(toFile)
    cfgFile.close()
    subprocess.call(["cpbo.exe", "-p", data['BuildDir'] + '/addons/' + s]) #Pack folder to pbo
    for addon in addons:
        addons
    os.makedirs('Addons/' + s) #Create target folder
    shutil.move(data['BuildDir'] + '/addons/' + s + '.pbo', './Addons/' + s + '/' + s + '.pbo') #Move build artifact