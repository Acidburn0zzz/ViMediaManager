#tag ModuleProtected Module Preferences	#tag Method, Flags = &h0		Sub AppSupport()		  fAppSupport = SpecialFolder.ApplicationData.Child( app.kAppName )		  If fAppSupport = Nil or NOT fAppSupport.Exists then fAppSupport.CreateAsFolder		  fAppSupport.Child("Cache").CreateAsFolder		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub LoadDefaults()		  // DO NOT DELETE:		  Prefs = NSUserDefaultsMBS.standardUserDefaults		  		  // Main window and element sizing, load application support.		  Dim i as integer		  Dim t() as String		  AppSupport()		  		  'LoadWindowPos( wndMain, "NSWindow Main Size" )		  		  // Sidebar Widths ------------------------------------------		  If Prefs.integerForKey("NSMoviesSidebarWidth") > 0 then		    i = Prefs.integerForKey("NSMoviesSidebarWidth")		    wndMain.lstMovies.Width = i		    wndMain.ActBar(0).Width = i		    wndMain.cvsMovies.Left  = i - 1		    wndMain.ccSearchBoxMovies.Width = i - 1		    // wndMain.cvsMovies.Width = 780 - i + 1 // Window default width - actbar width + negative actbar left		  End If		  wndMain.cvsMovies.Width = wndMain.Width - wndMain.ActBar(0).Width + 1		  		  		  If Prefs.integerForKey("NSTVShowsSidebarWidth") > 0 then		    ' me.Width		  End If		  		  If Prefs.integerForKey("NSAnimeSidebarWidth") > 0 then		    ' me.Width		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub LoadWindowPos(w As Window, name as String)		  If Name <> "" And Prefs.textStringForKey( name ) <> "" Then		    		    Dim t() as String = Prefs.textStringForKey( name ).Split(" ")		    w.Left   = val( t(0) )		    w.Top    = val( t(1) )		    w.Width  = val( t(2) )		    w.Height = val( t(3) )		    		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub SaveWindowPos(w as Window, name as String)		  If Name <> "" Then Prefs.setStringValue name, str( w.Left ) + " " + str( w.Top ) + " " + str( w.Width ) + " " + str( w.Height )		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SetFirstStartPrefs()		  Prefs.setStringValue("DBLanguage"), SystemLanguage		  Prefs.boolForKey("MainToolbarVisible") = True		  		  // Auto downloads		  Prefs.boolForKey("AutoDownloadPoster")       = True		  Prefs.boolForKey("AutoDownloadFanart")       = True		  Prefs.boolForKey("AutoDownloadExtraThumbs")  = True		  Prefs.boolForKey("AutoDownloadExtraFanart")  = True		  Prefs.boolForKey("AutoDownloadDiscArt")      = True		  		  Prefs.boolForKey("AutoDownloadBanner")       = True		  Prefs.boolForKey("AutoDownloadClearArt")     = True		  Prefs.boolForKey("AutoDownloadCharacterArt") = True		  Prefs.boolForKey("AutoDownloadLogo")         = True		  Prefs.boolForKey("AutoDownloadThumb")        = True		  		  Prefs.boolForKey("AutoDownloadTrailer")      = False		  Prefs.boolForKey("UseFolderNameForLookUp")   = True		  		  // Use Unofficial IMDB API		  Prefs.boolForKey("IMDBUnofficialEnabled") = True		  Prefs.boolForKey("IMDBUnofficialTVShowsEnabled") = True		  		  // Match Finder Labels		  Prefs.boolForKey("MatchFinderLabelsToTVStatus")    = False		  Prefs.boolForKey("MatchFinderLabelsToAnimeStatus") = False		  		  // Anime Genre Weight		  Prefs.setIntegerValue "AnimeGenreWeight", 200		  		  // Extra Art Size		  Prefs.setIntegerValue "DownloadedPosterSize", 0		  Prefs.setIntegerValue "DownloadedFanartSize", 0		  		  // Auto Rename		  Prefs.boolForKey("TargetNOTMacOS") = True		  Prefs.boolForKey("AutoManageMedia") = False		  		  // --------		  		  'If Prefs.integerForKey("SortBy")       <=  0 then Prefs.integerForKey("SortBy")       =  0		  If Prefs.integerForKey("SortByMovie")  <=  0 then Prefs.integerForKey("SortByMovie")  =  0		  If Prefs.integerForKey("SortByTV")     <=  0 then Prefs.integerForKey("SortByTV")     =  0		  If Prefs.integerForKey("TimeOut")      <=  0 then Prefs.integerForKey("TimeOut")      = 30		  If Prefs.integerForKey("BatchRename")  <=  0 then Prefs.integerForKey("BatchRename")  =  0		  If Prefs.integerForKey( "PreviewThumbSize" ) <= 0 then Prefs.integerForKey( "PreviewThumbSize" ) = 128		  		  // Use Folder.jpg for file		  If Prefs.textStringForKey("FolderJPGForFileTV")    = "" then Prefs.setStringValue "FolderJPGForFileTV",    Loc.None		  If Prefs.textStringForKey("FolderJPGForFileAnime") = "" then Prefs.setStringValue "FolderJPGForFileAnime", Loc.None		  		  // Default Thumbs		  If Prefs.textStringForKey("DefaultThumbTV")    = ""   then Prefs.setStringValue "DefaultThumbTV",    "Poster"		  If Prefs.textStringForKey("DefaultThumbAnime") = ""   then Prefs.setStringValue "DefaultThumbAnime", "Poster"		  		  // Renaming Patterns		  If Prefs.textStringForKey("RenameStringMovies")  = "" then Prefs.setStringValue "RenameStringMovies",  "$T ($Y)"		  If Prefs.textStringForKey("RenameStringTVShows") = "" then Prefs.setStringValue "RenameStringTVShows", "$T"		  If Prefs.textStringForKey("RenameStringAnime")   = "" then Prefs.setStringValue "RenameStringAnime",   "$T"		  		  // File Names		  If Prefs.textStringForKey("FileNamePoster")  = "" then Prefs.setStringValue "FileNamePoster",  "<movie>.jpg"		  If Prefs.textStringForKey("FileNameFanart")  = "" then Prefs.setStringValue "FileNameFanart",  "<movie>-fanart.jpg"		  If Prefs.textStringForKey("FileNameNFO")     = "" then Prefs.setStringValue "FileNameNFO",     "<movie>.nfo"		  If Prefs.textStringForKey("FileNameTrailer") = "" then Prefs.setStringValue "FileNameTrailer", "<movie>-trailer"		  		  If Prefs.textStringForKey("FileNameNFOTV")    = "" then Prefs.setStringValue "FileNameNFOTV",    "tvshow.nfo"		  If Prefs.textStringForKey("FileNameNFOAnime") = "" then Prefs.setStringValue "FileNameNFOAnime", "tvshow.nfo"		  		  // FileNamePoster  = Prefs.textStringForKey("FileNamePoster")		  // FileNameFanart  = Prefs.textStringForKey("FileNameFanart")		  // FileNameNFO     = Prefs.textStringForKey("FileNameNFO")		  // FileNameTrailer = Prefs.textStringForKey("FileNameTrailer")		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub WriteDefaults()		  If Prefs.synchronize then		    'If DebugBuild then MsgBox "Saved preferences!"		  End If		End Sub	#tag EndMethod	#tag Property, Flags = &h0		fAppSupport As FolderItem	#tag EndProperty	#tag Property, Flags = &h0		Prefs As NSUserDefaultsMBS	#tag EndProperty	#tag Constant, Name = SystemLanguage, Type = String, Dynamic = True, Default = \"en", Scope = Public		#Tag Instance, Platform = Any, Language = en, Definition  = \"en"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"nl"		#Tag Instance, Platform = Any, Language = da, Definition  = \"da"		#Tag Instance, Platform = Any, Language = fi, Definition  = \"fi"		#Tag Instance, Platform = Any, Language = de, Definition  = \"de"		#Tag Instance, Platform = Any, Language = it, Definition  = \"it"		#Tag Instance, Platform = Any, Language = es, Definition  = \"es"		#Tag Instance, Platform = Any, Language = fr, Definition  = \"fr"		#Tag Instance, Platform = Any, Language = pl, Definition  = \"pl"		#Tag Instance, Platform = Any, Language = hu, Definition  = \"hu"		#Tag Instance, Platform = Any, Language = el, Definition  = \"el"		#Tag Instance, Platform = Any, Language = tr, Definition  = \"tr"		#Tag Instance, Platform = Any, Language = ru, Definition  = \"ru"		#Tag Instance, Platform = Any, Language = he, Definition  = \"he"		#Tag Instance, Platform = Any, Language = ja, Definition  = \"ja"		#Tag Instance, Platform = Any, Language = pt, Definition  = \"pt"		#Tag Instance, Platform = Any, Language = zh_TW, Definition  = \"zh"		#Tag Instance, Platform = Any, Language = cs, Definition  = \"cs"		#Tag Instance, Platform = Any, Language = sk, Definition  = \"sl"		#Tag Instance, Platform = Any, Language = hr, Definition  = \"hr"		#Tag Instance, Platform = Any, Language = ko, Definition  = \"ko"		#Tag Instance, Platform = Any, Language = no, Definition  = \"no"	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule