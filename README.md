# DroidKit
Interface with the littleBits Droid Inventor Kit using Swift.
```swift
import DroidKit

let droid = Droid()

droid.onConnect {
    droid.move(.forward, atSpeed: 0.5)
    droid.wait(for: .seconds(2))
    droid.turnWheel(.left, by: 30°)
    droid.wait(for: .seconds(2))
    droid.stop()
}
```

## Installation
### Swift Package Manager
In Xcode, go to `File` → `Add Packages…` and paste in `https://github.com/tinkertanker/DroidKit.git` as the package URL.

### Swift Playgrounds
Unfortunately, the current version of Playgrounds does not support Swift Package Manager, therefore, this will be a little annoying.
1. Clone this Repository
2. Create a new Playground and open it in Finder
3. `Control-Click` or `Right-Click` and `Show Package Contents`
4. Open up Contents/UserModules
5. Create a folder called `DroidKit.playgroundmodule`
6. Within `DroidKit.playgroundmodule`, create a folder named `Sources`
7. Move the `.swift` files from this package into the `Sources` folder individually. Unfortunately you cannot nest folders within a Playground Module.

## Important
### Adding to a Project
Remember to add the `NSBluetoothAlwaysUsageDescription` key to the `Info.plist`.
> In English, it's "Privacy - Bluetooth Always Usage Description"

### Playgrounds
- Make sure to enable indefinite execution otherwise it will not work.
  ```swift
  PlaygroundPage.current.needsIndefiniteExecution = true
  ```
- There seems to be issues connecting with the Droid when running on Swift Playgrounds for macOS. It's best to use Swift Playgrounds on iPad.

### General
- Calling `Droid()` will start searching for a Droid to connect to.
