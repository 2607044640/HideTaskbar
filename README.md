HideTaskbar (AHK v2)
A zero-latency, API-level AutoHotkey v2 script that completely hides the Windows taskbar for true fullscreen immersion. It bypasses the clunky Windows registry and avoids restarting explorer.exe, providing a seamless and flicker-free experience.

✨ Key Features
Hold to Show, Release to Hide: Press and hold the Win key to instantly reveal the taskbar. Release it to make it vanish completely.

Mac Dock-Style Hover: Move your mouse to the absolute bottom edge of your screen (within 2 pixels) to peek at the taskbar.

Double-Tap for Start Menu: Quickly double-tap the Win key to open Windows Search / Start Menu for quick typing and app launching.

Native Shortcuts Intact: Win + D, Win + 1/2/3, and all other native Windows combinations work flawlessly without triggering the Start Menu.

Absolute State Enforcement: A 0.2-second background watchdog prevents Windows from force-popping the taskbar during notifications or app switches.

UIPI Bypass (Auto-Admin): Automatically requests Administrator privileges on startup so it works perfectly even when you are focused on high-privilege apps or games.

⚙️ Prerequisites
AutoHotkey v2 installed on your Windows machine.

🚀 Installation & Usage
Download the HideTaskbar.ahk script.

Double-click the file to run it.

Click Yes on the User Account Control (UAC) prompt. (Admin rights are required to ensure the script works over other Admin-level apps).

The script will run quietly in the background. You will see a green 'H' icon in your system tray.

🛠️ Customization
You can easily tweak the script's behavior by opening the .ahk file in any text editor (like Notepad):

Double-Tap Speed: Locate the line if (currentTime - lastWinPress < 300). Change 300 (milliseconds) to a higher or lower number to adjust the double-tap sensitivity.

Mouse Trigger Area: Locate the line isMouseAtBottom := (mouseY >= A_ScreenHeight - 2). Change 2 to 5 or 10 if you want a larger trigger area at the bottom of the screen.

🧠 Technical Details: Why not just use standard "Auto-Hide"?
Standard Windows "Auto-Hide" leaves a visible 1-2 pixel "ghost line" at the bottom of the screen and reserves that desktop work area. This script uses direct Windows API calls (User32.dll\ShowWindow) to send an absolute SW_HIDE command. This completely removes the taskbar and its reserved space, ensuring true edge-to-edge rendering for your maximized windows.
