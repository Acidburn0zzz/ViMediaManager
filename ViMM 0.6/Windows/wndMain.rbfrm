#tag WindowBegin Window wndMain   BackColor       =   &hFFFFFF   Backdrop        =   ""   CloseButton     =   True   Composite       =   False   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   600   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   True   MaxWidth        =   32000   MenuBar         =   343001748   MenuBarVisible  =   True   MinHeight       =   500   MinimizeButton  =   True   MinWidth        =   780   Placement       =   2   Resizeable      =   True   Title           =   "#App.kAppName"   Visible         =   True   Width           =   900   Begin PagePanel ppMain      AutoDeactivate  =   True      Enabled         =   True      Height          =   600      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   0      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      PanelCount      =   3      Panels          =   ""      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      Top             =   0      Value           =   0      Visible         =   True      Width           =   900      Begin ListMovies lstMovies         AutoDeactivate  =   True         AutoHideScrollbars=   True         Bold            =   ""         Border          =   True         ColumnCount     =   15         ColumnsResizable=   ""         ColumnWidths    =   "100%, 0"         DataField       =   ""         DataSource      =   ""         DefaultRowHeight=   42         Enabled         =   True         EnableDrag      =   False         EnableDragReorder=   ""         GridLinesHorizontal=   0         GridLinesVertical=   0         HasHeading      =   False         HeadingIndex    =   -1         Height          =   578         HelpTag         =   ""         Hierarchical    =   False         Index           =   -2147483648         InitialParent   =   "ppMain"         InitialValue    =   ""         Italic          =   ""         LastKeyPressedAt=   ""         Left            =   -1         LockBottom      =   True         LockedInPosition=   False         LockLeft        =   True         LockRight       =   ""         LockTop         =   True         RequiresSelection=   True         Scope           =   0         ScrollbarHorizontal=   ""         ScrollBarVertical=   True         SelectionType   =   0         TabIndex        =   0         TabPanelIndex   =   1         TabStop         =   True         TextFont        =   "System"         TextSize        =   11         TextUnit        =   0         Top             =   -1         Underline       =   ""         UseFocusRing    =   False         Visible         =   True         Width           =   300         _ScrollWidth    =   -1      End      Begin ActionBar ActBar         AcceptFocus     =   ""         AcceptTabs      =   ""         AutoDeactivate  =   True         Backdrop        =   ""         DoubleBuffer    =   False         Enabled         =   True         EraseBackground =   True         Height          =   25         HelpTag         =   ""         Index           =   0         InitialParent   =   "ppMain"         Left            =   -1         LockBottom      =   True         LockedInPosition=   False         LockLeft        =   True         LockRight       =   ""         LockTop         =   False         MinLeft         =   150         MinRight        =   50         Scope           =   0         TabIndex        =   1         TabPanelIndex   =   1         TabStop         =   True         Text            =   "## Items"         Top             =   576         UseFocusRing    =   True         Visible         =   True         Width           =   300      End      Begin MetaInfoCanvas cvsMovies         AcceptFocus     =   ""         AcceptTabs      =   ""         AutoDeactivate  =   True         Backdrop        =   ""         DoubleBuffer    =   False         Enabled         =   True         EraseBackground =   False         Height          =   576         HelpTag         =   ""         Index           =   -2147483648         InitialParent   =   "ppMain"         Left            =   299         LockBottom      =   True         LockedInPosition=   False         LockLeft        =   True         LockRight       =   True         LockTop         =   True         Scope           =   0         TabIndex        =   2         TabPanelIndex   =   1         TabStop         =   True         Top             =   0         UseFocusRing    =   True         Visible         =   True         Width           =   601         Begin PushButton btnTest            AutoDeactivate  =   True            Bold            =   ""            ButtonStyle     =   0            Cancel          =   ""            Caption         =   "Test This!"            Default         =   ""            Enabled         =   True            Height          =   20            HelpTag         =   ""            Index           =   -2147483648            InitialParent   =   "cvsMovies"            Italic          =   ""            Left            =   800            LockBottom      =   True            LockedInPosition=   False            LockLeft        =   False            LockRight       =   True            LockTop         =   False            Scope           =   0            TabIndex        =   0            TabPanelIndex   =   1            TabStop         =   True            TextFont        =   "System"            TextSize        =   0            TextUnit        =   0            Top             =   544            Underline       =   ""            Visible         =   True            Width           =   80         End      End      Begin ListboxPRO lstTVShows         AlternatingRows =   True         AutoDeactivate  =   True         AutoHideScrollbars=   True         Bold            =   ""         Border          =   True         ColumnCount     =   1         ColumnsResizable=   ""         ColumnWidths    =   ""         DataField       =   ""         DataSource      =   ""         DefaultRowHeight=   22         Enabled         =   True         EnableDrag      =   ""         EnableDragReorder=   ""         GridLinesHorizontal=   0         GridLinesVertical=   0         HasHeading      =   ""         HeadingIndex    =   -1         Height          =   100         HelpTag         =   ""         Hierarchical    =   ""         Index           =   -2147483648         InitialParent   =   "ppMain"         InitialValue    =   ""         Italic          =   ""         Left            =   44         LockBottom      =   ""         LockedInPosition=   False         LockLeft        =   True         LockRight       =   ""         LockTop         =   True         RequiresSelection=   ""         Scope           =   0         ScrollbarHorizontal=   ""         ScrollBarVertical=   True         SelectionGradient=   True         SelectionType   =   0         SourceList      =   False         TabIndex        =   0         TabPanelIndex   =   2         TabStop         =   True         TextFont        =   "System"         TextSize        =   0         TextUnit        =   0         Top             =   235         Underline       =   ""         UseFocusRing    =   True         Visible         =   True         Width           =   100         _ScrollWidth    =   -1      End   End   Begin ToolMain MainTB      Enabled         =   True      Height          =   61      Index           =   -2147483648      InitialParent   =   ""      Left            =   -1      LockedInPosition=   False      Scope           =   0      TabPanelIndex   =   0      Top             =   624      Visible         =   True      Width           =   1103   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Close()		  Preferences.SaveWindowPos( Self, "wndMain" )		  		  Quit		End Sub	#tag EndEvent	#tag Event		Sub Open()		  If Prefs.boolForKey("SplashShown") = False then		    wndSplash.Show		    prefs.boolForKey("SplashShown") = True		  End If		  		  Preferences.LoadWindowPos( Self, "wndMain" )		End Sub	#tag EndEvent	#tag Event		Sub Resized()		  cvsMovies.Width = Me.Width - ActBar(0).Width + 1		End Sub	#tag EndEvent	#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Self.Close			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileFetchMetadata() As Boolean Handles FileFetchMetadata.Action			If ppMain.Value = 0 then CommonActions( "FetchMetadata", lstMovies )			// If ppMain.Value = 1 then CommonActions( "FetchMetadata", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileFetchMetadataforallMedia() As Boolean Handles FileFetchMetadataforallMedia.Action			If ppMain.Value = 0 then CommonActions( "FetchMissingMetadata", lstMovies )			// If ppMain.Value = 1 then CommonActions( "FetchMissingMetadata", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileManualSearch() As Boolean Handles FileManualSearch.Action			If ppMain.Value = 0 Then			CommonActions( "ManualSearch", lstMovies )			ElseIf ppMain.Value = 1 Then			CommonActions( "ManualSearch", lstTVShows )			End If			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileOpenInFinder() As Boolean Handles FileOpenInFinder.Action			If ppMain.Value = 0 then CommonActions( "Reveal", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileReload() As Boolean Handles FileReload.Action			CommonActions "ReloadList"			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileUpdateMetadata() As Boolean Handles FileUpdateMetadata.Action			CommonActions( "UpdateMetadata" )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function MenuViewHideToolbar() As Boolean Handles MenuViewHideToolbar.Action			MainTB.Visible = NOT MainTB.Visible			If MainTB.Visible then MenuViewHideToolbar.Text = Menu.ViewHideToolbar else MenuViewHideToolbar.Text = Menu.ViewShowToolbar						Prefs.boolForKey("MainToolbarVisible") = MainTB.Visible			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function MenuViewMovies() As Boolean Handles MenuViewMovies.Action			SwitchPanels 0			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsBatchRenaming() As Boolean Handles ToolsBatchRenaming.Action			Select Case ppMain.Value						Case 0			BatchRenamer( lstMovies )						End Select						Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsClean() As Boolean Handles ToolsClean.Action			CommonActions "Clean"			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsExtraArtFanart(index as Integer) As Boolean Handles ToolsExtraArtFanart.Action			CommonActions( "GetFanart" )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsExtraArtPoster(index as Integer) As Boolean Handles ToolsExtraArtPoster.Action			CommonActions( "GetPoster" )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsExtraArtThumbs() As Boolean Handles ToolsExtraArtThumbs.Action			CommonActions( "GetExtraThumbs" )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsExtraTrailer() As Boolean Handles ToolsExtraTrailer.Action			CommonActions( "GetTrailer" )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsMovies2Folders() As Boolean Handles ToolsMovies2Folders.Action			If ppMain.Value = 0 then MassMovies2Folders( lstMovies )			Return True		End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsSetsmanager() As Boolean Handles ToolsSetsmanager.Action			wndSetManager2.Show			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewEditMetadata() As Boolean Handles ViewEditMetadata.Action			If ppMain.Value = 0 then CommonActions( "EditInfo", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByMovieSortTitle() As Boolean Handles ViewSortByMovieSortTitle.Action			CommonActions( "MovieSortTitle", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByMovieTitle() As Boolean Handles ViewSortByMovieTitle.Action			CommonActions( "MovieTitle", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByNextAired() As Boolean Handles ViewSortByNextAired.Action			CommonActions( "NextAired", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByPath(index as Integer) As Boolean Handles ViewSortByPath.Action			If ppMain.Value = 0 Then			CommonActions( "Path", lstMovies )			MsgBox "Test 1"			ElseIf ppMain.Value = 1 Then			CommonActions( "Path", lstTVShows )			MsgBox "Test 2"			End If			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByPremiereDate() As Boolean Handles ViewSortByPremiereDate.Action			CommonActions( "PremiereDate", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByQuality() As Boolean Handles ViewSortByQuality.Action			CommonActions( "Quality", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByRating(index as Integer) As Boolean Handles ViewSortByRating.Action			If ppMain.Value = 0 Then			CommonActions( "Rating", lstMovies )			ElseIf ppMain.Value = 1 Then			CommonActions( "Rating", lstTVShows )			End If			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByStudio() As Boolean Handles ViewSortByStudio.Action			If ppMain.Value = 0 Then			CommonActions( "Studio", lstMovies )			ElseIf ppMain.Value = 1 Then			CommonActions( "Studio", lstTVShows )			End If			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByTVShowSortTitle() As Boolean Handles ViewSortByTVShowSortTitle.Action			CommonActions( "ShowSortTitle", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByTVShowTitle() As Boolean Handles ViewSortByTVShowTitle.Action			CommonActions( "ShowTitle", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewSortByWatchedStatus() As Boolean Handles ViewSortByWatchedStatus.Action			CommonActions( "WatchedStatus", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function WindowMinimize() As Boolean Handles WindowMinimize.Action			Minimize			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function WindowZoom() As Boolean Handles WindowZoom.Action			Maximize			Return True					End Function	#tag EndMenuHandler	#tag Method, Flags = &h0		Sub CommonActions(HitItem as String, LstBox as Listbox = Nil)		  Dim f as FolderItem		  Dim SectionName as String		  		  If LstBox = Nil Then		    If ppMain.Value = 0 Then		      LstBox = lstMovies		      SectionName = Localizable.Movies		    ElseIf ppMain.Value = 1 Then		      'LstBox = lstTVShows		      SectionName = Localizable.TVShows		    ElseIf ppMain.Value = 2 Then		      'LstBox = lstAnime		      SectionName = Localizable.Anime		    End If		    		  End If		  		  Select Case HitItem		    		  case "ReloadList"		    If LstBox = lstMovies Then lstMovies.CreateList		    'If LstBox = lstTVShows Then lstTVShows.CreateList		    'If LstBox = lstAnime Then lstAnime.CreateList		    ActBar( ppMain.Value ).Text = Str( LstBox.ListCount ) + " " + SectionName		    ActBar( ppMain.Value ).Invalidate		    		  case "SortList"		    If LstBox = lstMovies then lstMovies.SortList		    		  case "MarkAsWatched"		    If LstBox = lstMovies Then		      MovieAttr.StatusWatched = NOT MovieAttr.StatusWatched		      If LstBox.ListIndex > -1 then f = GetFolderItem( LstBox.Cell( LstBox.ListIndex, 1 ) )		      If f <> Nil and f.Exists then MovieAttr.NFOWrite( MovieAttr.DestinationNFO( f ) )		      lstMovies.UpdateRow		    End If		    		  case "FetchMissingMetadata"		    // TODO		    // If LstBox = lstMovies then Scrape.AllMovies		    Dim UnScrapedItems as Integer = 0		    For i as Integer = 0 to LstBox.ListCount - 1		      If LstBox.Cell(i, 2) = "" Then UnScrapedItems = UnScrapedItems + 1		    Next		    		    If LstBox = lstMovies then dlgProgress.Start( Localizable.kSearching + ":", Localizable.Movies + "...", UnScrapedItems, "AllMovies")		    		  case "FetchMetadata"		    If LstBox = lstMovies then		      // If MovieName <> "" then Scrape.TMDBApiSearch( MovieName ) Else Scrape.TMDBApiSearch( lstMovies.Cell( lstMovies.ListIndex, 0 ) )		      dlgProgress.Start( Localizable.kSearching + ":", FindMovieName( MovieAttr.FolderParent, True, True ), 10, "SelectedMovie" )		    End If		    		  case "UpdateMetadata"		    Dim ScrapedItems as Integer = 0		    For i as Integer = 0 to LstBox.ListCount - 1		      If LstBox.Cell(i, 2) <> "" Then ScrapedItems = ScrapedItems + 1		    Next		    		    // Does the user really want to update? which parts will be updated:		    If LstBox = lstMovies And _		      MsgDlg( Self, 1, Localizable.msgUpdate.ReplaceAll("%F", Localizable.Movies.Lowercase), Localizable.msgWhatWillBeUpdated.ReplaceAll("%F", Localizable.Movies.Lowercase ), Localizable.dlgCancel, Localizable.btnContinue ) = 2 Then		      		      dlgProgress.Start( Localizable.kUpdating + ":", Localizable.Movies + "...", ScrapedItems, "UpdateMovies" )		      		      'ElseIf LstBox = lstTVShows And _		      'MsgDlg( Self, 1, Localizable.msgUpdate.ReplaceAll("%F", Localizable.TVShows.Lowercase), Localizable.msgWhatWillBeUpdated.ReplaceAll("%F", Localizable.TVShows.Lowercase ), Localizable.dlgCancel, Localizable.btnContinue ) = 2 Then		      		      'ElseIf LstBox = lstAnime And _		      'MsgDlg( Self, 1, Localizable.msgUpdate.ReplaceAll("%F", Localizable.Anime.Lowercase), Localizable.msgWhatWillBeUpdated.ReplaceAll("%F", Localizable.Anime.Lowercase ), Localizable.dlgCancel, Localizable.btnContinue ) = 2 Then		      		    End If		    		  case "ManualSearch"		    If LstBox = lstMovies then		      Dim MovieName as String = FindMovieName( MovieAttr.FolderParent, True )		      wndSearchMovie.Show		      If MovieName <> "" then wndSearchMovie.edtSearch.Text = MovieName Else wndSearchMovie.edtSearch.Text = lstMovies.Cell( lstMovies.ListIndex, 0 )		    End If		    		  case "EditInfo"		    If LstBox = lstMovies then		      wndMetadataMovie.Show		    ElseIf LstBox = lstTVShows Then		      // TODO		    End If		    		  case "Clean"		    wndClean.Show		    		  case "Reveal"		    If LstBox.ListIndex > -1 then f = GetFolderItem( LstBox.Cell( LstBox.ListIndex, 1 ) )		    'If f <> Nil and f.Exists then f.Launch		    ShowInFinder( f )		    		  case "DeleteItem"		    If LstBox = lstMovies And LstBox.ListIndex > -1 Then lstMovies.DeleteItem Else MsgBox Localizable.kNothingToDelete		    		  case "Trailer"		    If LstBox = lstMovies then f = FindTrailerItem( MovieAttr.FolderParent )		    If f <> Nil and f.Exists then f.Launch		    		  case "GetTrailer"		    If LstBox = lstMovies And MovieAttr.ID_TMDB <> "" Then dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kTrailer + "...", 0, "GetTrailer" ) Else MsgBox Localizable.msgNoTrailer		    		    // Extra Art		    // TODO		  case "GetPoster"		    If LstBox = lstMovies then		      dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetMoviePoster" )		      		      // ElseIf LstBox = lstTVShows then		      'dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetTVPoster" )		      // ElseIf LstBox = lstAnime then		      'dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetAnimePoster" )		    End If		    		    		  case "GetFanart"		    If LstBox = lstMovies then		      dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetMovieFanart" )		      		      // ElseIf LstBox = lstTVShows then		      'dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetTVFanart" )		      // ElseIf LstBox = lstAnime then		      'dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetAnimeFanart" )		    End If		    		    		  case "GetExtraThumbs"		    If LstBox = lstMovies then		      dlgProgress.Start( Localizable.kDownloading + ":", "ExtraThumbs", 0, "GetMovieExtrathumbs")		      		      // ElseIf LstBox = lstTVShows then		      'dlgProgress.Start( Localizable.kDownloading + ":", "ExtraThumbs", 0, "GetTVExtrathumbs")		      // ElseIf LstBox = lstAnime then		      'dlgProgress.Start( Localizable.kDownloading + ":", "ExtraThumbs", 0, "GetAnimeExtrathumbs")		    End If		    		    // TV Art		  case "GetBanner"		  case "GetClearArt"		  case "GetCharacterArt"		  case "GetLogo"		  case "GetTVThumb"		    		    		  case "ShowIMDBListing"		    If MovieAttr.ID_IMDB <> "" Then ShowURL( "http://www.imdb.com/title/" + MovieAttr.ID_IMDB )		    		  case "ShowTMDBListing"		    If MovieAttr.ID_TMDB <> "" Then ShowURL( "http://www.themoviedb.org/movie/" + MovieAttr.ID_TMDB )		    		  case "ShowWikiEntry"		    ShowURL( "http://" + Prefs.textStringForKey("DBLanguage") + ".wikipedia.org/wiki/" + MovieAttr.Title.ReplaceAll( " ", "_" ) + "_(film)" )		    		  case "SearchGoogle"		    If MovieAttr.Title <> "" and MovieAttr.DateYear > -1 Then ShowURL( "http://www.google.com/search?q=" + MovieAttr.Title + " (" + str(MovieAttr.DateYear) + ")" )		    		  End Select		  		  		  		  		  // Sort By		  Select Case HitItem		    		  case "MovieTitle"		    Prefs.integerForKey("SortByMovie") = 0		    If ppMain.Value = 0 Then lstMovies.SortList		    		  case "MovieSortTitle"		    Prefs.integerForKey("SortByMovie") = 1		    If ppMain.Value = 0 Then lstMovies.SortList		    		  case "Path"		    If ppMain.Value = 0 Then		      Prefs.integerForKey("SortByMovie") = 2		      lstMovies.SortList		    ElseIf ppMain.Value = 1 Then		      Prefs.integerForKey("SortByTV") = 2		      'lstTVShows.SortList		    End If		    		  case "WatchedStatus"		    Prefs.integerForKey("SortByMovie") = 3		    If ppMain.Value = 0 Then lstMovies.SortList		    		  case "PremiereDate"		    Prefs.integerForKey("SortByMovie") = 4		    If ppMain.Value = 0 Then lstMovies.SortList		    		  case "Quality"		    Prefs.integerForKey("SortByMovie") = 5		    If ppMain.Value = 0 Then lstMovies.SortList		    		  case "Rating"		    Prefs.integerForKey("SortByMovie") = 6		    If ppMain.Value = 0 Then lstMovies.SortList		    		  case "Studio"		    Prefs.integerForKey("SortByMovie") = 10		    If ppMain.Value = 0 Then lstMovies.SortList		    		    // TV Show		  case "ShowTitle"		    Prefs.integerForKey("SortByTV") = 0		    'lstTVShows.SortList		    		  case "ShowSortTitle"		    Prefs.integerForKey("SortByTV") = 1		    'lstTVShows.SortList		    		  case "NextAired"		    Prefs.integerForKey("SortByTV") = 3		    'lstTVShows.SortList		    		  End Select		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub MenuConstructor(Base as MenuItem, LstBox as listbox)		  Dim miSeperator as new MenuItem ( "-" )		  		  Dim miReload         as new MenuItem ( Localizable.Refresh )         // Reload List		  Dim miSort           as new MenuItem ( Menu.CMMSortList )        // Sort List		  Dim miMarkAsWatched  as new MenuItem ( Menu.CMMMarkAsWatched )   // Mark as Watched		  Dim miScrape         as new MenuItem ( Localizable.FetchMetadata )  // Fetch Metadata		  Dim miManualSearch   as new MenuItem ( Menu.FileManualSearch )   // Manual Search...		  Dim miEditInfo       as new MenuItem ( Menu.ViewEditMetadata )   // Edit Metadata		  Dim miClean          as new MenuItem ( Localizable.Clean + "..." )       // Clean...		  Dim miReveal         as new MenuItem ( Menu.FileShowInFinder )   // Show in Finder		  Dim miTrailer        as new MenuItem ( Menu.CMMWatchTrailer )    // Watch Trailer		  		  // ---- Search Web > Subs ---- //		  Dim miSearchWeb as new MenuItem( Menu.CMMSearchTheWeb )		  Dim miShowTMDB  as new MenuItem( Localizable.urlTMDBListing )		  Dim miShowIMDB  as new MenuItem( Localizable.urlIMDBListing )		  Dim miShowWiki  as new MenuItem( Localizable.urlWIKIListing )		  Dim miSearchGoogle as new MenuItem( Localizable.urlGoogleListing )		  		  miSearchWeb.Name = "SearchTheWeb"		  miShowTMDB.Name = "ShowTMDBListing"		  miShowIMDB.Name = "ShowIMDBListing"		  miShowWiki.Name = "ShowWikiEntry"		  miSearchGoogle.Name = "SearchGoogle"		  		  miSearchWeb.Append miShowIMDB		  miSearchWeb.Append miShowTMDB		  miSearchWeb.Append miSearchGoogle		  miSearchWeb.Append miShowWiki		  miSearchWeb.Append miSeperator		  // ---- @END Search Web ---- //		  		  miReload.Name        = "ReloadList"		  miSort.Name          = "SortList"		  miMarkAsWatched.Name = "MarkAsWatched"		  miScrape.Name        = "FetchMetadata"		  miManualSearch.Name  = "ManualSearch"		  miEditInfo.Name      = "EditInfo"		  miClean.Name         = "Clean"		  miReveal.Name        = "Reveal"		  miTrailer.Name       = "Trailer"		  		  Dim miDeleteMovie    as new MenuItem ( Menu.CMMRemoveMovie )     // Remove Movie...		  Dim miDeleteTV       as new MenuItem ( Menu.CMMRemoveTVShow )    // Remove TV Show...		  Dim miDeleteAnime    as new MenuItem ( Menu.CMMRemoveAnime )     // Remove Anime...		  		  miDeleteMovie.Name = "DeleteItem"		  miDeleteTV.Name    = "DeleteItem"		  miDeleteAnime.Name = "DeleteItem"		  		  // Mark as Watched		  'If LstBox = lstMovies and MovieAttr.StatusWatched = True then miMarkAsWatched.Text = Menu.CMMMarkAsUnwatched		  'If LstBox = lstMovies and LstBox.Cell( LstBox.ListIndex, 2 ) = "" then miMarkAsWatched.Enabled = False		  'If LstBox = lstMovies and FindTrailerItem( MovieAttr.FolderParent ) = Nil then miTrailer.Enabled = False		  		  If LstBox = lstMovies then		    If MovieAttr.StatusWatched = True then miMarkAsWatched.Text = Menu.CMMMarkAsUnwatched		    miMarkAsWatched.Enabled = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )		    miTrailer.Enabled = ( FindTrailerItem( MovieAttr.FolderParent ) <> Nil )		  End If		  		  // Build Menu		  base.Append miReload                                       // | Reload List		  If LstBox.ListIndex <> -1 then		    base.Append MenuSortBy( LstBox )                         // | Sort By (>)		    base.Append miSeperator                                  // | -------		    If LstBox = lstMovies then base.Append miMarkAsWatched   // | Mark as Watched		    base.Append miScrape                                     // | Fetch Metadata		    base.Append miManualSearch                               // | Manual Search		    base.Append miEditInfo                                   // | Edit Metadata		    base.Append miSeperator                                  // | -------		    base.Append miSearchWeb                             // | Search the Internet (>)		    base.Append MenuExtraArt( LstBox )                       // | Extra Art (>)		    base.Append miClean                                      // | Clean...		    base.Append miSeperator                                  // | -------		    base.Append miReveal                                     // | Open in Finder		    If LstBox = lstMovies then base.Append miTrailer         // | Watch Trailer		    If LstBox = lstMovies then base.Append miDeleteMovie     // | Delete Movie		    // If LstBox = lstTVShows then base.Append miDeleteTV      // | Delete TV Show		    // If LstBox = lstAnime then base.Append miDeleteAnime     // | Delete Anime		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function MenuExtraArt(LstBox as Listbox) As MenuItem		  Dim miExtraArt as new MenuItem ( Menu.ToolsExtras ) // Extra Arts		  Dim miSeperator as new MenuItem ( "-" )		  		  Dim miDownloadPoster as new MenuItem ( Localizable.ToolsExtraArtGetPoster ) // Download Poster...		  Dim miDownloadFanart as new MenuItem ( Localizable.ToolsExtraArtGetFanart ) // Download Fanart...		  Dim miDownloadExtraThumbs as new MenuItem ( Localizable.ToolsExtraArtGetExtraThumbs )  // Download ExtraThumbs		  Dim miDownloadBanner as new MenuItem ( Localizable.ToolsExtraArtGetBanner ) // Download Banner...		  Dim miDownloadTrailer as new MenuItem( Localizable.ToolsExtraTrailer ) // Download Trailer...		  		  miDownloadPoster.Name      = "GetPoster"		  miDownloadFanart.Name      = "GetFanart"		  miDownloadExtraThumbs.Name = "GetExtraThumbs"		  miDownloadBanner.Name      = "GetBanner"		  miDownloadTrailer.Name     = "GetTrailer"		  		  'miDownloadTrailer.Enabled = False		  		  Dim miDownloadClearArt     as new MenuItem ( Localizable.ToolsExtraArtGetClearArt )     // Download ClearArt...		  Dim miDownloadCharacterArt as new MenuItem ( Localizable.ToolsExtraArtGetCharacterArt ) // Download Character Art...		  Dim miDownloadLogo         as new MenuItem ( Localizable.ToolsExtraArtGetLogo )         // Download Logo...		  Dim miDownloadTVThumb      as new MenuItem ( Localizable.ToolsExtraArtGetTVThumb )      // Download TV Thumb...		  		  miDownloadClearArt.Name     = "GetClearArt"		  miDownloadCharacterArt.Name = "GetCharacterArt"		  miDownloadLogo.Name         = "GetLogo"		  miDownloadTVThumb.Name      = "GetTVThumb"		  		  // Build Menu		  miExtraArt.Append miDownloadPoster		  miExtraArt.Append miDownloadFanart		  		  If LstBox = lstMovies then		    miExtraArt.Append miSeperator		    miExtraArt.Append miDownloadExtraThumbs		    miExtraArt.Append miDownloadTrailer		  Else		    miExtraArt.Append miDownloadBanner		    		    miExtraArt.Append miSeperator		    		    miExtraArt.Append miDownloadClearArt		    miExtraArt.Append miDownloadCharacterArt		    miExtraArt.Append miDownloadLogo		    miExtraArt.Append miDownloadTVThumb		  End If		  		  Return miExtraArt		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function MenuSortBy(LstBox as Listbox) As MenuItem		  Dim miSortBy    as New MenuItem ( Menu.CMMSortList )		  Dim miSeperator as New MenuItem ( "-" )		  		  // Movie		  Dim miMovieTitle     as New MenuItem ( Menu.ViewSortByMovieTitle )		  Dim miMovieSortTitle as New MenuItem ( Menu.ViewSortByMovieSortTitel )		  		  miMovieTitle.Name     = "MovieTitle"		  miMovieSortTitle.Name = "MovieSortTitle"		  		  Dim miPath          as New MenuItem ( Menu.ViewSortByPath )		  Dim miWatchedStatus as New MenuItem ( Menu.ViewSortByWatchedStatus )		  Dim miPremiereDate  as New MenuItem ( Menu.ViewSortByPremiereDate )		  Dim miQuality       as New MenuItem ( Menu.ViewSortByQuality )		  		  miPath.Name          = "Path"		  miWatchedStatus.Name = "WatchedStatus"		  miPremiereDate.Name  = "PremiereDate"		  miQuality.Name       = "Quality"		  		  // TV		  Dim miShowTitle     as New MenuItem( Menu.ViewSortByTVShowTitle )		  Dim miShowSortTitle as New MenuItem( Menu.ViewSortByTVShowSortTitle )		  Dim miNextAired     as New MenuItem( Menu.ViewSortByNextAired )		  		  miShowTitle.Name     = "ShowTitle"		  miShowSortTitle.Name = "ShowSortTitle"		  miNextAired.Name     = "NextAired"		  		  // Global		  Dim miRating        as New MenuItem ( Menu.ViewSortByRating )		  Dim miStudio        as New MenuItem ( Menu.ViewSortByStudio )		  		  miRating.Name        = "Rating"		  miQuality.Name       = "Studio"		  		  		  If LstBox = lstMovies Then		    		    miSortBy.Append miMovieTitle		    miSortBy.Append miMovieSortTitle		    		    miSortBy.Append miSeperator		    		    miSortBy.Append miPath		    miSortBy.Append miWatchedStatus		    miSortBy.Append miPremiereDate		    miSortBy.Append miQuality		    miSortBy.Append miStudio		    		    // ElseIf LstBox = lstTVShows then		  End If		  		  Return miSortBy		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub SwitchPanels(Index as Integer)		  ToolButton( MainTB.Item( Index ) ).Pushed = True		  ppMain.Value = Index		  		  If Index = 0 then		    ToolsMovies2Folders.Enabled = True		    		  ElseIf Index = 1 then		    ToolsMovies2Folders.Enabled = False		    		  ElseIf Index = 2 then		    ToolsMovies2Folders.Enabled = False		    		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateRow()		  If ppMain.Value = 0 then		    lstMovies.UpdateRow		    		  ElseIf ppMain.Value = 1 then		    		  ElseIf ppMain.Value = 2 then		    		  End If		End Sub	#tag EndMethod	#tag Property, Flags = &h0		tbItemMovieSets As ToolItem	#tag EndProperty#tag EndWindowCode#tag Events ppMain	#tag Event		Sub Change()		  ToolsSetsmanager.Visible     = ( Me.Value = 0 ) // Sets Manager		  MenuViewSortByMovie.Visible  = ( Me.Value = 0 ) // Sort by Movies		  MenuToolsExtraDownloadsMovies.Visible = ( Me.Value = 0 ) // Download Movie Extras		  		  MenuViewSortByTVShow.Visible = ( Me.Value = 1 ) // Sort by TV Shows		  MenuToolsExtraDownloadsShows.Visible = ( Me.Value = 1 ) // Download Show Extras		  		  For i as Integer = 0 to MainTB.Count - 1		    If MainTB.Item(i).Name = "MovieSets" Then MainTB.Item(i).Enabled = ( Me.Value = 0 )		  Next		  		  Prefs.setIntegerValue( "wndMainTab", Me.Value )		End Sub	#tag EndEvent	#tag Event		Sub Open()		  Me.Value = Prefs.integerForKey("wndMainTab")		  		  'ToolsSetsmanager.Visible     = ( Me.Value = 0 ) // Sets Manager		  'MenuViewSortByMovie.Visible  = ( Me.Value = 0 ) // Sort by Movies		  'MenuToolsExtraDownloadsMovies.Visible = ( Me.Value = 0 ) // Download Movie Extras		  '		  'MenuViewSortByTVShow.Visible = ( Me.Value = 1 ) // Sort by TV Shows		  'MenuToolsExtraDownloadsShows.Visible = ( Me.Value = 1 ) // Download Show Extras		  '		  'For i as Integer = 0 to MainTB.Count - 1		  'If MainTB.Item(i).Name = "MovieSets" Then MainTB.Item(i).Enabled = ( Me.Value = 0 )		  'Next		End Sub	#tag EndEvent#tag EndEvents#tag Events lstMovies	#tag Event		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean		  MenuConstructor base, Me		  Return True		End Function	#tag EndEvent	#tag Event		Function ContextualMenuAction(hitItem as MenuItem) As Boolean		  CommonActions hitItem.Name, Me		End Function	#tag EndEvent	#tag Event		Sub DoubleClick()		  If Me.Cell( Me.ListIndex, 2 ) = "" then CommonActions( "FetchMetadata", Me ) Else CommonActions( "EditInfo", Me )		End Sub	#tag EndEvent#tag EndEvents#tag Events ActBar	#tag Event		Sub Open(index as Integer)		  me.ClearAttachments		  		  Select case index		  case 0		    me.AttachLeft lstMovies		    me.AttachRight cvsMovies		    		  case 1		    		  case 2		    		  End Select		End Sub	#tag EndEvent	#tag Event		Sub Moved(index as Integer, Distance as Integer)		  Select case index		  case 0		    Prefs.integerForKey("NSMoviesSidebarWidth")  = me.Width		  case 1		    Prefs.integerForKey("NSTVShowsSidebarWidth") = me.Width		  case 2		    Prefs.integerForKey("NSAnimeSidebarWidth")   = me.Width		  End Select		End Sub	#tag EndEvent	#tag Event		Sub ActionMenu(index as Integer)		  If me.Index = 0 then		    Dim base as New MenuItem		    MenuConstructor base, lstMovies		    Dim HitItem as MenuItem = base.PopUp		    If HitItem <> Nil then CommonActions( HitItem.Name, lstMovies )		  End If		End Sub	#tag EndEvent	#tag Event		Sub ActionMinus(index as Integer)		  If me.Index = 0 then		    CommonActions "DeleteItem", lstMovies		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events cvsMovies	#tag Event		Sub Open()		  Me.Height = Height		  cvsMovies.Width = Width - Prefs.integerForKey("NSMoviesSidebarWidth") + 1		End Sub	#tag EndEvent	#tag Event		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean		  MenuConstructor base, lstMovies		End Function	#tag EndEvent	#tag Event		Function ContextualMenuAction(hitItem as MenuItem) As Boolean		  CommonActions hitItem.Name, lstMovies		End Function	#tag EndEvent#tag EndEvents#tag Events btnTest	#tag Event		Sub Open()		  Me.Visible = DebugBuild		End Sub	#tag EndEvent	#tag Event		Sub Action()		  If NOT Growl.Notify( App.kAppName, "Testing, Testing, 1.. 2.. 3.." ) Then		    // MsgBox "Growling!"		  Else		    // MsgBox "Not Growling!"		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events MainTB	#tag Event		Sub Action(item As ToolItem)		  		  Select Case item.Name		    		  Case "Movies"		    SwitchPanels 0		    'ViewMenu.Append MenuSortBy( lstMovies )		    		  Case "TVShows"		    SwitchPanels 1		    		  Case "Anime"		    SwitchPanels 2		    		    ' ----------------		  Case "ScrapeInfoAll"		    If ppMain.Value = 0 then CommonActions( "FetchMissingMetadata", lstMovies )		    		  Case "ScrapeInfo"		    If ppMain.Value = 0 then CommonActions( "FetchMetadata", lstMovies )		    		  Case "ManualSearch"		    If ppMain.Value = 0 then CommonActions( "ManualSearch", lstMovies )		    		  Case "ExtraArt"		    Dim HitItem as MenuItem = MenuExtraArt( lstMovies ).PopUp		    If HitItem <> Nil then CommonActions( HitItem.Name, lstMovies )		    		    ' ----------------		  Case "EditMetadata"		    If ppMain.Value = 0 then CommonActions( "EditInfo", lstMovies )		    		  Case "RefreshList"		    CommonActions( "ReloadList" )		    		  Case "Clean"		    CommonActions( "Clean" )		    		  Case "MovieSets"		    wndSetManager.Show		    		    		    ' ----------------		  Case "Donate"		    ShowURL App.DonationURL		    		  End Select		End Sub	#tag EndEvent	#tag Event		Sub Open()		  MainTB.Visible = Prefs.boolForKey("MainToolbarVisible")		  If MainTB.Visible Then MenuViewHideToolbar.Text = Menu.ViewHideToolbar Else MenuViewHideToolbar.Text = Menu.ViewShowToolbar		  		  Me.Item(1).Enabled = DebugBuild		  ToolButton( MainTB.Item( Prefs.integerForKey("wndMainTab") ) ).Pushed = True		End Sub	#tag EndEvent#tag EndEvents