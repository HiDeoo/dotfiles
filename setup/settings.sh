#!/usr/bin/env bash

# Close System Preferences during execution.
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront.
sudo -v

# Keep-alive.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Setting preferences."

#
# General
#

# Use a dark appearance.
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Show scroll bars when scrolling.
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Jump to the scroll bar spot on click.
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# Prefer tabs when opening documents.
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Close windows when quitting an app.
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Expand Save Panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand Print Panel by default.
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit the printer app once the print jobs complete.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable press-and-hold for keys in favor of key repeat.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Languages.
defaults write NSGlobalDomain AppleLanguages -array "en" "fr"
defaults write NSGlobalDomain AppleLocale -string "en_FR@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Timezone.
sudo systemsetup -settimezone "Europe/Paris" > /dev/null

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable the “reopen windows when logging back in” option.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Update the time and date format for the menubar digital clock.
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE HH:mm:ss\""

#
# UI
#

# Disable the Menu Bar Items for Bluetooth, Time Machine & Airport.
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu"
done

# Set sidebar icon size to small.
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Enable snap-to-grid for desktop icons.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set the Drift screensaver.
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Drift" path -string "/System/Library/Screen Savers/Drift.saver" type -int 0

# Show screensaver after 10 minutes.
defaults -currentHost write com.apple.screensaver idleTime 600

#
# Screenshots
#

# Do not display a thumbnail after taking a screenshot.
defaults write com.apple.screencapture show-thumbnail -bool false

# Remove screenshot delays.
defaults delete com.apple.screencapture captureDelay

#
# Spotlight
#

# Configure Spotlight search result categories.
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
	'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "DIRECTORIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 1;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 1;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 1;"name" = "SOURCE";}'

#
# Finder
#

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories.
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories.
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable disk image verification.
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Use list view in all Finder windows by default.
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder.
chflags nohidden ~/Library

# Remove the delay when hovering the toolbar title.
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

#
# Dock
#

# Disable Dock magnification.
defaults write com.apple.dock magnification -bool false

# Set the icon size of Dock items.
defaults write com.apple.dock tilesize -int 40

# Disable size modification.
defaults write com.apple.dock size-immutable -bool true

# Autohides the Dock.
defaults write com.apple.dock autohide -bool true

# Do not show recently used apps in a separate section of the Dock.
defaults write com.apple.dock show-recents -bool false

# Change the Dock minimize animation.
defaults write com.apple.dock mineffect -string "scale"

# Show open applications indicator.
defaults write com.apple.dock show-process-indicators -bool true

# Minimize window on title bar double click.
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Minimize"

#
# Dashboard
#

# Disable the Dashboard.
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space.
defaults write com.apple.dock dashboard-in-overlay -bool true

#
# Hot corners
#

# Bottom left screen corner → Start screen saver.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

#
# Safari
#

# Show the full URL in the address bar.
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to an empty page.
defaults write com.apple.Safari HomePage -string ""

# Prevent Safari from opening ‘safe’ files automatically after downloading.
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Hide Safari’s bookmarks bar by default.
defaults write com.apple.Safari ShowFavorites -bool false

# Enable the Develop menu and the Web Inspector in Safari.
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views.
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Disable AutoFill.
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Block pop-up windows.
defaults write com.apple.Safari WebKitPreferences.javaScriptCanOpenWindowsAutomatically -bool false

# Enable “Do Not Track”.
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

#
# Activity Monitor
#

# Show the main window when launching Activity Monitor.
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes in Activity Monitor.
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Set columns for each tab in Activity Monitor.
defaults write com.apple.ActivityMonitor "UserColumnsPerTab v6.0" -dict \
	'0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, GPUUsage, PID, UID )' \
	'1' '( Command, anonymousMemory, compressedMemory, ResidentSize, Threads, Ports, PID, UID )' \
	'2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, powerAssertion, UID )' \
	'3' '( Command, bytesWritten, bytesRead, PID, UID )' \
	'4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID )' \
	'5' '( Name, LastHour, LastDay, LastWeek, LastMonth )' \
	'6' '( Command, GPUUsage, GPUTime, PID, UID )'

# Sort columns for each tab in Activity Monitor.
defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
	'0' '{ direction = 0; sort = CPUUsage; }' \
	'1' '{ direction = 0; sort = anonymousMemory; }' \
	'2' '{ direction = 0; sort = 12HRPower; }' \
	'3' '{ direction = 0; sort = bytesWritten; }' \
	'4' '{ direction = 0; sort = txBytes; }'

# Show data graph for the Disk tab in Activity Monitor.
defaults write com.apple.ActivityMonitor DiskGraphType -int 1

# Show data graph for the Network tab in Activity Monitor.
defaults write com.apple.ActivityMonitor NetworkGraphType -int 1

#
# Mac App Store
#

# Enable the automatic update check.
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week.
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background.
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

#
# Misc
#

# Disable smart quotes in Messages as it’s annoying for messages that contain code.
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Prevent Photos from opening automatically when devices are plugged in.
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Don’t automatically rearrange Spaces based on most recent use.
defaults write com.apple.dock mru-spaces -bool false

# Disable smart quotes as they’re annoying when typing code.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Enable zoom using Ctrl + scroll.
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Disable bigger mouse pointer when shaking it.
defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool YES

#
# iTerm
#

# Load preferences from a custom folder.
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Load prefernces from this repository.
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/Projects/dotfiles/config/iterm"

# Save preference changes automatically.
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection -int 2

#
# END
#

echo "Done settings preferences. Note that some of these changes require a logout/restart to take effect."

exit 0
