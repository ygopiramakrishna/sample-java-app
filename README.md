# Sample Android Application

A clean, modern native Android application built with Kotlin, Material 3, Android Gradle Plugin 8.3, and Gradle 8.7.

---

## 📱 App Highlights
- **Architecture**: Single Activity (`MainActivity.kt`) with View Binding.
- **UI**: Material 3 theme (`Theme.Material3.DayNight.NoActionBar`) with responsive cards and clean gradients.
- **Dynamic Device Info**: Displays phone model, Android OS version, SDK API level, and CPU ABI in real time.
- **Interactive Controls**: Touch counter with dynamic updates, Material Toast alerts, and system status display.

---

## 📁 Project Structure

```
d:\Android\Sample\
├── app/
│   ├── src/main/
│   │   ├── AndroidManifest.xml
│   │   ├── java/com/example/sample/MainActivity.kt
│   │   └── res/
│   │       ├── layout/activity_main.xml
│   │       ├── values/colors.xml, strings.xml, themes.xml
│   │       └── drawable/ & mipmap/
│   └── build.gradle.kts
├── gradle/wrapper/
├── .vscode/
│   └── tasks.json
├── run_on_device.bat      <-- 1-Click launcher for Windows
├── run_on_device.ps1      <-- PowerShell automated runner
├── gradlew.bat
├── settings.gradle.kts
└── build.gradle.kts
```

---

## 🔌 How to Connect and Run on Your Mobile Phone

### Method 1: Via USB Cable (Recommended & Fastest)

1. **Enable Developer Options on your Android phone**:
   - Open your phone's **Settings**.
   - Scroll to **About phone** (or **System** -> **About phone**).
   - Find **Build number** and tap it **7 times** continuously.
   - You will see a toast: *"You are now a developer!"*.

2. **Enable USB Debugging**:
   - Go back to **Settings** -> **Developer options** (or **System** -> **Developer options**).
   - Find and turn on the toggle for **USB debugging**.

3. **Connect to PC**:
   - Plug your phone into your computer using a USB data cable.
   - Look at your phone screen: a popup will ask *"Allow USB debugging?"*.
   - Check **"Always allow from this computer"** and tap **Allow / OK**.

4. **Run the App on Mobile**:
   Simply run in your terminal:
   ```powershell
   .\run_on_device.ps1
   ```
   Or double-click `run_on_device.bat` in Windows Explorer!

---

### Method 2: Wireless Debugging (Wi-Fi, No USB Cable needed)

If your device runs Android 11 or higher:
1. Ensure your PC and phone are connected to the **same Wi-Fi network**.
2. On your phone, go to **Settings** -> **Developer options** -> **Wireless debugging**.
3. Toggle it ON and tap **"Pair device with pairing code"**.
4. Note the IP address, Port, and 6-digit code shown on the screen.
5. In your PC terminal, run:
   ```powershell
   adb pair <ip_address>:<pairing_port>
   # Enter the 6-digit code when prompted
   adb connect <ip_address>:<connection_port>
   ```
6. Run `.\run_on_device.ps1` to install and launch!

---

## 🛠️ Installed Extensions & Tools

The following VS Code / IDE extensions and build tools have been installed and configured:
- **Gradle for Java** (`vscjava.vscode-gradle`)
- **Extension Pack for Java** (`vscjava.vscode-java-pack`)
- **Kotlin Language Support** (`mathiasfrohlich.kotlin`)
- **Android Dev Extension** (`adelphes.android-dev-ext`)
- **Android SDK Platform 34** & **Build-Tools 34.0.0**
- **Android Debug Bridge (ADB)** configured in environment PATH
