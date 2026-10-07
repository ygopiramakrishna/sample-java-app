# Run on Connected Android Mobile Device
$ErrorActionPreference = "Continue"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    Sample Android App - Device Runner     " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# 1. Ensure ADB is in PATH
$sdkPlatformTools = "$env:LOCALAPPDATA\Android\Sdk\platform-tools"
if ($env:Path -notlike "*$sdkPlatformTools*") {
    $env:Path = "$sdkPlatformTools;$env:Path"
}

# 2. Check for connected devices
Write-Host ""
Write-Host "[1/3] Checking connected Android devices via ADB..." -ForegroundColor Yellow
$adbOutput = & "$sdkPlatformTools\adb.exe" devices -l
Write-Host ($adbOutput -join "`n")

$connected = $adbOutput | Where-Object { $_ -match "\bdevice\b" -and $_ -notmatch "List of devices attached" }

if (-not $connected) {
    Write-Host ""
    Write-Host "[!] No active Android device detected." -ForegroundColor Red
    Write-Host ""
    Write-Host "HOW TO CONNECT YOUR PHONE:" -ForegroundColor Cyan
    Write-Host "1. Connect your Android phone to this PC using a USB cable." -ForegroundColor White
    Write-Host "2. Enable Developer Options on your phone:" -ForegroundColor White
    Write-Host "   - Open phone Settings -> 'About phone'" -ForegroundColor Gray
    Write-Host "   - Tap 'Build Number' 7 times until you see 'You are now a developer!'" -ForegroundColor Gray
    Write-Host "3. Enable USB Debugging:" -ForegroundColor White
    Write-Host "   - Open Settings -> System -> 'Developer Options'" -ForegroundColor Gray
    Write-Host "   - Turn on 'USB Debugging'" -ForegroundColor Gray
    Write-Host "4. Allow USB Debugging prompt on phone:" -ForegroundColor White
    Write-Host "   - Check 'Always allow from this computer' and tap 'OK'" -ForegroundColor Gray
    Write-Host "5. Re-run this script:" -ForegroundColor White
    Write-Host "   .\run_on_device.ps1" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "[OK] Connected device found!" -ForegroundColor Green

# 3. Check / Build APK
$apkPath = "app\build\outputs\apk\debug\app-debug.apk"
if (-not (Test-Path $apkPath)) {
    Write-Host ""
    Write-Host "[2/3] Building APK..." -ForegroundColor Yellow
    cmd.exe /c "gradlew.bat assembleDebug"
} else {
    Write-Host ""
    Write-Host "[2/3] APK found: $apkPath" -ForegroundColor Green
}

# 4. Install & Launch
Write-Host ""
Write-Host "[3/3] Installing and launching app on your mobile..." -ForegroundColor Yellow
& "$sdkPlatformTools\adb.exe" install -r $apkPath
& "$sdkPlatformTools\adb.exe" shell am start -n com.example.sample/.MainActivity

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "  SUCCESS! App is running on your phone!  " -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
