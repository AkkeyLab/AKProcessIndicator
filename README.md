# ⏳ AKProcessIndicator
[![AKProcessIndicator](https://cocoapod-badges.herokuapp.com/v/AKProcessIndicator/badge.png)](https://cocoapods.org/pods/AKProcessIndicator)
![ios](https://cocoapod-badges.herokuapp.com/p/AKProcessIndicator/badge.png)
![MIT](https://cocoapod-badges.herokuapp.com/l/AKProcessIndicator/badge.png)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.com/AkkeyLab/AKProcessIndicator.svg?branch=master)](https://travis-ci.com/AkkeyLab/AKProcessIndicator)
[![codecov](https://codecov.io/gh/AkkeyLab/AKProcessIndicator/branch/master/graph/badge.svg)](https://codecov.io/gh/AkkeyLab/AKProcessIndicator)

It provides a Network Indicator for device that have a Safe Area.  
This library was created by inheriting the wonderful animation of [FTLinearActivityIndicator](https://github.com/futuretap/FTLinearActivityIndicator). Since it does not use deprecated `isNetworkActivityIndicatorVisible`, it can be used with confidence even in the latest environment.

<div align="center">
    <img src="./sample.gif?raw=true"/>
</div>

# Installation
#### CocoaPods
```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'AKProcessIndicator'
end
```
Replace YOUR_TARGET_NAME and then, in the Podfile directory, type:
```sh
$ pod install
```

#### Carthage
Add this to `Cartfile`.
```ruby
# Cartfile
github "AkkeyLab/AKProcessIndicator"
```
Run this script to install it.
```sh
$ carthage update --platform iOS
```

# Usage
Please import AKProcessIndicator.
```swift
import AKProcessIndicator
```
If you want to use this, you must always perform the setup process immediately after startup.  
I recommend writing the following process in [application(_:didFinishLaunchingWithOptions:)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application) / [scene(_:willConnectTo:options:)](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197914-scene) called by AppDelegate or SceneDelegate.  
If this is executed on a device other than iPhoneX / iPhoneXS / iPhoneXS Max / iPhoneXR / iPhone11 Pro / iPhone11 Pro Max / iPhone11, the processing in the method will be skipped.
```swift
UIApplication.shared.setupProcessIndicatorIfNeeded()
```
After that, it is possible to switch the display / non-display of Process Indicator by switching the flag.
```swift
UIApplication.shared.isLoding = true
```

# Requirements
|env  |version |
|---    |---   |
|Swift  |5.x   |
|Xcode  |11.x  |
|iOS    |11.0  |

# License
AKProcessIndicator is available under the MIT license. See the LICENSE file for more info.
