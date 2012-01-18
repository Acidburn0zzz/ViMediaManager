#tag ModuleProtected Module Preferences	#tag Method, Flags = &h0		Sub AppSupport()		  Dim f as FolderItem = SpecialFolder.ApplicationData.Child( app.kAppName )		  If f <> Nil and f.Exists then		    		  Else		    f.CreateAsFolder		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub LoadDefaults()		  Prefs = NSUserDefaultsMBS.standardUserDefaults		  Dim i as integer		  Dim t() as String		  AppSupport()		  		  // Window Main size ----------------------------------------		  If Prefs.textStringForKey( "NSWindow Main Size" ) <> "" then		    t() = Prefs.textStringForKey( "NSWindow Main Size" ).Split(" ")		    wndMain.Left   = val( t(0) )		    wndMain.Top    = val( t(1) )		    wndMain.Width  = val( t(2) )		    wndMain.Height = val( t(3) )		    		    // Sidebar Widths ------------------------------------------		    If Prefs.integerForKey("NSMoviesSidebarWidth") > 0 then		      i = Prefs.integerForKey("NSMoviesSidebarWidth")		      wndMain.lstMovies.Width = i		      wndMain.ActBar(0).Width = i		      wndMain.cvsMovies.Left  = i - 1		      // wndMain.cvsMovies.Width = 780 - i + 1 // Window default width - actbar width + negative actbar left		    End If		    		    If Prefs.integerForKey("NSTVShowsSidebarWidth") > 0 then		      ' me.Width		    End If		    		    If Prefs.integerForKey("NSAnimeSidebarWidth") > 0 then		      ' me.Width		    End If		    		  End If		  		  If NOT Prefs.boolForKey("FirstStartHappened") then		    Prefs.setStringValue("DBLanguage"), SystemLanguage		    		    // Auto downloads		    Prefs.boolForKey("AutoDownloadPoster")       = True		    Prefs.boolForKey("AutoDownloadFanart")       = True		    Prefs.boolForKey("AutoDownloadExtraThumbs")  = True		    		    Prefs.boolForKey("AutoDownloadBanner")       = True		    Prefs.boolForKey("AutoDownloadClearArt")     = True		    Prefs.boolForKey("AutoDownloadCharacterArt") = True		    Prefs.boolForKey("AutoDownloadLogo")         = True		    Prefs.boolForKey("AutoDownloadTVThumb")      = True		    		    // Use Unofficial IMDB API		    Prefs.boolForKey("IMDBUnofficialEnabled") = True		    		    // Match Finder Labels		    Prefs.boolForKey("MatchFinderLabelsToTVStatus")    = False		    Prefs.boolForKey("MatchFinderLabelsToAnimeStatus") = False		    		    // Anime Genre Weight		    Prefs.setIntegerValue "AnimeGenreWeight", 200		    		    // Use YAMJ file naming		    Prefs.setBoolValue "YAMJFileName",    False		  End If		  		  If Prefs.integerForKey("SortBy")      <=  0 then Prefs.integerForKey("SortBy")      =  0		  If Prefs.integerForKey("SortByMovie") <=  0 then Prefs.integerForKey("SortByMovie") =  0		  If Prefs.integerForKey("TimeOut")     <=  0 then Prefs.integerForKey("TimeOut")     = 30		  If Prefs.integerForKey( "PreviewThumbSize" ) <= 0 then Prefs.integerForKey( "PreviewThumbSize" ) = 128		  		  // Use Folder.jpg for file		  If Prefs.textStringForKey("FolderJPGForFileTV")    = "" then Prefs.setStringValue "FolderJPGForFileTV",    Localizable.None		  If Prefs.textStringForKey("FolderJPGForFileAnime") = "" then Prefs.setStringValue "FolderJPGForFileAnime", Localizable.None		  		  // Default Thumbs		  If Prefs.textStringForKey("DefaultThumbTV")    = ""   then Prefs.setStringValue "DefaultThumbTV",    "Poster"		  If Prefs.textStringForKey("DefaultThumbAnime") = ""   then Prefs.setStringValue "DefaultThumbAnime", "Poster"		  		  // Renaming Patterns		  If Prefs.textStringForKey("RenameStringMovies")  = "" then Prefs.setStringValue "RenameStringMovies",  "$T ($Y)"		  If Prefs.textStringForKey("RenameStringTVShows") = "" then Prefs.setStringValue "RenameStringTVShows", "$T"		  If Prefs.textStringForKey("RenameStringAnime")   = "" then Prefs.setStringValue "RenameStringAnime",   "$T"		  		  // File Names		  If Prefs.textStringForKey("FileNamePoster")  = "" then Prefs.setStringValue "FileNamePoster",  "<movie>.jpg"		  If Prefs.textStringForKey("FileNameFanart")  = "" then Prefs.setStringValue "FileNameFanart",  "<movie>-fanart.jpg"		  If Prefs.textStringForKey("FileNameNFO")     = "" then Prefs.setStringValue "FileNameNFO",     "<movie>.nfo"		  If Prefs.textStringForKey("FileNameTrailer") = "" then Prefs.setStringValue "FileNameTrailer", "<movie>-trailer"		  		  // FileNamePoster  = Prefs.textStringForKey("FileNamePoster")		  // FileNameFanart  = Prefs.textStringForKey("FileNameFanart")		  // FileNameNFO     = Prefs.textStringForKey("FileNameNFO")		  // FileNameTrailer = Prefs.textStringForKey("FileNameTrailer")		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub WriteDefaults()		  If Prefs.synchronize then		    'If DebugBuild then MsgBox "Saved preferences!"		  End If		End Sub	#tag EndMethod	#tag Property, Flags = &h0		Prefs As NSUserDefaultsMBS	#tag EndProperty	#tag Constant, Name = SystemLanguage, Type = String, Dynamic = True, Default = \"en", Scope = Public		#Tag Instance, Platform = Any, Language = en, Definition  = \"en"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"nl"		#Tag Instance, Platform = Any, Language = da, Definition  = \"da"		#Tag Instance, Platform = Any, Language = fi, Definition  = \"fi"		#Tag Instance, Platform = Any, Language = de, Definition  = \"de"		#Tag Instance, Platform = Any, Language = it, Definition  = \"it"		#Tag Instance, Platform = Any, Language = es, Definition  = \"es"		#Tag Instance, Platform = Any, Language = fr, Definition  = \"fr"		#Tag Instance, Platform = Any, Language = pl, Definition  = \"pl"		#Tag Instance, Platform = Any, Language = hu, Definition  = \"hu"		#Tag Instance, Platform = Any, Language = el, Definition  = \"el"		#Tag Instance, Platform = Any, Language = tr, Definition  = \"tr"		#Tag Instance, Platform = Any, Language = ru, Definition  = \"ru"		#Tag Instance, Platform = Any, Language = he, Definition  = \"he"		#Tag Instance, Platform = Any, Language = ja, Definition  = \"ja"		#Tag Instance, Platform = Any, Language = pt, Definition  = \"pt"		#Tag Instance, Platform = Any, Language = zh_TW, Definition  = \"zh"		#Tag Instance, Platform = Any, Language = cs, Definition  = \"cs"		#Tag Instance, Platform = Any, Language = sk, Definition  = \"sl"		#Tag Instance, Platform = Any, Language = hr, Definition  = \"hr"		#Tag Instance, Platform = Any, Language = ko, Definition  = \"ko"		#Tag Instance, Platform = Any, Language = no, Definition  = \"no"	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule