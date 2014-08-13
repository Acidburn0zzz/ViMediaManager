#tag ClassProtected Class TMDBInherits HTTPSocket	#tag Event		Sub Error(code as integer)		  SocketError( code, Me )		  		Exception err as NilObjectException		  Me.Close		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub GetArt(XmlContent as String, Mode as String)		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim ArtIndex as Integer = -1		  Dim sckt as new HTTPSocket		  Dim f as FolderItem = MovieAttr.FolderParent.Child("extrathumbs")		  sckt.Yield = True		  Scrape.ClearArts		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).Child(2).FirstChild		  		  If xroot.FirstChild <> Nil and xroot.Value = "Nothing Found." then		    MsgBox Scrape.kNoImagesFound.ReplaceAll( "%s", Mode )		    Return		  End If		  		  xroot = xroot.Child(2)		  		  For i as Integer = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    If Mode = "Poster" and xnode.Name = "Poster" then		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If Prefs.integerForKey("DownloadedPosterSize") = 0 and xitem.GetAttribute("size") = "original" Then		          ArtURL.Append xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        ElseIf Prefs.integerForKey("DownloadedPosterSize") = 2 And xitem.GetAttribute("size") = "cover" Then		          ArtURL.Append xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        ElseIf Prefs.integerForKey("DownloadedPosterSize") = 3 and xitem.GetAttribute("size") = "w342" Then		          ArtURL.Append xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        ElseIf Prefs.integerForKey("DownloadedPosterSize") = 4 and xitem.GetAttribute("size") = "mid" then		          ArtURL.Append xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        End If		        		        // Sizes: thumb, cover, mid, original		        If xitem.GetAttribute("size") = "cover" then ArtThumbURL.Append xitem.GetAttribute("url")		        		      Next		      ArtIndex = ArtIndex + 1		      		    ElseIf Mode = "Fanart" and xnode.Name = "backdrop" then		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If     Prefs.integerForKey("DownloadedFanartSize") = 0 and xitem.GetAttribute("size") = "original" Then		          ArtURL.Append  xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        ElseIf Prefs.integerForKey("DownloadedFanartSize") = 2 and xitem.GetAttribute("size") = "thumb"    Then		          ArtURL.Append  xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        ElseIf Prefs.integerForKey("DownloadedFanartSize") = 3 and xitem.GetAttribute("size") = "poster"   Then		          ArtURL.Append  xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        ElseIf Prefs.integerForKey("DownloadedFanartSize") = 4 and xitem.GetAttribute("size") = "w1280"    Then		          ArtURL.Append  xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		          		        End If		        		        // Sizes: thumb, poster, original		        If xitem.GetAttribute("size") = "thumb" then ArtThumbURL.Append xitem.GetAttribute("url")		        		      Next		      ArtIndex = ArtIndex + 1		      		    ElseIf Mode = "ExtraThumbs" and xnode.Name = "backdrop" then		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If xitem.GetAttribute("size") = "poster" then		          ArtURL.Append  xitem.GetAttribute("url")		          ArtSize.Append xitem.GetAttribute("width") + "x" + xitem.GetAttribute("height")		        End If		        If xitem.GetAttribute("size") = "thumb" then ArtThumbURL.Append xitem.GetAttribute("url")		        		      Next		      ArtIndex = ArtIndex + 1		      		    End If		    		  Next		  		  //# If Scrape.Cancelled then Return		  		  If NOT Scrape.MassSearch and Scrape.ArtURL.Ubound <= -1 then		    //$ Progress("close")		    MsgBox Scrape.kNoImagesFound.ReplaceAll( "%s", Mode )		    // dlgProgress.Stop		    Return		  End If		  		  //Dim Pic as Picture		  For i as Integer = 0 to ArtURL.Ubound		    If NOT Scrape.MassSearch and i = 0 Then dlgProgress.Reset		    If NOT Scrape.MassSearch then dlgProgress.Add( Localizable.kDownload + ":", str( i + 1 ) + Localizable.k1of2 + str( ArtIndex + 1 ) + " " + Mode + " " + Localizable.kImages, 1, ArtIndex + 1 )		    If Mode = "ExtraThumbs" then		      If NOT f.Exists then f.CreateAsFolder		      Scrape.ArtThumb.Append URL2Picture( ArtURL(i), "thumb" + str(i + 1), "jpg", f )		    Else		      Scrape.ArtThumb.Append Picture.FromData( sckt.Get( ArtThumbURL(i), Prefs.integerForKey("TimeOut") ) )		    End If		  Next		  		  If Scrape.ArtURL.Ubound = 0 Then		    Dim PosterLocation as FolderItem = MovieAttr.DestinationPoster( MovieAttr.FolderParent )		    Dim FanartLocation as FolderItem = MovieAttr.DestinationFanart( MovieAttr.FolderParent )		    		    'If ( PosterLocation <> Nil and PosterLocation.Exists ) or _		    '( FanartLocation <> Nil and FanartLocation.Exists ) Then		    		    // Shouldn't this already have been asked and dealth with?		    'If NOT Scrape.MassSearch and 1 = MsgDlg( Nil, 1, Scrape.msgPriorMovieArtFound.ReplaceAll("<movie>", MovieAttr.Title), Scrape.msgPriorArtDeletion, Scrape.btnReplaceExistingArtwork, Scrape.btnDownloadMissingArtwork ) Then		    'If Mode = "Poster" Then PosterLocation.Delete		    'If Mode = "Fanart" Then FanartLocation.Delete		    'End If		    		    'End If		    		    If ( PosterLocation = Nil or NOT PosterLocation.Exists ) or _		      ( FanartLocation = Nil or NOT FanartLocation.Exists ) Then		      		      If Mode = "Poster" Then		        MovieAttr.ART_Poster = URL2Picture( ArtURL(0), PosterLocation.NameWithoutExtension, PosterLocation.NameExtension, MovieAttr.FolderParent )		        CacheImageSet( MovieAttr.ART_Poster, MovieAttr.ID_IMDB + ".movie.poster.jpg" )		      End If		      		      If Mode = "Fanart" Then		        MovieAttr.ART_Fanart = URL2Picture( ArtURL(0), FanartLocation.NameWithoutExtension, FanartLocation.NameExtension, MovieAttr.FolderParent )		        CacheImageSet( MovieAttr.ART_Fanart, MovieAttr.ID_IMDB + ".movie.fanart.jpg" )		      End If		      		    End If		    		    wndMain.lstMovies.UpdateRow		  End If		  		  If Mode <> "ExtraThumbs" and Scrape.ArtURL.Ubound > 0 then		    wndArtPreview.Show		    wndArtPreview.cvsThumbs.Thumbs = Scrape.ArtThumb		    wndArtPreview.cvsThumbs.ThumbDimensions = Scrape.ArtSize		    If Mode = "Poster" then wndArtPreview.sldThumbSize.Maximum = 274 * 1.2 Else wndArtPreview.sldThumbSize.Maximum = 300 * 1.2		    wndArtPreview.cvsThumbs.Selection = 0		    wndArtPreview.Mode = "TMDB-" + Mode		    wndArtPreview.cvsThumbs.Invalidate False		  End If		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeFirstResult(XmlContent as String)		  #If TargetLinux Then		    		    Dim Xml as new XmlDocument		    Dim xroot, xnode, xitem as XmlNode		    		    //# If Scrape.Cancelled then Return		    		    Xml.PreserveWhitespace = False		    Xml.LoadXml( XmlContent )		    		    xroot = Xml.Child(0).Child(2)		    If xroot.FirstChild <> Nil and xroot.FirstChild.Value = "Nothing Found." Then		      		      // If .nfo file only contains an IMDB ID.		      If MovieAttr.Title = "" and MovieAttr.ID_IMDB <> "" Then		        Scrape.TMDBApi( xitem.FirstChild.Value )		      Else		        Return		      End If		      		    End If		    		    If xroot.FirstChild <> Nil and xroot.ChildCount > 0 then // 1 or more movies found		      xnode = xroot.Child(0)		      If xnode.FirstChild <> Nil then		        For i as Integer = 0 to xnode.ChildCount - 1		          xitem = xnode.Child(i)		          If xitem.FirstChild <> Nil then		            If xitem.Name = "id" then Scrape.TMDBApi( xitem.FirstChild.Value )		          End If		        Next		      End If		    End If		    		  #EndIf		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ScrapeResults(XmlContent as String)		  //# If Scrape.Cancelled then Return		  		  Dim Xml as new XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim n as Integer		  Dim TrailerURL as String		  		  MovieAttr.ClearProperties		  //Dim c as new Clipboard		  //c.Text = XmlContent		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).Child(2).FirstChild		  		  For i as Integer = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    		    If xnode.FirstChild <> Nil then		      		      Select Case xnode.Name		        		      Case "name"		        MovieAttr.Title = xnode.FirstChild.Value		        MovieAttr.TitleSort = Articulator( MovieAttr.Title )		        		      case "original_name"		        MovieAttr.TitleOriginal = xnode.FirstChild.Value		        		      case "id"		        MovieAttr.ID_TMDB = xnode.FirstChild.Value		        		      case "imdb_id"		        MovieAttr.ID_IMDB = xnode.FirstChild.Value		        		      case "tagline"		        MovieAttr.DescriptionTagline = xnode.FirstChild.Value		        		      case "overview"		        MovieAttr.DescriptionPlot = xnode.FirstChild.Value		        		      case "certification"		        If Prefs.textStringForKey("DBLanguage") = "de" Then		          MovieAttr.RatingMPAA = "FSK " + xnode.FirstChild.Value		        ElseIf Prefs.textStringForKey("DBLanguage") = "nl" Then		          MovieAttr.RatingMPAA = "Kijkwijzer: " + xnode.FirstChild.Value		        ElseIf Prefs.textStringForKey("DBLanguage") = "fr" Then		          MovieAttr.RatingMPAA = "Classement: " + xnode.FirstChild.Value		          		        Else		          MovieAttr.RatingMPAA = "Rated " + xnode.FirstChild.Value		        End If		        		      case "rating"		        MovieAttr.Rating = Val( xnode.FirstChild.Value )		        		      case "votes"		        MovieAttr.RatingVotes = val( xnode.FirstChild.Value )		        		      case "released"		        MovieAttr.DatePremiered = xnode.FirstChild.Value		        MovieAttr.DateYear = Val( MovieAttr.DatePremiered.Left(4) )		        		      case "runtime"		        MovieAttr.InfoVideoRuntime = xnode.FirstChild.Value		        		      case "categories"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.Genres.Append xnode.Child(n).GetAttribute("name")		        Next		        		      case "keywords"		        'For n = 0 to xnode.ChildCount - 1		        'MovieAttr.Genres.Append xnode.Child(n).GetAttribute("name")		        'Next		        		      case "languages_spoken"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.LanguagesSpoken.Append xnode.Child(n).GetAttribute("name")		          MovieAttr.LanguagesSpokenCode.Append xnode.Child(n).GetAttribute("code")		        Next		        		      case "studios"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.Studios.Append xnode.Child(n).GetAttribute("name")		        Next		        		      case "countries"		        For n = 0 to xnode.ChildCount - 1		          MovieAttr.Countries.Append xnode.Child(n).GetAttribute("name")		        Next		        		      case "trailer"		        TrailerURL = xnode.FirstChild.Value		        		      case "cast"		        For n = 0 to xnode.ChildCount - 1		          xitem = xnode.Child(n)		          		          // Append Actor		          If xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") <> "" and xitem.GetAttribute("thumb") <> "" then		            // Job = actor, name = name, character = character, thumburl = thumburl		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append xitem.GetAttribute("character")		            MovieAttr.ActorThumbURL.Append xitem.GetAttribute("thumb").ReplaceAll("/w45/", "/w185/")		          ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") <> "" and xitem.GetAttribute("thumb") = "" then		            // Job = actor, name = name, character = character, thumburl = empty		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append xitem.GetAttribute("character")		            MovieAttr.ActorThumbURL.Append ""		          ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") = "" and xitem.GetAttribute("thumb") = "" then		            // Job = actor, name = name, character = empty, thumburl = empty		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append ""		            MovieAttr.ActorThumbURL.Append ""		          ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") = "" and xitem.GetAttribute("thumb") <> "" then		            // Job = actor, name = name, character = empty, thumburl = thumburl		            MovieAttr.ActorName.Append xitem.GetAttribute("name")		            MovieAttr.ActorRole.Append ""		            MovieAttr.ActorThumbURL.Append xitem.GetAttribute("thumb").ReplaceAll("/w45/", "/w185/")		          End If		          		          // Append Director		          If xnode.GetAttribute("job") = "Director" then		            If MovieAttr.CreditDirector <> "" then		              MovieAttr.CreditDirector = MovieAttr.CreditDirector + ", " + xnode.GetAttribute("name")		            Else		              MovieAttr.CreditDirector = xnode.GetAttribute("name")		            End If		          End If		          		          // Append Writer		          If xnode.GetAttribute("job") = "screenplay" then		            If MovieAttr.CreditWriter <> "" then		              MovieAttr.CreditWriter = MovieAttr.CreditWriter + ", " + xnode.GetAttribute("name")		            Else		              MovieAttr.CreditWriter = xnode.GetAttribute("name")		            End If		          End If		          		        Next		        		      case "images"		        		        For n = 0 to xnode.ChildCount - 1		          xitem = xnode.Child(n)		          		          // Poster		          Dim PosterSize as String = "original"		          Select Case Prefs.integerForKey("DownloadedPosterSize")		          Case 2		            PosterSize = "cover" // Small		          case 3		            postersize = "w342" // Medium		          case 4		            PosterSize = "mid" // Large		          End Select		          		          // Fanart		          Dim FanartSize as String = "original"		          Select Case Prefs.integerForKey("DownloadedFanartSize")		          Case 2		            FanartSize = "thumb" // Small		          case 3		            FanartSize = "poster" // Medium		          case 4		            FanartSize = "w1280" // Large		          End Select		          		          If xitem.GetAttribute("type") = "poster"   and xitem.GetAttribute("size") = PosterSize then MovieAttr.ART_PosterURLs.Append      xitem.GetAttribute("url")		          If xitem.GetAttribute("type") = "backdrop" and xitem.GetAttribute("size") = FanartSize then MovieAttr.ART_FanartURLs.Append      xitem.GetAttribute("url")		          If xitem.GetAttribute("type") = "backdrop" and xitem.GetAttribute("size") = "thumb"    then MovieAttr.Art_FanartThumbURLs.Append xitem.GetAttribute("url")		        Next		        		        //# If Scrape.Cancelled then Return		        		        If MovieAttr.ART_PosterURLs.Ubound > -1 and Prefs.boolForKey("AutoDownloadPoster") then		          //$ If NOT Scrape.MassSearch then Progress( Localizable.kDownloading + ":", Localizable.kDefaultPoster, 3, 5 )		          If NOT Scrape.MassSearch then dlgProgress.Add( Localizable.kDownloading + ":", Localizable.kDefaultPoster )		          Dim PosterLocation as FolderItem = MovieAttr.DestinationPoster( MovieAttr.FolderParent )		          If NOT PosterLocation.Exists then		            MovieAttr.ART_Poster = URL2Picture( MovieAttr.ART_PosterURLs(0), PosterLocation.NameWithoutExtension, PosterLocation.NameExtension, MovieAttr.FolderParent )		            CacheImageSet( MovieAttr.ART_Poster, MovieAttr.ID_IMDB + ".movie.poster.jpg" )		          End If		        End If		        		        //# If Scrape.Cancelled then Return		        		        If MovieAttr.ART_FanartURLs.Ubound > -1 and Prefs.boolForKey("AutoDownloadFanart") then		          Dim FanartLocation as FolderItem = MovieAttr.DestinationFanart( MovieAttr.FolderParent )		          //$ If NOT FanartLocation.Exists and  NOT Scrape.MassSearch then Progress( Localizable.kDownloading + ":", Localizable.kDefaultFanart, 4, 5 )		          If NOT FanartLocation.Exists and NOT Scrape.MassSearch then dlgProgress.Add( Localizable.kDownloading + ":", Localizable.kDefaultFanart )		          If NOT FanartLocation.Exists then		            MovieAttr.ART_Fanart = URL2Picture( MovieAttr.ART_FanartURLs(0), FanartLocation.NameWithoutExtension, FanartLocation.NameExtension, MovieAttr.FolderParent )		            CacheImageSet( MovieAttr.ART_Fanart, MovieAttr.ID_IMDB + ".movie.fanart.jpg" )		          End If		        End If		        		        // @END Images		        		      End Select		      		    End If		    		  Next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SearchResults(XmlContent as String, MovieName as String)		  #IF TargetLinux Then		    		    Dim Xml as new XmlDocument		    Dim xroot as XmlNode		    		    Xml.PreserveWhitespace = False		    Xml.LoadXml( XmlContent )		    xroot = Xml.Child(0).Child(2)		    		    //# If Scrape.Cancelled then Return		    dlgProgress.Add( Localizable.kProcessing + ":", Localizable.kSearchResults ) // 3		    		    // 2+ movies found.		    If xroot.ChildCount > 1 then		      'dlgProgress.Debug( "Building the searchwindow list. 2+ movies found." )		      ShowSearchWindow( Xml )		      		      // No movies found during manual search		    ElseIf xroot.FirstChild.Value = "Nothing Found." and Scrape.ManualSearch then		      MsgBox Scrape.kNoMoviesFoundTryAgain		      		      // No movies found during regular search		    ElseIf xroot.FirstChild.Value = "Nothing Found." and NOT Scrape.ManualSearch then		      		      // If the NFO file only contains a IMDB URL, which I'm able to filter out to the MovieAttr.ID_IMDB.		      If MovieAttr.Title = "" And MovieAttr.ID_IMDB <> "" Then		        Scrape.TMDBApi( MovieAttr.ID_IMDB )		        		      Else		        		        // If I don't have anything else to search for a movie with.		        If MsgDlg( Nil, 0, Scrape.kNothingFound, Scrape.kManualSearchMovie, Localizable.dlgOK, Localizable.dlgCancel ) = 1 Then		          If MovieName <> "" then		            wndSearchMovie.ccSearchBox.edtSearch.Text = MovieName		          Else		            If wndMain.ppMain.Value = 0 then wndSearchMovie.ccSearchBox.edtSearch.Text = wndMain.lstMovies.Cell( wndMain.lstMovies.ListIndex, 0 ).ReplaceAll( ".", " " ).ReplaceAll(" - ", ": ")		          End If		        End If		        dlgProgress.Close		        		      End If		      		      // Regular to Manual search		    ElseIf xroot.ChildCount > 0 and Scrape.ManualSearch then		      ShowSearchWindow( Xml )		      		      // Only 1 result		    ElseIf xroot.ChildCount = 1 and NOT Scrape.ManualSearch then		      Dim xnode, xitem as XmlNode		      For i as Integer = 0 to xroot.ChildCount - 1		        xnode = xroot.Child(i)		        If xnode.FirstChild <> Nil then		          For n as Integer = 0 to xnode.ChildCount - 1		            xitem = xnode.Child(n)		            If xitem.FirstChild <> Nil and xitem.Name = "id" then Scrape.TMDBApi( xitem.FirstChild.Value )		          Next		        End If		      Next		      		    End If		    		  #EndIf		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub ShowSearchWindow(Xml as XmlDocument)		  Dim xroot, xnode, xitem, xleaf as XmlNode		  Dim lstbox as Listbox		  Dim sTitle, sYear as String		  		  xroot = Xml.Child(0).Child(2)		  		  //# If Scrape.Cancelled then Return		  //# Progress("close")		  'dlgProgress.Close		  wndSearchMovie.Show		  lstbox = wndSearchMovie.lstMovies		  lstbox.DeleteAllRows		  		  For i as Integer = 0 to xroot.ChildCount - 1		    xnode = xroot.Child(i)		    If xnode.FirstChild <> Nil then		      lstbox.AddRow		      		      For n as Integer = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        If xitem.FirstChild <> Nil then		          		          Select Case xitem.Name		            		          Case "name"		            lstbox.Cell( lstbox.LastIndex, 2 ) = xitem.FirstChild.Value		            sTitle = xitem.FirstChild.Value		            		          case "id"		            lstbox.Cell( lstbox.LastIndex, 1 ) = xitem.FirstChild.Value		            		          case "released"		            lstbox.Cell( lstbox.LastIndex, 3 ) = xitem.FirstChild.Value		            sYear = xitem.FirstChild.Value.Left(4)		            		          case "overview"		            lstbox.Cell( lstbox.LastIndex, 4 ) = xitem.FirstChild.Value		            		          case "images"		            For t as Integer = 0 to xitem.ChildCount - 1		              xleaf = xitem.Child(t)		              		              If xleaf.GetAttribute("type") = "poster" and xleaf.GetAttribute("size") = "w154" then _		              lstbox.Cell( lstbox.LastIndex, 5 ) = xleaf.GetAttribute("url")		              If xleaf.GetAttribute("type") = "backdrop" and xleaf.GetAttribute("size") = "thumb" then _		              lstbox.Cell( lstbox.LastIndex, 6 ) = xleaf.GetAttribute("url")		              		              		            Next // @END xitem.ChildCount		            		          End Select		          		          lstbox.Cell( lstbox.LastIndex, 0 ) = sTitle + " (" + sYear + ")"		          		        End If // @END xitem <> Nil		        		      Next // @END xnode.ChildCount		      		    End IF // @END xnode <> Nil		    		  Next // @END xroot.ChildCount		  		  lstbox.SortedColumn = 3		  lstbox.ColumnSortDirection(3) = 2		  lstbox.Sort		  lstbox.ListIndex = 0		  		  dlgProgress.Stop		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateResult(XmlContent as String)		  Dim Xml as New XmlDocument		  Dim xroot, xnode, xitem as XmlNode		  Dim TrailerURL as string, n as Integer		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).Child(2).FirstChild		  		  For i as Integer = 0 to xroot.ChildCount - 1		    		    // Select xnode, and if it's Nil, continue to the next item.		    xnode = xroot.Child(i)		    If xnode.FirstChild = Nil Then Continue		    		    Select Case xnode.Name		      		    case "name"		      If MovieAttr.Title = "" Then		        MovieAttr.Title = xnode.FirstChild.Value		        MovieAttr.TitleSort = Articulator( MovieAttr.Title )		      End If		      		    case "original_name"		      If MovieAttr.TitleOriginal = "" Then MovieAttr.TitleOriginal = xnode.FirstChild.Value		      		    case "id"		      MovieAttr.ID_TMDB = xnode.FirstChild.Value		      		    case "imdb_id"		      MovieAttr.ID_IMDB = xnode.FirstChild.Value		      		    case "tagline"		      // Only update if there wasn't one before.		      If MovieAttr.DescriptionTagline = "" Then MovieAttr.DescriptionTagline = xnode.FirstChild.Value		      		    case "overview"		      If MovieAttr.DescriptionPlot = "" Then MovieAttr.DescriptionPlot = xnode.FirstChild.Value		      		    case "certification"		      // German		      If Prefs.textStringForKey("DBLanguage") = "de" Then		        MovieAttr.RatingMPAA = "FSK " + xnode.FirstChild.Value		        		        // Dutch		      ElseIf Prefs.textStringForKey("DBLanguage") = "nl" Then		        MovieAttr.RatingMPAA = "Kijkwijzer: " + xnode.FirstChild.Value		        		        // French		      ElseIf Prefs.textStringForKey("DBLanguage") = "fr" Then		        MovieAttr.RatingMPAA = "Classement: " + xnode.FirstChild.Value		        		        // English / American		      Else		        MovieAttr.RatingMPAA = "Rated " + xnode.FirstChild.Value		      End If		      		    case "rating"		      MovieAttr.Rating = Val( xnode.FirstChild.Value )		      		    case "votes"		      MovieAttr.RatingVotes = val( xnode.FirstChild.Value )		      		    case "released"		      MovieAttr.DatePremiered = xnode.FirstChild.Value		      MovieAttr.DateYear = Val( MovieAttr.DatePremiered.Left(4) )		      		    case "runtime"		      MovieAttr.InfoVideoRuntime = xnode.FirstChild.Value		      		    case "categories"		      For n = 0 to xnode.ChildCount - 1		        MovieAttr.Genres.Append xnode.Child(n).GetAttribute("name")		      Next		      		    case "keywords"		      For n = 0 to xnode.ChildCount - 1		        MovieAttr.Genres.Append xnode.Child(n).GetAttribute("name")		      Next		      		    case "languages_spoken"		      ReDim MovieAttr.LanguagesSpoken(-1)		      For n = 0 to xnode.ChildCount - 1		        MovieAttr.LanguagesSpoken.Append xnode.Child(n).GetAttribute("name")		        MovieAttr.LanguagesSpokenCode.Append xnode.Child(n).GetAttribute("code")		      Next		      		    case "studios"		      ReDim MovieAttr.Studios(-1)		      For n = 0 to xnode.ChildCount - 1		        MovieAttr.Studios.Append xnode.Child(n).GetAttribute("name")		      Next		      		    case "countries"		      ReDim MovieAttr.Countries(-1)		      For n = 0 to xnode.ChildCount - 1		        MovieAttr.Countries.Append xnode.Child(n).GetAttribute("name")		      Next		      		    case "trailer"		      TrailerURL = xnode.FirstChild.Value		      		    case "cast"		      ReDim MovieAttr.ActorName(-1)		      ReDim MovieAttr.ActorRole(-1)		      ReDim MovieAttr.ActorThumbURL(-1)		      MovieAttr.CreditDirector = ""		      MovieAttr.CreditWriter = ""		      		      For n = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        // Append Actor		        If xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") <> "" and xitem.GetAttribute("thumb") <> "" then		          // Job = actor, name = name, character = character, thumburl = thumburl		          MovieAttr.ActorName.Append xitem.GetAttribute("name")		          MovieAttr.ActorRole.Append xitem.GetAttribute("character")		          MovieAttr.ActorThumbURL.Append xitem.GetAttribute("thumb").ReplaceAll("/w45/", "/w185/")		        ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") <> "" and xitem.GetAttribute("thumb") = "" then		          // Job = actor, name = name, character = character, thumburl = empty		          MovieAttr.ActorName.Append xitem.GetAttribute("name")		          MovieAttr.ActorRole.Append xitem.GetAttribute("character")		          MovieAttr.ActorThumbURL.Append ""		        ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") = "" and xitem.GetAttribute("thumb") = "" then		          // Job = actor, name = name, character = empty, thumburl = empty		          MovieAttr.ActorName.Append xitem.GetAttribute("name")		          MovieAttr.ActorRole.Append ""		          MovieAttr.ActorThumbURL.Append ""		        ElseIf xitem.GetAttribute("job") = "Actor" and xitem.GetAttribute("name") <> "" and xitem.GetAttribute("character") = "" and xitem.GetAttribute("thumb") <> "" then		          // Job = actor, name = name, character = empty, thumburl = thumburl		          MovieAttr.ActorName.Append xitem.GetAttribute("name")		          MovieAttr.ActorRole.Append ""		          MovieAttr.ActorThumbURL.Append xitem.GetAttribute("thumb").ReplaceAll("/w45/", "/w185/")		        End If		        		        // Append Director		        If xnode.GetAttribute("job") = "Director" then		          If MovieAttr.CreditDirector <> "" then		            MovieAttr.CreditDirector = MovieAttr.CreditDirector + ", " + xnode.GetAttribute("name")		          Else		            MovieAttr.CreditDirector = xnode.GetAttribute("name")		          End If		        End If		        		        // Append Writer		        If xnode.GetAttribute("job") = "screenplay" then		          If MovieAttr.CreditWriter <> "" then		            MovieAttr.CreditWriter = MovieAttr.CreditWriter + ", " + xnode.GetAttribute("name")		          Else		            MovieAttr.CreditWriter = xnode.GetAttribute("name")		          End If		        End If		        		      Next		      		    case "images"		      ReDim MovieAttr.ART_PosterURLs(-1)		      ReDim MovieAttr.ART_FanartURLs(-1)		      ReDim MovieAttr.Art_FanartThumbURLs(-1)		      		      For n = 0 to xnode.ChildCount - 1		        xitem = xnode.Child(n)		        		        // Poster		        Dim PosterSize as String = "original"		        Select Case Prefs.integerForKey("DownloadedPosterSize")		        Case 2		          PosterSize = "cover" // Small		        case 3		          postersize = "w342" // Medium		        case 4		          PosterSize = "mid" // Large		        End Select		        		        // Fanart		        Dim FanartSize as String = "original"		        Select Case Prefs.integerForKey("DownloadedFanartSize")		        Case 2		          FanartSize = "thumb" // Small		        case 3		          FanartSize = "poster" // Medium		        case 4		          FanartSize = "w1280" // Large		        End Select		        		        If xitem.GetAttribute("type") = "poster"   and xitem.GetAttribute("size") = PosterSize then MovieAttr.ART_PosterURLs.Append      xitem.GetAttribute("url")		        If xitem.GetAttribute("type") = "backdrop" and xitem.GetAttribute("size") = FanartSize then MovieAttr.ART_FanartURLs.Append      xitem.GetAttribute("url")		        If xitem.GetAttribute("type") = "backdrop" and xitem.GetAttribute("size") = "thumb"    then MovieAttr.Art_FanartThumbURLs.Append xitem.GetAttribute("url")		      Next		      		      		      If MovieAttr.ART_PosterURLs.Ubound > -1 and Prefs.boolForKey("AutoDownloadPoster") then		        If NOT Scrape.MassSearch then dlgProgress.Add( Localizable.kDownloading + ":", Localizable.kDefaultPoster )		        Dim PosterLocation as FolderItem = MovieAttr.DestinationPoster( MovieAttr.FolderParent )		        If NOT PosterLocation.Exists then		          MovieAttr.ART_Poster = URL2Picture( MovieAttr.ART_PosterURLs(0), PosterLocation.NameWithoutExtension, PosterLocation.NameExtension, MovieAttr.FolderParent )		          CacheImageSet( MovieAttr.ART_Poster, MovieAttr.ID_IMDB + ".movie.poster.jpg" )		        End If		      End If		      		      		      If MovieAttr.ART_FanartURLs.Ubound > -1 and Prefs.boolForKey("AutoDownloadFanart") then		        Dim FanartLocation as FolderItem = MovieAttr.DestinationFanart( MovieAttr.FolderParent )		        If NOT FanartLocation.Exists and NOT Scrape.MassSearch then dlgProgress.Add( Localizable.kDownloading + ":", Localizable.kDefaultFanart )		        If NOT FanartLocation.Exists then		          MovieAttr.ART_Fanart = URL2Picture( MovieAttr.ART_FanartURLs(0), FanartLocation.NameWithoutExtension, FanartLocation.NameExtension, MovieAttr.FolderParent )		          CacheImageSet( MovieAttr.ART_Fanart, MovieAttr.ID_IMDB + ".movie.fanart.jpg" )		        End If		      End If		      		      // @END Images		      		    End Select		    		  Next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Images(ID as String) As String		  Return "http://api.themoviedb.org/2.1/Movie.getImages/" + Prefs.textStringForKey("DBLanguage") + "/xml/" + ApiKey + "/" + ID		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Info(ID as String) As String		  Dim Lang as String = Prefs.textStringForKey("DBLanguage")		  If Lang.InStr(0,"-") = 0 Then Lang = Lang + "-" + Lang		  If Lang = "en-en" Then Lang = "en"		  		  If ID.Left(2) = "tt" then		    // IMDB Lookup		    Return "http://api.themoviedb.org/2.1/Movie.imdbLookup/" + Lang + "/xml/" + ApiKey + "/" + ID		  Else		    // TMDB Lookup		    Return "http://api.themoviedb.org/2.1/Movie.getInfo/" + Lang + "/xml/" + ApiKey + "/" + ID		  End If		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL_Search(MovieName as String) As String		  Return "http://api.themoviedb.org/2.1/Movie.search/" + Prefs.textStringForKey("DBLanguage") + "/xml/" + ApiKey + "/" + String2Entities( MovieName )		End Function	#tag EndMethod	#tag Note, Name = TMDB Api Docs				http://api.themoviedb.org/2.1	#tag EndNote	#tag Constant, Name = ApiKey, Type = String, Dynamic = False, Default = \"683359f622e4e27f41832a019d90b002", Scope = Public	#tag EndConstant	#tag Constant, Name = MirrorPath, Type = String, Dynamic = False, Default = \"http://hwcdn.themoviedb.org", Scope = Public	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Address"			Visible=true			Group="Behavior"			Type="String"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="defaultPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyAddress"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Port"			Visible=true			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="yield"			Group="Behavior"			InitialValue="0"			Type="boolean"			InheritedFrom="HTTPSocket"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass