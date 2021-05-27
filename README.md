# Dotfiles
Automated Configuration, Preferences and Software Installation (School 21)

## Git Config
- git config --global core.pager 'less -x1,5' (set tab width 4 for git diff)
- git config --global core.autocrlf input

## iTerm2 (iterm.json - Profile)
For better experience use these settings:
- Font: JetBrains Mono Regular 12
- [x] Use ligatures
- Theme: Compact
- Tab bar location: Bottom
- [ ] Show per-pane title bar with split panes
- [ ] Dim inactive slpit panes

## macos.sh (System Preferences)
#### General
Show scroll bars:
- [x] When scrolling
#### Displays
Resolution:
- [x] Scaled (More Space)
Brightness:
- [ ] Automatically adjust brightness
Night Shift:
- [ ] Turn On Until Tomorrow
#### Keyboard
- Key Repeat: Fast (Off = 0, Fast = 7)
- Delay Until Repeat: Short (Long = 0, Short = 5)
#### Mouse
- [ ] Scroll direction: Natural
- Tracking speed: 6 (Slow = 0, Fast = 9)
- Double-Click speed: 8 (Slow = 0, Fast = 10)

## matrix.sh
**./matrix** [_name_] -- A simple script to print famous lines from the Matrix
movie.<br>
**name** - if the argument doesn't exist, the script uses $USER
