#!/bin/bash

# Build DocC and dump it in a temporary build directory
xcodebuild docbuild -scheme DroidKit -derivedDataPath tmp/ -destination 'platform=iOS Simulator,name=iPhone 12'

# Building complete
echo "๐  build completed"

# Remove the old DocC from web
rm -rf Web/public/

# Move the doccarchive to the Web folder, rename it to public
mv tmp/Build/Products/Debug-iphonesimulator/DroidKit.doccarchive Web/public/

# Building complete
echo "๐ธ updated Web"

# Start clean up
echo "๐งผ cleaning up"

# Delete temporary build directory
rm -rf tmp

# We're done!
echo "๐ด we're done! time to go back to sleep"

