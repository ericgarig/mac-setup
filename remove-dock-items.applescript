-- Remove 'bloatware' apps from the dock
-- Erik Shagdar, 2018-11-28

on run
    set allowedDockApps to {"Finder", "Google Chrome", "Sublime Text", "Terminal", "System Preferences", "Downloads", "Trash", missing value, "Script Editor"}
    
    tell application "System Events"
        tell process "Dock"
            set currentDockItems to UI elements of list 1
            repeat with oneDockItem in currentDockItems
                set oneDockItem to contents of oneDockItem
                if name of oneDockItem is not in allowedDockApps then
                    tell oneDockItem
                        perform action "AXShowMenu"
                        click menu item "Options" of menu 1
                        click menu item "Remove from Dock" of menu 1 of menu item "Options" of menu 1
                    end tell
                end if
            end repeat
        end tell
    end tell
end run