# revShellAndroid
revShell smali code for android OS

<img src="https://github.com/dokDork/revShellAndroid/raw/main/images/revShell.png" width="800">  


## Disclaimer
This tool is provided for authorized security testing, research, and educational purposes only.
If you use this tool for any activity involving attacks, exploitation, or security testing against individuals, companies, systems, or networks, you must have explicit prior authorization from the relevant person, organization, or asset owner.

Unauthorized use is strictly prohibited. The author assumes no responsibility for any misuse or damage caused by this tool.
  
## Description
Two folders have been created:

The **NON-persistent-revShell** folder contains:
- the AndroidManifest.xml file and
- the AndroidLauncher.smali file along with a set of supporting files.
This material ensures that when the Android app, into which this code has been injected, is executed, a reverse shell is initiated toward a specific IP:Port.
When the app is closed, the reverse shell is terminated.

The **persistent-revShell** folder contains:
- the AndroidManifest.xml file and
- the AndroidLauncher.smali file along with a set of supporting files.
This material ensures that when the Android app, into which this code has been injected, is executed, a reverse shell is initiated toward a specific IP:Port.
When the app is closed, the reverse shell remains active.
The characteristics of this type of reverse shell are as follows:
   - Foreground Service — Remains active even after closing the app
   - Auto-restart — If killed, onDestroy() immediately restarts it
   - Auto-reconnect — If the connection drops, it retries every 5 seconds
   - Disguised notification — "Game Services" to appear legitimate


## How to inject reverse Shell
To use this material, it is necessary to:
- decompile a specific APK
- modify the manifest by adding the indicated permissions and the directive in the application tag android:usesCleartextTraffic="true"
- modify AndroidLauncher.smali by inserting, in onCreate, the call to reverseShell. The reverseShell method is inside AndroidLauncher.smali. In the same folder where AndroidLauncher is located, a set of supporting files must also be added: those saved inside the two folders.
- Compile the new code
- Sign the apk and install it on Android
- Activate a listener
```
nc -nlvp 9001
```
<img src="https://github.com/dokDork/revShellAndroid/raw/main/images/01.png" width="500">  

