#tag ClassProtected Class TrailerScktInherits HTTPSocket	#tag Event		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)		  Dim TheFile as FolderItem = file		  Dim TrailerFile as FolderItem = FindTrailerItem( MovieAttr.FolderParent )		  Dim MovieFile   as FolderItem = FindMovieItem(   MovieAttr.FolderParent )		  Dim Destination as FolderItem		  		  // If file seems trailer like.		  If TheFile <> Nil And TheFile.Exists And TheFile.Length > 1024 Then		    		    // Trailer Destination		    If MovieFile <> Nil and MovieFile.Exists and MovieFile.Name <> "VIDEO_TS" And MovieFile.Name <> "BDMV" Then		      Destination = MovieAttr.FolderParent.Child( Prefs.textStringForKey( "FileNameTrailer" ).ReplaceAll( "<movie>", MovieFile.NameWithoutExtension ) + file.VideoFileExtension )		    Else		      Destination = MovieAttr.FolderParent.Child( "trailer" + file.VideoFileExtension )		    End If		    		    If Destination <> Nil Then		      If TrailerFile <> Nil And TrailerFile.Exists Then TrailerFile.MoveFileToTrash		      File.MoveFileTo Destination		      MsgBox Loc.kDownloadComplete		    Else		      MsgBox "Invalid Destination"		    End If		    		  Else		    SocketError( Me.LastErrorCode, Me )		  End If		  		  DownloadComplete( url, httpStatus, Headers, file )		End Sub	#tag EndEvent	#tag Event		Sub Error(code as integer)		  SocketError( code, Me )		  		Exception err as NilObjectException		  Me.Close		End Sub	#tag EndEvent	#tag Event		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)		  		  Dim ValueMB as String = Str( Floor( ( bytesReceived / 1024 / 1024 ) * 100 ) / 100 )		  Dim MaxMB   as String = Str( Floor( ( totalBytes    / 1024 / 1024 ) * 100 ) / 100 )		  If ValueMB.Len = 3 Then ValueMB = ValueMB + "0"		  		  Dim Progress as String = ValueMB + " MB" + Loc.k1of2 + MaxMB + " MB"		  		  ReceiveProgress bytesReceived, totalBytes, newData, Progress		  'If NOT Scrape.MassSearch Then dlgProgress.Update( Loc.kDownloading + ":", Loc.kTrailer + "... " + Progress, bytesReceived, totalBytes )		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub Download(URL as String = "")		  If FindTrailerItem( MovieAttr.FolderParent ) <> Nil And _		    MsgDlg( Nil, 1, Loc.msgTrailerExists, Loc.kCantBeUndone, Loc.dlgCancel, Loc.dlgReplace ) = 1 Then		    DownloadInterupted( URL )		    Return		  End If		  		  'Me.Yield = True		  Dim Lang as String = Prefs.textStringForKey("DBLanguage").NthField("-", 1)		  Dim ytContent as String		  Dim sckt as New MovieSckt		  		  'If URL.InStr( 0, "apple.com" ) > 0 Then		  // Apple.com trailer download workaround, set user-agent to Safari.		  Me.SetRequestHeader( "User-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Safari/8536.25" )		  'End If		  		  		  // If not youtube URL Then download.		  If NOT URL.InStr( 0, "youtube" ) > 0 Then		    		    If URL.Trim.Right(4) = ".mp4" Or _		      URL.Trim.Right(4) = ".avi" Or _		      URL.Trim.Right(4) = ".flv" Or _		      URL.Trim.Right(4) = ".mov" Then		      Me.Get URL, SpecialFolder.Temporary.Child( "trailer.downloading" )		      'URL = "Downloading..." // Make sure that even if progressing while trailer is downloading, it won't try anything else.		      Return		    End If		    		    		    // If no URL available, then try to find a youtube URL on TMDB.		  ElseIf URL = "" And MovieAttr.ID_TMDB <> "" Then		    		    Dim JSONString as String = Me.Get( sckt.URL( "MovieTrailers", MovieAttr.ID_TMDB, Lang ), Prefs.integerForKey( "TimeOut" ) )		    Me.Close		    		    Dim Trailers as New JSONItem		    If JSONString.ValidJSON( "TMDB" ) Then Trailers.Load( JSONString )		    		    If Trailers.HasName( "youtube" ) And Trailers.Child( "youtube" ).Count > 0 Then		      URL = "http://www.youtube.com/watch?v=" + Trailers.Child("youtube").Child(0).Value("source") + "&hd=1"		    End If		    		    		    // If URL is from youtube, make sure it's HD.		  ElseIf URL.InStr( 0, "youtube" ) > 0 And URL.InStr( 0, "&h=1" ) <= 0 Then		    URL = URL + "&hd=1"		    		  End If		  		  // If there's still no URL, return		  If URL = "" Then		    MsgBox Loc.msgNoTrailer		    DownloadInterupted( URL )		    Return		    		    // If Youtube URL is available, process it before downloading it.		  ElseIf URL.InStr( 0, "youtube" ) > 0 Then		    ytContent = Me.get( URL, Prefs.integerForKey( "TimeOut" ) )		    Me.Close		    		    // If URL is valid. (HTTP)		  ElseIf URL.Trim.Left(4) = "http" Then		    		    Me.Get( URL, SpecialFolder.Temporary.Child("trailer.downloading") )		    Return		    		  End If		  		  If ytContent.InStr(0, "<!DOCTYPE html>" ) > 0 Then YoutubeContent( ytContent )		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub YoutubeContent(tmpContent as String)		  'If URL.InStr( 0, "youtube" ) > 0 Then		  		  Dim idx1, idx2 as Integer		  idx1 = tmpContent.InStr( "yt.preload.start(""" ) + 18		  idx2 = tmpContent.InStr( idx1, ";" )		  Dim s as String = tmpContent.Mid( idx1, idx2 - idx1 - 2 )		  		  If s.InStr("crossdomain" ) > 0 Then		    idx1 = tmpContent.InStr( idx1, "yt.preload.start(""" ) + 18		    idx2 = tmpContent.InStr( idx1, ";" )		    s = tmpContent.Mid( idx1, idx2 - idx1 - 2 )		  End If		  		  s = s.ReplaceAll("\/", "/")     // unencode these characters		  s = s.ReplaceAll("\u0026", "&")		  		  s = s.ReplaceAll("generate_204", "videoplayback") // Switch generate to video		  s = s.ReplaceAll("pmbypass&", "")		  s = s.ReplaceAll("pmbypass=yes&", "")		  		  If s <> "" Then		    Me.Get s, SpecialFolder.Temporary.Child( "trailer.downloading" )		  Else		    MsgBox Loc.msgNoTrailer		    Return		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub zDownload(URL as String = "")		  If FindTrailerItem( MovieAttr.FolderParent ) <> Nil And _		    MsgDlg( Nil, 1, Loc.msgTrailerExists, Loc.kCantBeUndone, Loc.dlgCancel, Loc.dlgReplace ) = 1 Then Return		    		    Me.Yield = True		    Dim Lang as String = Prefs.textStringForKey("DBLanguage").NthField("-", 1)		    		    // Get Youtube URL if no URL is available.		    Dim Sckt as New MovieSckt		    If URL = "" And MovieAttr.ID_TMDB <> "" Then		      URL = Sckt.URL( "MovieTrailers", MovieAttr.ID_TMDB, Lang )		      Dim JSONString as String = Me.Get( URL, Prefs.integerForKey( "TimeOut" ) )		      URL = ""		      		      Dim Trailers as New JSONItem		      If JSONString.ValidJSON( "TMDB" ) Then Trailers.Load( JSONString )		      		      		      If Trailers.HasName( "youtube" ) And Trailers.Child( "youtube" ).Count > 0 Then		        For i as Integer = 0 to Trailers.Child("youtube").Count - 1		          Dim jItem as New JSONItem		          jItem = Trailers.Child( "youtube" ).Child(i)		          		          If jItem.Value( "source" ) <> "" Then		            URL = "http://www.youtube.com/watch?v=" + jItem.Value("source") + "&hd=1"		            Exit		          End If		          		        Next		      End If		      		    ElseIf URL.InStr( 0, "youtube" ) > 0 And url.InStr( 0, "&hd=1" ) <= 0 Then		      URL = URL + "&hd=1"		    End If		    		    		    If URL = "" Then		      MsgBox Loc.msgNoTrailer		      Return		      		    ElseIf URL.InStr( 0, "youtube" ) > 0 Then		      YoutubeContent Me.Get( URL, Prefs.integerForKey("TimeOut") )		      		    Else		      'Dim f as FolderItem = Me.Get URL, SpecialFolder.Temporary.Child( "trailer.downloading" ), Prefs.integerForKey("TimeOut")		      Dim FileSaved as Boolean = Me.Get( URL, SpecialFolder.Temporary.Child( "trailer.downloading" ), Prefs.integerForKey("TimeOut") )		      MsgBox Str( FileSaved )		    End If		End Sub	#tag EndMethod	#tag Hook, Flags = &h0		Event DownloadComplete(url as String, httpStatus as Integer, Headers as internetHeaders, file as FolderItem)	#tag EndHook	#tag Hook, Flags = &h0		Event DownloadInterupted(URL as String)	#tag EndHook	#tag Hook, Flags = &h0		Event ReceiveProgress(bytesReceived as Integer, totalBytes as Integer, newData as String, Progress as String)	#tag EndHook	#tag ViewBehavior		#tag ViewProperty			Name="Address"			Visible=true			Group="Behavior"			Type="String"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="defaultPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyAddress"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Port"			Visible=true			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="yield"			Group="Behavior"			InitialValue="0"			Type="boolean"			InheritedFrom="HTTPSocket"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass