 @echo off
setlocal
cd /d "%~dp0"

  :: 1. Check for Administrative Privileges
  net session >nul 2>&1
  if %errorLevel% equ 0 (
      echo [OK] Running as Administrator.
  ) else (
      echo [WARNING] Not running as Administrator. Some features ^(Prefetch clean, Deep Scan^) may fail.
      echo To fix this, right-click this file and select 'Run as Administrator'.
  )

:: 2. Launch UI immediately (priority), shortcut sync deferred to background
start "" powershell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -File "%~dp0core\AntigravityUI.ps1"

  :: 3. Sync shortcut in background (non-blocking)
  start /b "" powershell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -File "%~dp0core\create_shortcut.ps1" -TargetScriptPath "%~dp0launch.cmd"

  endlocal
