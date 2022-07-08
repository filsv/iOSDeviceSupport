# iPhoneOSDeviceSupport
Xcode iPhoneOS DeviceSupport (6.0 - 16.0)
[[WatchOS](https://github.com/filsv/watchOSDeviceSupport) | [tvOS](https://github.com/filsv/TVOSDeviceSupport)];

**Most recent releases:**</br>

iOS 16.0 - [Download](/16.0.zip) </br>
iOS 15.5 - [Download](/15.5.zip) </br>
iOS 15.4 - [Download](/15.4.zip) </br>
iOS 15.3 - [Download](/15.3.zip) </br>
iOS 15.2 - [Download](/15.2.zip) </br>
iOS 15.1 - [Download](/15.1.zip) </br>
iOS 15.0 - [Download](/15.0.zip) </br>

**iOS 14+**</br>
iOS 14.7.1 - [Download](/14.7.1.zip) </br>
iOS 14.7 - [Download](/14.7.zip) </br>
iOS 14.6 - [Download](/14.6.zip) </br>
iOS 14.5 - [Download](/14.5.zip) </br>
iOS 14.4 - [Download](/14.4.zip) </br>
iOS 14.3 - [Download](/14.3.zip) </br>
iOS 14.2 - [Download](/14.2.zip) </br>
iOS 14.1 - [Download](/14.1.zip) </br>
iOS 14.0 - [Download](/14.0.zip) </br>

**iOS 13+**</br>
iOS 13.7 - [Download](/13.7.zip) </br>
iOS 13.6 - [Download](/13.6.zip) </br>
iOS 13.5 - [Download](/13.5.zip) </br>
iOS 13.4 - [Download](/13.4.zip) </br>
iOS 13.3 - [Download](/13.3.zip) </br>
iOS 13.2 - [Download](/13.2.zip) </br>
iOS 13.1 - [Download](/13.1.zip) </br>
iOS 13.0 - [Download](/13.0.zip) </br>

**iOS 12+**</br>
iOS 12.4 - [Download](/12.4.zip) </br>
iOS 12.4 (16G73) - [Download](/12.4%20(16G73).zip) </br>
iOS 12.3 - [Download](/12.3.zip) </br>
iOS 12.2 - [Download](/12.2.zip) </br>
iOS 12.2 (16E5181e) - [Download](/12.1%20(16B91).zip) </br>
iOS 12.1 - [Download](/12.1.zip) </br>
iOS 12.1 (16B91) - [Download](/12.1%20(16B91).zip) </br>
iOS 12.1 (16B5059d) - [Download](/12.1%20(16B5059d).zip) </br>
iOS 12.0 - [Download](/12.0.zip) </br>
iOS 12.0 (16A366) - [Download](/12.0%20(16A366).zip) </br>

**iOS 11+**</br>
iOS 11.4 - [Download](/11.4.zip) </br>
iOS 11.4.1 (15G77) - [Download](/11.4.1%20(15G77).zip) </br>
iOS 11.4 (15F79) - [Download](/11.4%20(15F79).zip) </br>
iOS 11.4 (15F5061c) - [Download](/11.4%20(15F5061c).zip) </br>
iOS 11.4 (15F5037c) - [Download](/11.4%20(15F5037c).zip) </br>
iOS 11.3 - [Download](/11.3.zip) </br>
iOS 11.3 (15E5178d) - [Download](/11.3%20(15E5178d).zip) </br>
iOS 11.2 - [Download](/11.2.zip) </br>
iOS 11.1 - [Download](/11.1.zip) </br>
iOS 11.0 - [Download](/11.0.zip) </br>

**iOS 10+**</br>
iOS 10.3 - [Download](/10.3.zip) </br>
iOS 10.3 (14E5265a) - [Download](/10.3%20(14E5265a).zip) </br>
iOS 10.3 (14E5230d) - [Download](/10.3%20(14E5230d).zip) </br>
iOS 10.2 - [Download](/10.2.zip) </br>
iOS 10.1 - [Download](/10.1.zip) </br>
iOS 10.0 - [Download](/10.0.zip) </br>


**iOS 9+**</br>
iOS 9.3 - [Download](/9.3.zip) </br>
iOS 9.2 - [Download](/9.2.zip) </br>
iOS 9.1 - [Download](/9.1.zip) </br>
iOS 9.0 - [Download](/9.0.zip) </br>
</br>

**Note:**
`
If you need upper version of the support files less than 1 iteration (eg. You have "15.0" and you need "15.1.5" - You can simply rename folder from "15.0" to "15.1.5" and it should work or try to use next iteration version of the support files, is exist "15.2", otherwise open an issue);
`

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

**[Download iOS 14.2 Support Files](/14.2.zip)** </br>
**Unzip it**</br>
**Put unzipped folder into path:**</br>
```/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/```</br>
**Restart Xcode**</br>

**How to:**

1) Download version you need listed above;
2) Unzip it;
3) Close Xcode;
4) Copy and paste unziped folder by path:

```/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/```

<p align="center">hierarchy like this:</p>

![alt text](/Screen%20Shot%202019-08-02%20at%2015.09.55.png)

5) Reopen Xcode;

Thank You.

Xcode usage license - [Link](https://www.apple.com/legal/sla/docs/xcode.pdf).
