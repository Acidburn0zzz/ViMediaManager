#tag MenuBegin Menu mBarMain   Begin MenuItem FileMenu      SpecialMenu = 0      Text = "#Menu.File"      Index = -2147483648      AutoEnable = True      Begin MenuItem FileOpenInFinder         SpecialMenu = 0         Text = "#Menu.FileShowInFinder"         Index = -2147483648         ShortcutKey = "O"         Shortcut = "Cmd+Shift+O"         MenuModifier = True         AltMenuModifier = True         AutoEnable = True      End      Begin MenuItem FileCloseWindow         SpecialMenu = 0         Text = "#Menu.FileCloseWindow"         Index = -2147483648         ShortcutKey = "W"         Shortcut = "Cmd+W"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 9         AutoEnable = True      End      Begin MenuItem FileReload         SpecialMenu = 0         Text = "#Menu.FileReload"         Index = -2147483648         ShortcutKey = "R"         Shortcut = "Cmd+R"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem FileUpdateShowStatus         SpecialMenu = 0         Text = "#Menu.FileUpdateShowStatus"         Index = -2147483648         ShortcutKey = "R"         Shortcut = "Cmd+Shift+R"         MenuModifier = True         AltMenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 10         AutoEnable = True      End      Begin MenuItem FileFetchMetadata         SpecialMenu = 0         Text = "#Menu.FileFetchMetadata"         Index = -2147483648         ShortcutKey = "I"         Shortcut = "Cmd+Shift+I"         MenuModifier = True         AltMenuModifier = True         AutoEnable = True      End      Begin MenuItem FileFetchMetadataforallMedia         SpecialMenu = 0         Text = "#Menu.FileFetchMetadataForAll"         Index = -2147483648         ShortcutKey = "I"         Shortcut = "Cmd+Shift+I"         MenuModifier = True         AltMenuModifier = True         AutoEnable = True      End      Begin MenuItem FileManualSearch         SpecialMenu = 0         Text = "#Menu.FileManualSearch"         Index = -2147483648         ShortcutKey = "F"         Shortcut = "Cmd+F"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 11         AutoEnable = True      End      Begin QuitMenuItem FileQuit         SpecialMenu = 0         Text = "#App.kFileQuit"         Index = -2147483648         ShortcutKey = "#App.kFileQuitShortcut"         Shortcut = "#App.kFileQuitShortcut"         AutoEnable = True      End   End   Begin MenuItem EditMenu      SpecialMenu = 0      Text = "#Menu.Edit"      Index = -2147483648      AutoEnable = True      Begin MenuItem EditUndo         SpecialMenu = 0         Text = "#Menu.EditUndo"         Index = -2147483648         ShortcutKey = "Z"         Shortcut = "Cmd+Z"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 6         AutoEnable = True      End      Begin MenuItem EditCut         SpecialMenu = 0         Text = "#Menu.EditCut"         Index = -2147483648         ShortcutKey = "X"         Shortcut = "Cmd+X"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem EditCopy         SpecialMenu = 0         Text = "#Menu.EditCopy"         Index = -2147483648         ShortcutKey = "C"         Shortcut = "Cmd+C"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem EditPaste         SpecialMenu = 0         Text = "#Menu.EditPaste"         Index = -2147483648         ShortcutKey = "V"         Shortcut = "Cmd+V"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem EditClear         SpecialMenu = 0         Text = "#Menu.EditDelete"         Index = -2147483648         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 7         AutoEnable = True      End      Begin MenuItem EditSelectAll         SpecialMenu = 0         Text = "#Menu.EditSelectAll"         Index = -2147483648         ShortcutKey = "A"         Shortcut = "Cmd+A"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 8         AutoEnable = True      End      Begin PrefsMenuItem EditPreferences         SpecialMenu = 0         Text = "#Menu.ApplePreferences"         Index = -2147483648         ShortcutKey = ","         Shortcut = "Cmd+,"         MenuModifier = True         AutoEnable = True      End   End   Begin MenuItem ViewMenu      SpecialMenu = 0      Text = "#Menu.View"      Index = -2147483648      AutoEnable = True      Begin MenuItem ViewEditMetadata         SpecialMenu = 0         Text = "#Menu.ViewEditMetadata"         Index = -2147483648         ShortcutKey = "I"         Shortcut = "Cmd+I"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 4         AutoEnable = True      End      Begin MenuItem MenuViewMovies         SpecialMenu = 0         Text = "#Menu.ViewMovies"         Index = -2147483648         ShortcutKey = "1"         Shortcut = "Cmd+1"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuViewTVShows         SpecialMenu = 0         Text = "#Menu.ViewTVShows"         Index = -2147483648         ShortcutKey = "2"         Shortcut = "Cmd+2"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuViewAnime         SpecialMenu = 0         Text = "#Menu.ViewAnime"         Index = -2147483648         ShortcutKey = "3"         Shortcut = "Cmd+3"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 5         AutoEnable = True      End      Begin MenuItem MenuViewHideToolbar         SpecialMenu = 0         Text = "#Menu.ViewHideToolbar"         Index = -2147483648         ShortcutKey = "T"         Shortcut = "Cmd+Option+T"         MenuModifier = True         MacOptionKey = True         AutoEnable = True      End      Begin MenuItem MenuViewCustomizeToolbar         SpecialMenu = 0         Text = "#Menu.ViewCustomizeToolbar"         Index = -2147483648         AutoEnable = True      End   End   Begin MenuItem ToolsMenu      SpecialMenu = 0      Text = "#Menu.Tools"      Index = -2147483648      AutoEnable = True      Begin MenuItem ToolsMovies2Folders         SpecialMenu = 0         Text = "#menu.ToolsPutMovies2Folders"         Index = -2147483648         ShortcutKey = "S"         Shortcut = "Cmd+Option+Alt+S"         MenuModifier = True         MacOptionKey = True         PCAltKey = True         AutoEnable = True      End      Begin MenuItem ToolsBulkRenamer         SpecialMenu = 0         Text = "#menu.ToolsBulkRenamer"         Index = -2147483648         ShortcutKey = "R"         Shortcut = "Cmd+Option+Alt+R"         MenuModifier = True         MacOptionKey = True         PCAltKey = True         AutoEnable = True      End   End   Begin MenuItem WindowMenu      SpecialMenu = 0      Text = "#Menu.Window"      Index = -2147483648      AutoEnable = True      Begin MenuItem WindowMinimize         SpecialMenu = 0         Text = "#Menu.WindowMinimize"         Index = -2147483648         ShortcutKey = "M"         Shortcut = "Cmd+M"         MenuModifier = True         AutoEnable = True      End      Begin MenuItem WindowZoom         SpecialMenu = 0         Text = "#Menu.WindowZoom"         Index = -2147483648         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 2         AutoEnable = True      End      Begin MenuItem WindowBringAlltoFront         SpecialMenu = 0         Text = "#Menu.WindowBringAllToFront"         Index = -2147483648         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 3         AutoEnable = True      End   End   Begin MenuItem HelpMenu      SpecialMenu = 0      Text = "#Menu.Help"      Index = -2147483648      AutoEnable = True      Begin AppleMenuItem HelpAbout         SpecialMenu = 0         Text = "#Menu.HelpAbout"         Index = -2147483648         AutoEnable = True      End      Begin AppleMenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 0         AutoEnable = True      End      Begin AppleMenuItem HelpDonate         SpecialMenu = 0         Text = "#Menu.HelpDonate"         Index = -2147483648         AutoEnable = True      End      Begin AppleMenuItem HelpCheckForUpdates         SpecialMenu = 0         Text = "#Menu.HelpCheckForUpdates"         Index = -2147483648         AutoEnable = True      End      Begin AppleMenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 1         AutoEnable = True      End      Begin MenuItem HelpVisitWebsite         SpecialMenu = 0         Text = "#Menu.HelpVisitWebsite"         Index = -2147483648         AutoEnable = True      End      Begin MenuItem HelpContactAuthor         SpecialMenu = 0         Text = "#Menu.HelpContactAuthor"         Index = -2147483648         AutoEnable = True      End      Begin MenuItem MenuSeparator         SpecialMenu = 0         Text = "-"         Index = 12         AutoEnable = True      End      Begin MenuItem HelpVisitXBMCForumThread         SpecialMenu = 0         Text = "#Menu.HelpVisitXBMCForumThread"         Index = -2147483648         AutoEnable = True      End      Begin MenuItem HelpDownloadStudioLogosets         SpecialMenu = 0         Text = "#Menu.HelpDownloadStudioLogosets"         Index = -2147483648         AutoEnable = True      End   EndEnd#tag EndMenu