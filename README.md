# iPhoneOSDeviceSupport
Xcode iPhoneOS DeviceSupport (6.0 - 15.2)

**Latest releases:**</br>

**iOS 15.2** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/15.2.zip) </br>
**iOS 15.1** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/15.1%20(19B74).zip) </br>
**iOS 15.0** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/15.0.zip) </br>
**iOS 14.7.1** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.7.1.zip) </br>
**iOS 14.7** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.7.zip) </br>
**iOS 14.6** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.6.zip) </br>
**iOS 14.5** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.5.zip) </br>
**iOS 14.4** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.4.zip) </br>
**iOS 14.3** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.3.zip) </br>
**iOS 14.2** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.2.zip) </br>
**iOS 14.1** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.1.zip) </br>
**iOS 14.0** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.0.zip) </br>
**iOS 13.7** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.7.zip) </br>
**iOS 13.6** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.6.zip) </br>
**iOS 13.5** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.5.zip) </br>
**iOS 13.4** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.4.zip) </br>
**iOS 13.3** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.3.zip) </br>
**iOS 13.2** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.2.zip) </br>
**iOS 13.1** - [Download](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/13.1.zip)
</br>
</br>


⚠️  **Warning** ⚠️
</br>
```diff
Xcode 12 now encrypts the connection between Xcode and paired devices, protecting against an attacker in a privileged network position executing arbitrary code on connected iOS, iPadOS, watchOS, or tvOS devices during a remote debug session. (60386733)

These security benefits are available when Xcode 12 connects to devices running iOS 14, iPadOS 14, watchOS 7, tvOS 14, or later versions. 
These OS versions also refuse debugger connections from older Xcode releases. 
Xcode 12 continues to support debugging for older OS versions, but without the new encryption. 
```
[Thank to this comment](https://github.com/filsv/iPhoneOSDeviceSupport/issues/69#issuecomment-694508149) </br>

```diff
For debugging in iOS 14 devices you need Xcode 12 atleast. 
Cause Apple have updated their code for debugging apps on iOS 14 and that is not compatible on older version of Xcode.
```
[Thank to this comment](https://github.com/filsv/iPhoneOSDeviceSupport/issues/76#issuecomment-735321146)

🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩
```diff
- To get iOS 13.(version) [example iOS 13.5.1] works with iOS 14.0, just rename a folder.
- Like this: 13.5 ~> 13.5.1 (17F80);
```

**How to support iOS 14 devices with Xcode 11.5+:**</br> (tested with 11.6 (11E708))

**[Download iOS 14.2 Support Files](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/14.2.zip)** </br>
**Unzip it**</br>
**Put unzipped folder in into path:**</br>
```/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/```</br>
**Restart Xcode**</br>

**How to:**

1) Download version you need listed above;
2) Unzip it;
3) Close Xcode;
4) Copy and paste unziped folder by path:

```/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/```

<p align="center">hierarchy like this:</p>

![alt text](https://github.com/filsv/iPhoneOSDeviceSupport/raw/master/Screen%20Shot%202019-08-02%20at%2015.09.55.png)

5) Reopen Xcode;

Thank You.
