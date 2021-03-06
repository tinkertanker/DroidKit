#!/bin/bash

# Build DocC and dump it in a temporary build directory
xcodebuild docbuild -scheme DroidKit -derivedDataPath tmp/ -destination 'platform=iOS Simulator,name=iPhone 12'

# Building complete
echo "🛠 build completed"

# Remove the old DocC from web
rm -rf Web/public/

# Move the doccarchive to the Web folder, rename it to public
mv tmp/Build/Products/Debug-iphonesimulator/DroidKit.doccarchive Web/public/

# Building complete
echo "🕸 updated Web"

# Start clean up
echo "🧼 cleaning up"

# Delete temporary build directory
rm -rf tmp

# We're done!
echo "😴 we're done! time to go back to sleep"

