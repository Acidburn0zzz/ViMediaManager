#tag WindowBegin Window wndSetManager   BackColor       =   &hFFFFFF   Backdrop        =   ""   CloseButton     =   True   Composite       =   False   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   4.8e+2   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   False   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   True   MinHeight       =   64   MinimizeButton  =   True   MinWidth        =   64   Placement       =   3   Resizeable      =   True   Title           =   "#Loc.MovieSetsManager"   Visible         =   True   Width           =   630   Begin Listbox lstAvailableMovies      AutoDeactivate  =   True      AutoHideScrollbars=   True      Bold            =   ""      Border          =   True      ColumnCount     =   4      ColumnsResizable=   ""      ColumnWidths    =   "100%, 0, 0"      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   22      Enabled         =   True      EnableDrag      =   True      EnableDragReorder=   ""      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   ""      HeadingIndex    =   -1      Height          =   446      HelpTag         =   ""      Hierarchical    =   False      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   ""      Italic          =   ""      Left            =   20      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      RequiresSelection=   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   True      SelectionType   =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   12      TextUnit        =   0      Top             =   14      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   295      _ScrollWidth    =   -1   End   Begin MyHierListBox lstSets      AutoDeactivate  =   True      AutoHideScrollbars=   True      Bold            =   ""      Border          =   True      ColumnCount     =   4      ColumnsResizable=   ""      ColumnWidths    =   "100%, 0, 0"      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   22      Enabled         =   True      EnableDrag      =   True      EnableDragReorder=   False      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   ""      HeadingIndex    =   -1      Height          =   412      HelpTag         =   ""      Hierarchical    =   True      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   ""      Italic          =   ""      Left            =   327      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   True      RequiresSelection=   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   True      SelectionType   =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   12      TextUnit        =   0      Top             =   14      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   283      _ScrollWidth    =   -1   End   Begin TextField edtSetName      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   True      AutomaticallyCheckSpelling=   False      BackColor       =   &hFFFFFF      Bold            =   ""      Border          =   True      CueText         =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      Italic          =   ""      Left            =   384      LimitText       =   0      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Mask            =   ""      Password        =   ""      ReadOnly        =   ""      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      TabStop         =   True      Text            =   ""      TextColor       =   &h000000      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   438      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   226   End   Begin AddRemoveButtons arSet      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   327      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      Top             =   438      UseFocusRing    =   True      Visible         =   True      Width           =   45   End   Begin MarsSplitter split      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      DrawHandle      =   True      Enabled         =   True      EraseBackground =   True      Height          =   446      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   314      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   True      MinBottomRight  =   0      MinTopLeft      =   0      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      TabStop         =   True      Top             =   14      UseFocusRing    =   True      Visible         =   True      Width           =   14   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Close()		  Preferences.SaveWindowPos( self, "wndSetManager" )		  Close		  		  'CommonCore.ReloadList		End Sub	#tag EndEvent	#tag Event		Sub Open()		  Self.Title = "[Experimental] " + Self.Title		  		  Preferences.LoadWindowPos( self, "wndSetManager" )		End Sub	#tag EndEvent	#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Close			Return True					End Function	#tag EndMenuHandler	#tag Method, Flags = &h1		Protected Sub RefreshSets()		  Dim Lindex as Integer = lstSets.ListIndex		  lstSets.DeleteAllRows		  		  // Get all set information		  Dim Sets() as String, i as Integer		  For i = 0 to lstAvailableMovies.ListCount - 1		    If lstAvailableMovies.Cell( i, 2 ) <> "" Then Sets.Append lstAvailableMovies.Cell( i, 2 ).NthField( "", 1 )		  Next		  		  Sets.Sort		  		  // Weed out the doubles.		  For i = sets.Ubound to 1 Step -1		    If Sets(i) = Sets(i-1) Then Sets.Remove(i)		  Next i		  		  // Temporarily save collapsed state so it won't be deleted when it's added		  Dim Collapsed() As String = SetsCollapsed		  		  // Add set to setlist		  For i = 0 to Sets.Ubound		    		    If Trim( Sets(i) ) <> "" Then		      lstSets.AddParent Sets(i)		      		      // Set collapsed state if needed.		      lstSets.Expanded( lstSets.LastIndex ) = NOT ( Collapsed.IndexOf( Sets(i), 0 ) >= 0 )		    End If		    		  Next		  		  // Restore collapsed list		  SetsCollapsed = Collapsed		  		  lstSets.SortedColumn = 2		  lstSets.Sort		  		  If Lindex > lstSets.ListCount Then Lindex = lstSets.ListCount		  lstSets.ListIndex = Lindex		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub SetToMovie(f as FolderItem, SetName as String = "", SetOrder as Integer = - 1)		  // Read the Movie's NFO file and add the set.		  If f = Nil Then f = GetFolderItem( lstAvailableMovies.Cell( lstAvailableMovies.ListIndex, 1 ) )		  If f <> Nil and f.Exists Then MovieAttr.NFORead( f ) Else Return		  		  MovieAttr.Set = SetName		  MovieAttr.SetOrder = SetOrder		  		  // Write new information.		  Dim NFOFile as FolderItem = FindNFOFile( f )		  If NFOFile <> Nil and NFOFile.Exists Then MovieAttr.NFOWrite( FindNFOFile( f ) )		  		  // Update Main Window		  For i as Integer = 0 to wndMain.lstMovies.ListCount - 1		    If wndMain.lstMovies.Cell( i, 1 ) = f.AbsolutePath Then		      If SetName <> "" Then wndMain.lstMovies.Cell( i, 9 ) = SetName + "" + Str( SetOrder ) Else wndMain.lstMovies.Cell( i, 9 ) = ""		    End If		  Next		  		  // Add/Remove the setname to the available movies list.		  For i as Integer = 0 to lstAvailableMovies.ListCount -1		    If f.AbsolutePath = lstAvailableMovies.Cell( i, 1 ) Then		      If SetName = "" Then lstAvailableMovies.Cell( i, 2 ) = "" Else lstAvailableMovies.Cell( i, 2 ) = SetName + "" + str( SetOrder )		    End If		  Next		  		  wndMain.lstSearch.CopyFrom( wndMain.lstMovies )		End Sub	#tag EndMethod	#tag Property, Flags = &h1		Protected OriginalText As String	#tag EndProperty	#tag Property, Flags = &h1		Protected SetsCollapsed() As String	#tag EndProperty	#tag Constant, Name = kAlreadyExists, Type = String, Dynamic = True, Default = \"Another set with the same name already exists.", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Another set with the same name already exists."		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er bestaat al een andere set met de zelfde naam."		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Ett bilbliotek med samma namn finns redan."		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ein Filmset mit dem selben Namen ist bereits vorhanden."		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Un autre bo\xC3\xAEtier existe d\xC3\xA9j\xC3\xA0 avec ce nom."	#tag EndConstant#tag EndWindowCode#tag Events lstAvailableMovies	#tag Event		Function DragRow(drag As DragItem, row As Integer) As Boolean		  'Me.ListIndex = row		  		  Drag.Text = Me.List( row )		  Drag.FolderItem = GetFolderItem( Me.Cell( Me.ListIndex, 1 ) )		  		  Drag.DragPicture = miniconmovie		  Return True		End Function	#tag EndEvent	#tag Event		Function MouseDown(x As Integer, y As Integer) As Boolean		  		  If IsContextualClick Then		    		  End If		End Function	#tag EndEvent	#tag Event		Sub Open()		  #If DebugBuild Then		    'Me.ColumnWidths = "40%, 50%, 10%"		    'Me.HasHeading = True		  #EndIf		End Sub	#tag EndEvent	#tag Event		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean		  		  If Me.Active AND Me.Enabled Then		    g.ForeColor = RGB( 232, 232, 232 )		  Else		    g.ForeColor = RGB( 255, 255, 255 )		  End If		  		  If row < Me.ListCount And Me.RowTag( row ) = "Folder" Then		    g.DrawGradient( rgb(255, 255, 255), rgb(230, 230, 230), 0, 0, g.Width, g.Height )		  Else		    g.FillRect 0, 0, g.Width, g.Height		  End If		  		  		  // Items that are in a set		  For i as Integer = 0 to lstSets.ListCount - 1		    If Row < Me.ListCount And Me.Cell( row, 1 ) = lstSets.Cell( i, 1 ) Then		      g.DrawGradient( rgb(225, 225, 255), rgb(200, 200, 230), 0, 0, g.Width, g.Height )		      Exit		    End If		  Next		  		  		  If row < Me.ListCount Then		    g.ForeColor = RGB( 214, 214, 214 )		    g.DrawLine 0, g.Height -1, g.Width, g.Height -1		    		    g.ForeColor = RGB( 255, 255, 255 )		    g.DrawLine 0, 0, g.Width, 0		  End If		  		  		  // Selection Gradient		  If Row > -1 And Me.Selected( row ) Then g.DrawGradient( RGB(115, 176, 227), RGB( 71, 131, 208), 0, 0, g.Width, g.Height )		  		  		  // Movie Icon		  If row < Me.ListCount And Me.RowTag( row ) <> "Folder" Then		    If App.ScalingFactor = 2 Then		      g.DrawPicture miniconmovieII2x, 5, ( g.Height / 2 ) - ( 17 / 2 ) + 1, 14, 17,   0, 0, miniconmovieII2x.Width, miniconmovieII2x.Height		    Else		      g.DrawPicture miniconmovieII,   5, ( g.Height / 2 ) - ( 17 / 2 ) + 1		    End If		  End If		  		  		  If Row > Me.ListCount - 1 Then Return False Else Return True		End Function	#tag EndEvent	#tag Event		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean		  		  If NOT Me.Selected( row ) Then		    g.Transparency = 60		    g.ForeColor = &cFFFFFF		    g.DrawString Me.Cell( row, column ), 20, ( g.Height / 2 ) + ( g.TextSize / 2 ), g.Width, True		    		    g.Transparency = 0		    g.ForeColor = &c000000		    g.DrawString Me.Cell( row, column ), 20, ( g.Height / 2 ) + ( g.TextSize / 2 ) - 1, g.Width, True		  Else		    g.Transparency = 60		    g.ForeColor = &c000000		    g.DrawString Me.Cell( row, column ), 20, ( g.Height / 2 ) + ( g.TextSize / 2 ), g.Width, True		    		    g.Transparency = 0		    g.ForeColor = &cFFFFFF		    g.DrawString Me.Cell( row, column ), 20, ( g.Height / 2 ) + ( g.TextSize / 2 ) - 1, g.Width, True		  End If		  		  Return True		End Function	#tag EndEvent#tag EndEvents#tag Events lstSets	#tag Event		Sub Open()		  #If DebugBuild Then		    'Me.ColumnWidths = "80%, 0%, 20%"		    'Me.HasHeading = True		    Me.EnableDragReorder = True		  #EndIf		  		  		  Me.AcceptTextDrop		  Dim icns as new IconMBS( "fold", "MACS" )		  Me.FolderIcon      = icns.IconFamily.Small32BitData		  Me.FolderIcon.Mask = icns.IconFamily.Small8BitMask		  		  		  // Populate the listbox		  lstAvailableMovies.DeleteAllRows		  Dim lstBox as Listbox = wndMain.lstMovies		  For i as Integer = 0 to lstBox.ListCount - 1		    If lstBox.Cell( i, 2 ) <> "" Then		      lstAvailableMovies.AddRow lstBox.Cell( i, 0 ), lstBox.Cell( i, 1 ), lstBox.Cell( i, 9 ), lstBox.Cell( i, 5 )		      'lstAvailableMovies.RowPicture( lstAvailableMovies.LastIndex ) = miniconmovie		    End If		  Next		  		  // Populate Sets List		  RefreshSets		  		  Me.SortedColumn = 2		  Me.Sort		End Sub	#tag EndEvent	#tag Event		Sub Change()		  arSet.RemoveEnabled = ( Me.ListIndex > -1 )		End Sub	#tag EndEvent	#tag Event		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean		  If NOT obj.FolderItemAvailable Then Return False		  		  // I'm important right now!		  Me.SetFocus		  		  // Select the hover-index's parent folder.		  Dim HoverRow as Integer = ( y / Me.RowHeight + Me.ScrollPosition )		  If HoverRow > Me.ListCount - 1 Then HoverRow = -1		  'Me.ListIndex = Me.ParentIndex( HoverRow )		  For i as Integer = 0 to Me.ListCount - 1		    Me.Selected( i ) = False		  Next		  Me.Selected( Me.ParentIndex( HoverRow ) ) = True		  		  If HoverRow > -1 Then		    MouseCursor = System.Cursors.Copy		    If Me.RowTag( HoverRow ) = "Folder" Then Me.Expanded( HoverRow ) = True		  Else		    MouseCursor = System.Cursors.StandardPointer		    Me.ListIndex = -1		  End If		  		  Me.Refresh		End Function	#tag EndEvent	#tag Event		Sub ExpandRow(row As Integer)		  // Get sets from movielist and add movies to sets.		  Dim lstBox as Listbox = lstAvailableMovies		  For i as Integer = 0 to lstBox.ListCount - 1		    If lstBox.Cell(i, 2).NthField( "", 1 ) = Me.Cell( row, 0 ) Then		      Me.AddRow lstBox.Cell( i, 0 ), lstBox.Cell(i, 1), lstBox.Cell(i,2)		      'Me.RowPicture( Me.LastIndex ) = miniconmovie		    End If		  Next		  		  // Set expanded state of folder.		  If SetsCollapsed.IndexOf( Me.Cell( row, 0 ) ) >= 0 Then SetsCollapsed.Remove( SetsCollapsed.IndexOf( Me.Cell( row, 0 ) ) )		  		  Me.SortedColumn = 2		  Me.Sort		End Sub	#tag EndEvent	#tag Event		Sub CollapseRow(row As Integer)		  // Save expanded state of folder.		  SetsCollapsed.Append Me.Cell( row, 0 )		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  'If Keyboard.AsyncKeyDown(&h30) Then Return False		  		  If Me.ListIndex >= 0 Then		    		    		    Select Case Asc(Key)		      		    Case 8 // Delete		      If Keyboard.AsyncCommandKey Then		        arSet.PushRemove		        Return True		      End If		      		    Case 28 // Left Arrow		      If Me.RowTag( Me.ListIndex ) = "Folder" Then		        If Keyboard.AsyncCommandKey Then Me.AllExpanded False Else Me.Expanded( Me.ListIndex ) = False		      Else		        Me.ListIndex = Me.ParentIndex( Me.ListIndex )		      End If		      Return True		      		    Case 29 // Right Arrow		      If Me.RowTag( Me.ListIndex ) = "Folder" Then		        If Keyboard.AsyncCommandKey Then Me.AllExpanded True Else Me.Expanded( Me.ListIndex ) = True		      End If		      Return True		      		    Case 13 // Return		      If Me.RowTag( Me.ListIndex ) = "Folder" Then		        Me.Expanded( Me.ListIndex ) = True		        Me.EditCell( Me.ListIndex, 0 )		      End If		      Return True		      		    Case 32 // Space (Same as return)		      If Me.RowTag( Me.ListIndex ) = "Folder" Then		        Me.Expanded( Me.ListIndex ) = True		        Me.EditCell( Me.ListIndex, 0 )		      End If		      Return True		      		    End Select		    		    		  End If		End Function	#tag EndEvent	#tag Event		Sub DoubleClick()		  If Me.RowTag( Me.ListIndex ) = "Folder" Then Me.EditCell( Me.ListIndex, 0 )		End Sub	#tag EndEvent	#tag Event		Sub CellLostFocus(row as Integer, column as Integer)		  		  // If Text didn't change, Return.		  If Me.Cell( row, column ) = OriginalText Then		    OriginalText = ""		    Return		  End If		  		  // Set the new "Set" information		  Dim n as Integer = 0		  For i as Integer = row to Me.NextParentIndex( row ) - 1		    n = n + 1		    SetToMovie( GetFolderItem( Me.Cell( i, 1 ) ), Me.Cell( row, 0 ), n )		  Next		  		  OriginalText = ""		  RefreshSets		End Sub	#tag EndEvent	#tag Event		Sub CellGotFocus(row as Integer, column as Integer)		  OriginalText = Me.Cell( row, column )		End Sub	#tag EndEvent	#tag Event		Sub DragExit(obj As DragItem, action As Integer)		  MouseCursor = System.Cursors.StandardPointer		  Me.ListIndex = -1		  For i as Integer = 0 to Me.ListCount - 1		    Me.Selected( i ) = False		  Next		End Sub	#tag EndEvent	#tag Event		Sub DropObject(obj As DragItem, action As Integer)		  If obj.FolderItemAvailable Then		    SetToMovie( obj.FolderItem, Me.Cell( Me.ListIndex, 0 ), Me.NextParentIndex( Me.ListIndex ) - Me.ParentIndex( Me.ListIndex ) )		    RefreshSets		  End If		  MouseCursor = System.Cursors.StandardPointer		End Sub	#tag EndEvent	#tag Event		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean		  If Me.RowTag( Me.ListIndex ) = "Folder" Or Me.ListIndex = newPosition Then Return False		  		  Dim NewPos as Integer = newPosition		  Dim ParentPos as Integer = Me.ParentIndex( NewPos )		  Dim SetName as String = Me.Cell( ParentPos, 0 )		  		  		  // Don't count the to be moved row.		  If ParentPos > Me.ListIndex Then newPos = newPos + 1		  		  'MsgBox SetName + " - " + str( NewPos - ParentPos )		  SetToMovie( GetFolderItem( Me.Cell( Me.ListIndex, 1 ) ), SetName, NewPos - ParentPos )		  		  Dim NewOrder as Integer = 0		  For i as Integer = ParentPos + 1 to Me.NextParentIndex( newPosition ) - 1		    NewOrder = NewOrder + 1		    		    If i <> Me.ListIndex And i < NewPos Then		      'MsgBox Me.Cell( i, 0 ) + " - SetName: " + SetName + " " + str( NewOrder )		      SetToMovie( GetFolderItem( Me.Cell(i,1) ), SetName, NewOrder )		    ElseIf i <> Me.ListIndex and i >= newPos Then		      'MsgBox Me.Cell( i, 0 ) + " - SetName: " + SetName + " " + str( NewOrder + 1)		      SetToMovie( GetFolderItem( Me.Cell(i,1) ), SetName, NewOrder + 1 )		    End If		    		  Next		  		  RefreshSets		End Function	#tag EndEvent	#tag Event		Function DragRow(drag As DragItem, row As Integer) As Boolean		  If Me.RowTag( row ) = "Folder" Then Return False		End Function	#tag EndEvent#tag EndEvents#tag Events edtSetName	#tag Event		Sub TextChange()		  arSet.AddEnabled = Len( me.Text ) > 0		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  If Keyboard.AsyncKeyDown( &h4C ) or Keyboard.AsyncKeyDown( &h24 ) then		    If Me.Active and Me.Text <> "" Then arSet.PushAdd		  End If		End Function	#tag EndEvent#tag EndEvents#tag Events arSet	#tag Event		Sub Open()		  Me.AddEnabled = False		End Sub	#tag EndEvent	#tag Event		Sub ActionAdd()		  		  For i as Integer = 0 to lstSets.ListCount -1		    If lstSets.RowTag(i) = "Folder" and lstSets.Cell(i,0) = edtSetName.Text Then		      MsgBox kAlreadyExists		      Return		    End If		  Next		  		  // Sort Movies by Date Premiered before adding to sets in order.		  lstAvailableMovies.SortedColumn = 3		  lstAvailableMovies.Sort		  		  // Automagically add movies to the set based on it's name.		  Dim n as Integer = 0		  For i as Integer = 0 to lstAvailableMovies.ListCount - 1		    If lstAvailableMovies.Cell(i, 0).Lowercase.InStr( 0, edtSetName.Text.Lowercase ) > 0 Then		      n = n + 1 // Set Order Nr.		      SetToMovie( GetFolderItem( lstAvailableMovies.Cell(i, 1) ), edtSetName.Text, n )		    End If		  Next		  		  // Sorts Movies by Title		  lstAvailableMovies.SortedColumn = 0		  lstAvailableMovies.Sort		  		  // Sort Sets by Year		  lstSets.SortedColumn = 3		  lstSets.Sort		  		  RefreshSets		  		  // Add Folder if it's not already there.		  Dim b as Boolean		  For i as Integer = lstSets.ListCount -1 DownTo 0		    If lstSets.RowTag( i ) = "Folder" And lstSets.Cell( i, 0 ) = edtSetName.Text Then		      b = True		      Exit		    End If		  Next		  		  If NOT b Then		    lstSets.AddParent( edtSetName.Text )		    lstSets.Expanded( lstSets.LastIndex ) = True		  End If		  		  // Reset editfield and sort the list.		  edtSetName.Text = ""		End Sub	#tag EndEvent	#tag Event		Sub ActionRemove()		  Dim Paths() as String		  		  If lstSets.RowTag( lstSets.ListIndex ) = "Folder" Then		    		    For i as Integer = 0 to lstAvailableMovies.ListCount - 1		      If lstAvailableMovies.Cell( i, 2 ).NthField( "", 1 ) = lstSets.Cell( lstSets.ListIndex, 0 ) Then		        SetToMovie( GetFolderItem( lstAvailableMovies.Cell( i, 1 ) ) )		        lstAvailableMovies.Cell(i,2) = ""		        Paths.Append lstAvailableMovies.Cell( i, 1 )		      End If		    Next		    		    // Remove Collapsed Set State		    For i as Integer = 0 to SetsCollapsed.Ubound		      If SetsCollapsed(i) = lstSets.Cell( lstSets.ListIndex, 0 ) Then SetsCollapsed.Remove(i)		    Next		    		    lstSets.RemoveFolder( lstSets.ListIndex )		    		  Else		    		    SetToMovie( GetFolderItem( lstSets.Cell( lstSets.ListIndex, 1 ) ) )		    		    For i as Integer = 0 to lstAvailableMovies.ListCount - 1		      If lstSets.Cell( lstSets.ListIndex, 1 ) = lstAvailableMovies.Cell( i, 1 ) Then lstAvailableMovies.Cell( i, 2 ) = ""		      Paths.Append lstSets.Cell( lstSets.ListIndex, 1 )		    Next		    		    lstSets.RemoveRow( lstSets.ListIndex )		    		  End If		  		  // remove set information from main window		  For i as Integer = 0 to Paths.Ubound		    		    For n as Integer = 0 to wndMain.lstMovies.ListCount - 1		      If wndMain.lstMovies.Cell( n, 1 ) = Paths(i) Then wndMain.lstMovies.Cell( n, 1 ) = ""		    Next		    		  Next		  		  'lstSets.RemoveRow( lstSets.ListIndex )		  RefreshSets		End Sub	#tag EndEvent#tag EndEvents#tag Events split	#tag Event		Sub Open()		  Me.Attach lstSets		  Me.Attach lstAvailableMovies		  Me.Attach edtSetName		  Me.Attach arSet, True		  		  If Prefs.integerForKey("SetsManagerSplitterPOS") > 0 Then Me.Left = Prefs.integerForKey("SetsManagerSplitterPOS")		  		  lstAvailableMovies.Width = Me.Left - lstAvailableMovies.Left		  		  lstSets.Left = Me.Left + Me.Width		  lstSets.Width = self.Width - 20 - lstSets.Left		  		  arSet.Left = Me.Left + Me.Width		  		  edtSetName.Left = arSet.Left + arSet.Width + 12		  edtSetName.Width = self.Width - 20 - edtSetName.Left		End Sub	#tag EndEvent	#tag Event		Sub Moved(distance as Integer)		  // TODO:		  // Save Splitter position		  Prefs.setIntegerValue( "SetsManagerSplitterPOS", Me.Left )		End Sub	#tag EndEvent#tag EndEvents