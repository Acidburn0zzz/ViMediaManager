#tag WindowBegin Window wndMessage   BackColor       =   &hFFFFFF   Backdrop        =   ""   CloseButton     =   False   Composite       =   False   Frame           =   1   FullScreen      =   False   HasBackColor    =   False   Height          =   131   ImplicitInstance=   True   LiveResize      =   False   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   False   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   True   MinHeight       =   64   MinimizeButton  =   False   MinWidth        =   64   Placement       =   3   Resizeable      =   False   Title           =   ""   Visible         =   True   Width           =   420   Begin PushButton btnOK      AutoDeactivate  =   True      Bold            =   ""      ButtonStyle     =   0      Cancel          =   True      Caption         =   "#Loc.dlgOK"      Default         =   True      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   321      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   91      Underline       =   ""      Visible         =   True      Width           =   79   End   Begin cvsLogo ViMMLogo      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   64      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   24      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      Top             =   16      UseFocusRing    =   True      Visible         =   True      Width           =   64   End   Begin Canvas cvsMessage      AcceptFocus     =   ""      AcceptTabs      =   False      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   59      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   106      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      Top             =   21      UseFocusRing    =   True      Visible         =   True      Width           =   294   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  #If TargetCocoa Then		    		    If x >= 0 And X <= Me.Width And _		      Y >= 0 And Y <= Me.Height Then		      Return True		    End If		    		  #EndIf		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  #If TargetCocoa Then		    		    If x >= 0 And X <= Me.Width And _		      Y >= 0 And Y <= Me.Height Then		      Close		    End If		    		  #EndIf		End Sub	#tag EndEvent	#tag Event		Sub Open()		  #If TargetCocoa Then Me.CloseButton = True		  		  Dim sx1 as Integer = msgMessage.InStr( 0, chr(13) )		  		  If sx1 > 0 Then		    Message = Trim( msgMessage.Right( msgMessage.Len - sx1 ) )		    Title = Trim( msgMessage.Left( sx1 -1 ) )		    'cvsMessage.Reload		  Else		    Title = Trim( msgMessage )		  End If		  		  'Self.Height = StringHeight		End Sub	#tag EndEvent	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  'If App.ScalingFactor < 2 Then Return		  		  // Fake an 'OK' button since the thread process doesn't draw UI elements correctly under Cocoa		  #If TargetCocoa THen		    Dim btnWidth, btnHeight as Integer		    btnWidth = 79		    btnHeight = 21		    		    // Shadow		    g.ForeColor = &cCCCCCC		    g.FillRoundRect Width - 20 - btnWidth, Height - 19 - btnHeight, btnWidth, btnHeight + 1, 10, 10		    		    // Background		    g.ForeColor = &cFFFFFF		    g.FillRoundRect Width - 20 - btnWidth, Height - 19 - btnHeight, btnWidth, btnHeight, 10, 10		    		    		    g.ForeColor = &cF5F5F5		    g.FillRoundRect Width - 20 - btnWidth, Height - 19 - ( btnHeight / 2 ), btnWidth, ( btnHeight / 2 ), 10, 10		    		    // Border		    g.ForeColor = &c999999		    g.DrawRoundRect Width - 20 - btnWidth, Height - 19 - btnHeight, btnWidth, btnHeight, 10, 10		    		    // OK		    g.ForeColor = &c000000		    g.DrawString Loc.dlgOK, ( Width - 20 - btnWidth ) + ( ( btnWidth / 2 ) - ( g.StringWidth( Loc.dlgOK ) / 2 ) ), Height - 19 - btnHeight + 1 + ( g.StringHeight( Loc.dlgOK, -1 ) / 2 )		  #EndIf		End Sub	#tag EndEvent	#tag Property, Flags = &h0		Message As String	#tag EndProperty	#tag Property, Flags = &h0		Title As String	#tag EndProperty#tag EndWindowCode#tag Events btnOK	#tag Event		Sub Action()		  Close		End Sub	#tag EndEvent#tag EndEvents#tag Events cvsMessage	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  		  Dim TextTop as Integer = g.TextSize		  If Message <> "" Then g.Bold = True		  g.DrawString Title, 0, TextTop, Me.Width		  		  TextTop = TextTop + g.StringHeight( Title, Me.Width ) + g.TextSize		  		  g.Bold = False		  g.DrawString Message, 0, TextTop, Me.Width		  		  TextTop = TextTop + g.StringHeight( Message, Me.Width ) + g.TextSize		  		  If Message <> "" Then Self.Height = 86 + TextTop' Else Self.Height = 95		End Sub	#tag EndEvent#tag EndEvents