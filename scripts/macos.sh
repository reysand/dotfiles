#!/bin/bash
osascript > /dev/null 2>&1 <<EOD
	tell application "System Events"
		tell appearance preferences
			set dark mode to true
			display dialog ("Dark mode activated") \
				buttons "OK" default button "OK" \
				with icon note with title "General Settings / Appearance"
		end tell
	end tell
	
	tell application "System Preferences"
		activate
		reveal pane "General"
		delay 5
		reveal pane "Keyboard"
		delay 5
		reveal pane "Displays"
		delay 5
		reveal pane "Mouse"
		delay 5
	end tell
	quit application "System Preferences"
EOD
