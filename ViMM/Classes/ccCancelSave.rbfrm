#tag WindowBegin ContainerControl ccCancelSave   AcceptFocus     =   ""   AcceptTabs      =   True   AutoDeactivate  =   True   BackColor       =   &hFFFFFF   Backdrop        =   ""   Enabled         =   True   EraseBackground =   True   HasBackColor    =   False   Height          =   22   HelpTag         =   ""   InitialParent   =   ""   Left            =   32   LockBottom      =   ""   LockLeft        =   ""   LockRight       =   ""   LockTop         =   ""   TabIndex        =   0   TabPanelIndex   =   0   TabStop         =   True   Top             =   32   UseFocusRing    =   ""   Visible         =   True   Width           =   200   Begin Pushbutton btnRight      AutoDeactivate  =   True      Bold            =   ""      ButtonStyle     =   0      Cancel          =   ""      Caption         =   "#Loc.dlgOK"      Default         =   True      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   120      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   0      Underline       =   ""      Visible         =   True      Width           =   80   End   Begin PushbuttonPro btnLeft      AutoDeactivate  =   True      Bold            =   ""      ButtonStyle     =   0      Cancel          =   ""      Caption         =   "#Loc.dlgCancel"      Default         =   False      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   28      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   False      LockRight       =   True      LockTop         =   False      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   0      Underline       =   ""      Visible         =   True      Width           =   80   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Sub ContentsChanged()		  '		End Sub	#tag EndEvent	#tag Event		Function ContextualMenuAction(hitItem as MenuItem) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Function DragEnter(obj As DragItem, action As Integer) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Sub DragExit(obj As DragItem, action As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Sub DropObject(obj As DragItem, action As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Sub EnableMenuItems()		  '		End Sub	#tag EndEvent	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Sub MouseDrag(X As Integer, Y As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseEnter()		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseExit()		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseMove(X As Integer, Y As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Function MouseWheel(X As Integer, Y As Integer, DeltaX as Integer, DeltaY as Integer) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Sub Moved()		  '		End Sub	#tag EndEvent	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  '		End Sub	#tag EndEvent	#tag Event		Sub Restore()		  '		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub DisableOK()		  #If TargetMacOS		    btnRight.Enabled = False		  #Else		    btnLeft.Enabled = False		  #EndIf		End Sub	#tag EndMethod	#tag Hook, Flags = &h0		Event ActionCancel()	#tag EndHook	#tag Hook, Flags = &h0		Event ActionOK()	#tag EndHook	#tag Property, Flags = &h0		CaptionCancel As String	#tag EndProperty	#tag Property, Flags = &h0		CaptionOK As String	#tag EndProperty#tag EndWindowCode#tag Events btnRight	#tag Event		Sub Action()		  #If TargetMacOS		    ActionOK		  #Else		    ActionCancel		  #EndIf		End Sub	#tag EndEvent	#tag Event		Sub Open()		  'Me.BezelStyle = PushButtonExtension.NSBezelStyle.NSTexturedRoundedBezelStyle		  		  #If TargetMacOS		    If CaptionOK = "" Then Me.Caption = Loc.dlgOK Else Me.Caption = CaptionOK		    me.Cancel  = False		    me.Default = True		  #Else		    If CaptionCancel = "" Then Me.Caption = Loc.dlgCancel Else Me.Caption = CaptionCancel		    me.Cancel  = True		    me.Default = False		  #EndIf		End Sub	#tag EndEvent#tag EndEvents#tag Events btnLeft	#tag Event		Sub Action()		  #If TargetMacOS		    ActionCancel		  #Else		    ActionOK		  #EndIf		End Sub	#tag EndEvent	#tag Event		Sub Open()		  'Me.BezelStyle = PushButtonExtension.NSBezelStyle.NSTexturedRoundedBezelStyle		  		  #If TargetMacOS		    If CaptionCancel = "" Then Me.Caption = Loc.dlgCancel Else Me.Caption = CaptionCancel		    me.Cancel  = True		    me.Default = False		  #Else		    If CaptionOK = "" Then Me.Caption = Loc.dlgOK Else Me.Caption = CaptionOK		    me.Cancel  = False		    me.Default = True		  #EndIf		  		  btnLeft.Left = btnRight.Left - 10 - Me.Width		  		  		End Sub	#tag EndEvent#tag EndEvents