#Requires AutoHotkey v2.0

; ==========================================
; 【新增】：自动获取管理员权限，无视任何高权限游戏/软件的屏蔽
if not A_IsAdmin {
    Run '*RunAs "' A_ScriptFullPath '"'
    ExitApp
}
; ==========================================

DetectHiddenWindows True
CoordMode "Mouse", "Screen" 

SetTimer EnforceTaskbarState, 200

~LWin::
~RWin:: {
    Send "{Blind}{vkE8}"
    EnforceTaskbarState()
}

~LWin Up::
~RWin Up:: {
    EnforceTaskbarState()
}

EnforceTaskbarState() {
    isWinDown := GetKeyState("LWin", "P") || GetKeyState("RWin", "P")
    
    MouseGetPos(&mouseX, &mouseY)
    isMouseAtBottom := (mouseY >= A_ScreenHeight - 2)
    
    cmd := (isWinDown || isMouseAtBottom) ? 5 : 0
    
    hwndMain := WinExist("ahk_class Shell_TrayWnd")
    hwndSec := WinExist("ahk_class Shell_SecondaryTrayWnd")
    hwndStart := WinExist("ahk_class Button")

    if (hwndMain)
        DllCall("User32.dll\ShowWindow", "Ptr", hwndMain, "Int", cmd)
    if (hwndSec)
        DllCall("User32.dll\ShowWindow", "Ptr", hwndSec, "Int", cmd)
    if (hwndStart)
        DllCall("User32.dll\ShowWindow", "Ptr", hwndStart, "Int", cmd)
}