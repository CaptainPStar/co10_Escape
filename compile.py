import json
import os, sys
import shutil
import subprocess
import argparse

# Parse incoming arguments
parser = argparse.ArgumentParser(description = 'Preprocess code against config file')
parser.add_argument('-s', '--smart',
    help='Use smart-update to only copy new files', action='store_true')
parser.add_argument('-p', '--prefix', default="",
    help='Prefix of all output file names')

parser.add_argument('--clean', help='Clean full output directory', action='store_true')

parser.add_argument('--island', help='Only build missions for certain set of island(s)', action='append')
parser.add_argument('--mod', help='Only build missions for certain set of mod(s)', action='append')

parser.add_argument('--pbo', help='Build pbos', action='store_true')

parser.add_argument('-o', help='Override the output directory')

parser.add_argument('--verbose', '-v', help='Output additional log messages', action='store_true')

args = parser.parse_args(sys.argv[1:])

# Loading configuration
with open('config.json') as json_data_file:
    data = json.load(json_data_file)

mods = data['Mods'];
islands = data['Islands'];
missions = data['Missions'];
cpbo = data['cpbo'];
builddir = args.o or data['BuildDir']

if args.clean:
    # Left the default BuildDir to not clobber any output path
    shutil.rmtree(data['BuildDir'])

if not os.path.isdir(builddir):
    os.mkdir(builddir)

# Delete all base-files in the builddir, mainly, the pbo's
# Left data["BuildDir"] to not clobber overriden output path
for the_file in os.listdir(data['BuildDir']):
    file_path = os.path.join(data['BuildDir'], the_file)
    if os.path.isfile(file_path):
        print ("Removing", the_file)
        os.unlink(file_path)

for mission in missions:
    modname =  mission['mod']
    islandname = mission['island']

    # Skip mods if we're only building a subset
    if args.island and not islandname in args.island:
        if args.verbose: print ('Skipping island ', islandname)
        continue
    if args.mod and not modname in args.mod:
        if args.verbose: print ('Skipping mod ', modname)
        continue

    print ('Creating a mission with mod', modname, 'on', islandname)

    # Get mission data
    missionMod = None
    missionIsland = None
    for mod in mods:
        if mod['name'] == modname:
            missionMod = mod
    for island in islands:
        if island['name'] == islandname:
            missionIsland = island
    if missionMod is None:
        raise NameError('Mod was not found')
    if missionIsland is None:
        raise NameError('Island was not found')

    # Get output dir
    if not 'name' in mission:
        mission['name'] = data['Missionname']+'_'+missionMod['name']

    missiondir = builddir + '/' + args.prefix + mission['name']+'.'+ missionIsland['class']

    # Clean up old files
    if not args.smart:
        if os.path.exists(missiondir):
            shutil.rmtree(missiondir)

    def smartCopy(srcdir, dstdir):
        if args.smart:
            # If in smart mode, only copy files that have changed
            for root, dirs, files in os.walk(srcdir):
                for file in files:
                    full_src = os.path.join(root, file)
                    full_dst = os.path.join(dstdir, os.path.relpath(root, srcdir), file)

                    # Only process file if it doesn't exist or is old
                    if not os.path.isfile(full_dst) or int(os.path.getmtime(full_src)) > int(os.path.getmtime(full_dst)):
                        if args.verbose: print "COPY %s TO %s" % (full_src, full_dst)
                        try: os.makedirs(os.path.dirname(full_dst))
                        except: pass
                        shutil.copy2(full_src, full_dst)
                        
        else:
            shutil.copytree(srcdir, dstdir)

    # Copy over code
    smartCopy(data['Code']+'/',missiondir)
    smartCopy(missionIsland['path']+'/',missiondir+'/Island/')
    smartCopy(missionMod['path']+'/',missiondir+'/Units')
    
    # Build require str
    required = ''
    for req in missionMod['require']:
        required = required + '"'+ req + '",'
    
    # Copy sqm
    shutil.copy('./Missions/'+mission['sqm']+'/mission.sqm', missiondir+'/mission.sqm')

    # Create replace dict
    replace = dict(list(data['replace'].items()) + list(missionMod['replace'].items()) + list(missionIsland['replace'].items()));
    replace['REQUIRE'] = required

    # Pre-process code
    for rfile in data['ParsedFiles']:
        if args.verbose: print "Processing file: %s..." % rfile
        full_rfile = os.path.join(missiondir, rfile)
        if not os.path.isfile(full_rfile):
            raise NameError('Unable to find file ' + rfile)

        s = open(full_rfile, 'r').read()

        for key in replace:
            s = s.replace('{* ' + key + ' *}', str(replace[key]))

        with open(full_rfile, 'w') as out:
            out.write(s)

    # Create PBO if requested
    if args.pbo:
        subprocess.call([cpbo, "-p", missiondir])

print "Done."