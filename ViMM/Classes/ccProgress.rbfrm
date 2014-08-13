#tag WindowBegin ContainerControl ccProgress   AcceptFocus     =   ""   AcceptTabs      =   True   AutoDeactivate  =   True   BackColor       =   &hFFFFFF   Backdrop        =   ""   Enabled         =   True   EraseBackground =   True   HasBackColor    =   False   Height          =   58   HelpTag         =   ""   InitialParent   =   ""   Left            =   32   LockBottom      =   ""   LockLeft        =   ""   LockRight       =   ""   LockTop         =   ""   TabIndex        =   0   TabPanelIndex   =   0   TabStop         =   True   Top             =   54   UseFocusRing    =   ""   Visible         =   True   Width           =   300   Begin ProgressBar pgBar      AutoDeactivate  =   True      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   12      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   False      Maximum         =   0      Scope           =   0      TabPanelIndex   =   0      Top             =   28      Value           =   0      Visible         =   True      Width           =   250   End   Begin Label lblAction      AutoDeactivate  =   True      Bold            =   True      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   14      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   12      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   False      Multiline       =   ""      Scope           =   0      Selectable      =   False      TabIndex        =   0      TabPanelIndex   =   0      Text            =   "Action"      TextAlign       =   0      TextColor       =   &h000000      TextFont        =   "System"      TextSize        =   10      TextUnit        =   0      Top             =   10      Transparent     =   False      Underline       =   ""      Visible         =   True      Width           =   276   End   Begin Label lblDebug      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   13      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   12      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   False      Multiline       =   ""      Scope           =   0      Selectable      =   False      TabIndex        =   2      TabPanelIndex   =   0      Text            =   "Debug"      TextAlign       =   0      TextColor       =   &h000000      TextFont        =   "System"      TextSize        =   10      TextUnit        =   0      Top             =   75      Transparent     =   False      Underline       =   ""      Visible         =   True      Width           =   260   End   Begin Canvas cvsCancel      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      DoubleBuffer    =   False      Enabled         =   True      EraseBackground =   True      Height          =   14      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   274      LockBottom      =   False      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      Top             =   32      UseFocusRing    =   True      Visible         =   True      Width           =   14   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  g.DrawGradient( RGBa( 91, 91, 91 ), RGBa( 86, 86, 86 ), 0, 0, g.Width, g.Height )		  		  g.ForeColor = RGBa( 100, 100, 100, .6 )		  g.DrawLine 0, 0, g.Width, 0		  		  g.ForeColor = RGBa( 0, 0, 0, .10 )		  g.DrawLine 0, g.Height - 1, g.Width, g.Height - 1		End Sub	#tag EndEvent	#tag Property, Flags = &h1		Protected Pressed As Boolean = False	#tag EndProperty#tag EndWindowCode#tag Events pgBar	#tag Event		Sub Open()		  me.Refresh		End Sub	#tag EndEvent#tag EndEvents#tag Events cvsCancel	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  'g.FillRect 0, 0, g.Width, g.Height		  		  If NOT Pressed Then g.ForeColor = RGBa( 70, 70, 70 ) Else g.ForeColor = RGBa( 55, 55, 55 )		  If NOT me.Active Then g.ForeColor = RGBa( 75, 75, 75 )		  g.FillOval 0, 0, g.Width, g.Height		  		  g.ForeColor = RGBa( 100, 100, 100 )		  g.PenWidth = 2		  g.PenHeight = 2		  		  g.DrawLine 3, 3, g.Width - 5, g.Height - 5		  g.DrawLine 3, g.Height - 5, g.Width - 5, 3		End Sub	#tag EndEvent	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  If x > 0 And x < Me.Width Then		    If y > 0 And Y < Me.Height Then		      Pressed = True		      Me.Reload		      		      Return True		    End If		  End If		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  If x > 0 And x < Me.Width Then		    If y > 0 And Y < Me.Height Then		      Pressed = False		      Me.Reload		      ' Do Cancel		    End If		  End If		End Sub	#tag EndEvent	#tag Event		Sub Activate()		  me.Reload		End Sub	#tag EndEvent#tag EndEvents