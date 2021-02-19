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
		display dialog ("General Settings") \
			buttons "OK" default button "OK" \
			with icon note with title "Settings"
		reveal pane "Keyboard"
		display dialog ("Keyboard Settings") \
			buttons "OK" default button "OK" \
			with icon note with title "Settings"
		reveal pane "Displays"
		display dialog ("Displays Settings") \
			buttons "OK" default button "OK" \
			with icon note with title "Settings"
		reveal pane "Mouse"
		display dialog ("Mouse Settings") \
			buttons "OK" default button "OK" \
			with icon note with title "Settings"
	end tell
	quit application "System Preferences"
EOD
