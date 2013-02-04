#tag WindowBegin ContainerControl ccSearch   AcceptFocus     =   ""   AcceptTabs      =   True   AutoDeactivate  =   True   BackColor       =   16777215   Backdrop        =   ""   Enabled         =   True   EraseBackground =   True   HasBackColor    =   False   Height          =   33   HelpTag         =   ""   InitialParent   =   ""   Left            =   32   LockBottom      =   ""   LockLeft        =   True   LockRight       =   ""   LockTop         =   ""   TabIndex        =   0   TabPanelIndex   =   0   TabStop         =   True   Top             =   32   UseFocusRing    =   False   Visible         =   True   Width           =   300   Begin TextField edtSearch      AcceptTabs      =   False      Alignment       =   0      AutoDeactivate  =   True      AutomaticallyCheckSpelling=   False      BackColor       =   16777215      Bold            =   ""      Border          =   False      CueText         =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   16      HelpTag         =   ""      Index           =   -2147483648      Italic          =   ""      Left            =   27      LimitText       =   0      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      Mask            =   ""      Password        =   ""      ReadOnly        =   ""      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      Text            =   ""      TextColor       =   0      TextFont        =   "System"      TextSize        =   12      TextUnit        =   0      Top             =   9      Underline       =   ""      UseFocusRing    =   False      Visible         =   True      Width           =   246   End   Begin Canvas cvsSearch      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   17      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   11      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      Top             =   9      UseFocusRing    =   True      Visible         =   True      Width           =   17   End   Begin Canvas cvsRemove      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   17      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   273      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   True      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      TabStop         =   True      Top             =   9      UseFocusRing    =   True      Visible         =   True      Width           =   17   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  		  Dim Ratio, EndRatio as Double		  Dim StartColor, EndColor, BorderTopColor, BorderBottomColor, SearchStartColor, SearchEndColor as Color		  		  // Old searchfield colors based on "Automatic".		  'StartColor        = RGB( 156, 165, 179 )		  'EndColor          = RGB( 109, 121, 135 )		  'BorderTopColor    = RGB( 186, 194, 202 )		  'BorderBottomColor = RGB( 129, 141, 150 )		  		  StartColor = RGB( 229, 229, 229 )		  EndColor   = RGB( 179, 179, 179 )		  BorderTopColor = RGB( 238, 238, 238 )		  BorderBottomColor = rgb(195, 195, 195)//RGB( 134, 134, 134 ) //RGB( 184, 184, 184 )		  		  SearchStartColor = RGB( 240, 240, 240 )		  SearchEndColor   = RGB( 255, 255, 255 )		  		  // Draw Background		  g.DrawGradient StartColor, EndColor, 0, 0, g.Width, g.Height		  		  // Draw top border		  g.ForeColor = BorderTopColor		  g.DrawLine 0, 0, g.Width, 0		  		  // Draw bottom border		  g.ForeColor = BorderBottomColor		  'g.DrawLine 0, g.Height -1, g.Width, g.Height -1		  		  // Draw Right Border		  g.DrawLine g.Width - 1, 0, g.Width - 1, g.Height - 1		  		  // Draw Search Field.		  // Drop Shadow		  'g.ForeColor = RGB( 140, 155, 175 )		  g.ForeColor = BorderTopColor		  g.DrawRoundRect 9, 8, g.Width - 18, 19, 6, 6		  		  // Border		  g.ForeColor = RGB( 134, 134, 134 )		  g.DrawRoundRect 9, 7, g.Width - 18, 19, 6, 6		  		  // Fill		  g.ForeColor = RGB( 255, 255, 255 )		  g.FillRoundRect 10, 8, g.Width - 20, 17, 6, 6		  		  		  Paint( g )		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub Reset()		  // Making sure the text is reset to "" and triggers the textchange event.		  		  edtSearch.Text = " "		  edtSearch.Text = ""		End Sub	#tag EndMethod	#tag Hook, Flags = &h0		Event DoSearch(SearchText as String)	#tag EndHook	#tag Hook, Flags = &h0		Event Paint(g as Graphics)	#tag EndHook	#tag Hook, Flags = &h0		Event ResetSearch()	#tag EndHook	#tag Property, Flags = &h0		LiveSearch As Boolean = False	#tag EndProperty	#tag Property, Flags = &h1		Protected OldText As String	#tag EndProperty	#tag Property, Flags = &h1		Protected RemoveState As Integer	#tag EndProperty	#tag Constant, Name = CueText, Type = String, Dynamic = True, Default = \"Search Title or enter IMDb ID", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Search Title or enter IMDb ID"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Zoek titel of voer in IMDb ID"		#Tag Instance, Platform = Any, Language = sv, Definition  = \"S\xC3\xB6k efter titel eller ange IMDb-ID"		#Tag Instance, Platform = Any, Language = de, Definition  = \"Suche nach dem Titel oder der IMDb ID"		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher le titre sur IMDB"	#tag EndConstant#tag EndWindowCode#tag Events edtSearch	#tag Event		Sub TextChange()		  If LiveSearch And OldText <> Me.Text Then		    DoSearch( Me.Text )		    OldText = Me.Text		  End If		  		  If RemoveState = 0 And Me.Text.Len >= 0 Then		    RemoveState = 1		    cvsRemove.Reload		  ElseIf RemoveState = 1 And Me.Text.len = 0 Then		    RemoveState = 0		    cvsRemove.Reload		    ResetSearch		  End If		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  		  If Keyboard.AsyncKeyDown( &h4C ) Or Keyboard.AsyncKeyDown( &h24 ) And Me.Active Then		    DoSearch( Me.Text )		    		  ElseIf Keyboard.AsyncKeyDown( &h35 ) Then		    Me.Text = ""		    RemoveState = 0		    cvsRemove.Reload		    ResetSearch		    		  End If		End Function	#tag EndEvent	#tag Event		Sub GotFocus()		  If Me.Text.InStr( 0, CueText ) > 0 Then Me.Text = ""		  Me.TextColor = &c000000		  Me.TextSize  = 12		End Sub	#tag EndEvent	#tag Event		Sub LostFocus()		  'If me.Text = "" Then Me.Text = CueText		  'Me.TextColor = &cA0A0A0		  'Me.TextSize = 12		End Sub	#tag EndEvent#tag EndEvents#tag Events cvsSearch	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  g.DrawPicture searchglass, ( g.Width / 2 ) - ( searchglass.Width / 2 ), ( g.Height / 2 ) - ( searchglass.Height / 2 )		End Sub	#tag EndEvent#tag EndEvents#tag Events cvsRemove	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  // Visible		  If RemoveState = 1 Then		    g.DrawPicture remove, ( g.Width / 2 ) - ( 12 / 2 ), ( g.Height / 2 ) - ( 12 / 2 ), 12, 12, 0, 0, remove.Width, remove.Height		    		    // Pressed		  ElseIf RemoveState = 2 Then		    g.DrawPicture RemovePressed, ( g.Width / 2 ) - ( 12 / 2 ), ( g.Height / 2 ) - ( 12 / 2 ), 12, 12, 0, 0, removepressed.Width, removepressed.Height		  End If		End Sub	#tag EndEvent	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  RemoveState = 2		  Me.Reload		  Return True		End Function	#tag EndEvent	#tag Event		Sub MouseDrag(X As Integer, Y As Integer)		  If x < 0 Or x > Me.Width Or _		    y < 0 Or y > Me.Height Then		    RemoveState = 1		  ElseIf x > 0 Or X < me.Width Or _		    Y > 0 Or Y < Me.Height Then		    RemoveState = 2		  End If		  		  me.Reload		End Sub	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  If X > 0 And Y > 0 And X < Width And Y < Height then		    RemoveState = 1		    edtSearch.Text = ""		    ResetSearch		  Else		    If edtSearch.Text.Len >= 0 Then RemoveState = 1 Else RemoveState = 0		  End If		  		  Me.Reload		End Sub	#tag EndEvent#tag EndEvents