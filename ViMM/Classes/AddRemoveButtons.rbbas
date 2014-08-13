#tag ClassProtected Class AddRemoveButtonsInherits Canvas	#tag Event		Sub DropObject(obj As DragItem, action As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Sub EnableMenuItems()		  '		End Sub	#tag EndEvent	#tag Event		Sub GotFocus()		  '		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  '		End Function	#tag EndEvent	#tag Event		Sub LostFocus()		  '		End Sub	#tag EndEvent	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  mButton = kButtonNoButton		  		  If x > 0 and x < me.Width / 2 and mAddEnabled then mButton = kButtonAdd		  If x < Width and x >= me.Width / 2 and mRemoveEnabled then mButton = kButtonRemove		  		  Update		  Return True		End Function	#tag EndEvent	#tag Event		Sub MouseDrag(X As Integer, Y As Integer)		  mButton = kButtonNoButton		  If Y > 0 and Y < me.Height then		    If X > 0 and X < me.Width / 2 and mAddEnabled then mButton = kButtonAdd		    If X < Width and X >= me.Width / 2 and mRemoveEnabled then mButton = kButtonRemove		  End If		  Update		End Sub	#tag EndEvent	#tag Event		Sub MouseEnter()		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseExit()		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseMove(X As Integer, Y As Integer)		  '		End Sub	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  If Y > 0 and Y < me.Height then		    If X > 0 and X < me.Width / 2 and mAddEnabled then ActionAdd		    If X < Width and X >= me.Width / 2 and mRemoveEnabled then ActionRemove		  End If		  mButton = kButtonNoButton		  Update		End Sub	#tag EndEvent	#tag Event		Sub Open()		  mAddEnabled = True		  mRemoveEnabled = False		  Open		End Sub	#tag EndEvent	#tag Event		Sub Paint(g As Graphics, areas() As REALbasic.Rect)		  Update		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Function AddEnabled() As Boolean		  Me.Reload		  Update		  Return mAddEnabled		  'Refresh		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub AddEnabled(Assigns pEnabled as Boolean)		  mAddEnabled = pEnabled		  Me.Reload		  Update		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DrawMinusButton(Pressed as Boolean = False)		  Dim g as Graphics = me.Graphics		  		  If Pressed then		    g.ForeColor = &cAFAFAF		    g.FillRect Width / 2, 0, Width, Height / 2		    g.ForeColor = &cA8A8A8		    g.FillRect Width / 2, Height / 2, Width, Height		  End If		  		  Dim HalfWidth as Integer = Width / 2		  Dim HalfHeight as Integer = Height / 2		  		  if mRemoveEnabled then g.ForeColor = EnabledTopColor else g.ForeColor = DisabledTopColor		  g.DrawLine Width - ( HalfWidth / 2 ) - 4, HalfHeight - 1, Width - ( HalfWidth / 2 ) + 3, HalfHeight - 1		  		  if mRemoveEnabled then g.ForeColor = EnabledBottomColor else g.ForeColor = DisabledBottomColor		  g.DrawLine Width - ( HalfWidth / 2 ) - 4, HalfHeight, Width - ( HalfWidth / 2 ) + 3, HalfHeight		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DrawPlusButton(Pressed as Boolean = False)		  Dim g as Graphics = me.Graphics		  		  If Pressed then		    g.ForeColor = &cAFAFAF		    g.FillRect 0, 0, Width / 2, Height / 2		    g.ForeColor = &cA8A8A8		    g.FillRect 0, Height / 2, Width / 2, Height		  End If		  		  Dim HalfWidth as Integer = Width / 2		  Dim HalfHeight as Integer = Height / 2		  		  If mAddEnabled Then g.ForeColor = EnabledTopColor Else g.ForeColor = DisabledTopColor		  g.DrawLine ( HalfWidth / 2 ) - 4, HalfHeight - 1, ( HalfWidth / 2 ) + 3, HalfHeight - 1		  		  g.DrawLine ( HalfWidth / 2 ),     HalfHeight - 4, ( HalfWidth / 2 ),     HalfHeight		  g.DrawLine ( HalfWidth / 2 ) - 1, HalfHeight - 4, ( HalfWidth / 2 ) - 1, HalfHeight		  		  If mAddEnabled Then g.ForeColor = EnabledBottomColor Else g.ForeColor = DisabledBottomColor		  g.DrawLine ( HalfWidth / 2 ) - 4, HalfHeight, ( HalfWidth / 2 ) + 3, HalfHeight		  		  g.DrawLine ( HalfWidth / 2 ),     HalfHeight + 3, ( HalfWidth / 2 ),     HalfHeight		  g.DrawLine ( HalfWidth / 2 ) - 1, HalfHeight + 3, ( HalfWidth / 2 ) - 1, HalfHeight		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub PushAdd()		  ActionAdd		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub PushRemove()		  ActionRemove		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function RemoveEnabled() As Boolean		  Return mRemoveEnabled		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub RemoveEnabled(Assigns pEnabled as Boolean)		  mRemoveEnabled = pEnabled		  Update		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Update()		  // Setup		  Dim g as Graphics = me.Graphics		  		  // Top WhiteBG		  g.ForeColor = &cFFFFFF		  g.FillRect 0, 0, me.Width, me.Height / 2		  		  // Bottom SilverBG		  g.ForeColor = &cF1F1F1		  g.FillRect 0, me.Height / 2, me.Width, me.Height		  		  		  // Normal state		  If mButton <> kButtonAdd    then DrawPlusButton		  If mButton <> kButtonRemove then DrawMinusButton		  		  // Down State		  If mButton = kButtonAdd    And mAddEnabled then DrawPlusButton True		  If mButton = kButtonRemove then DrawMinusButton True		  		  g.ForeColor = &c979797		  g.DrawLine 0, 1, 0, Height - 2 // Left		  g.DrawLine Width - 1, 1, Width - 1, Height - 2 // Right		  g.DrawLine 0, Height - 2, Width - 1, Height - 2 // Bottom		  g.DrawLine 22, 1, 22, Height - 2 // Center		  		  g.ForeColor = &c7e7e7e		  g.DrawLine 0, 1, Width, 1 // Top		  g.ForeColor = &cD2D2D2		  g.DrawLine 0, 0, Width, 0 // Top Shadow		  g.ForeColor = &cf1f1f1		  g.DrawLine 0, Height - 1, Width, Height - 1 // Bottom Highlight		End Sub	#tag EndMethod	#tag Hook, Flags = &h0		Event ActionAdd()	#tag EndHook	#tag Hook, Flags = &h0		Event ActionRemove()	#tag EndHook	#tag Hook, Flags = &h0		Event Open()	#tag EndHook	#tag Property, Flags = &h21		Private mAddEnabled As Boolean = True	#tag EndProperty	#tag Property, Flags = &h21		Private mButton As Integer	#tag EndProperty	#tag Property, Flags = &h21		Private mRemoveEnabled As Boolean = False	#tag EndProperty	#tag Constant, Name = DisabledBottomColor, Type = Color, Dynamic = False, Default = \"&c9D9D9D", Scope = Private	#tag EndConstant	#tag Constant, Name = DisabledTopColor, Type = Color, Dynamic = False, Default = \"&cA3A3A3", Scope = Private	#tag EndConstant	#tag Constant, Name = EnabledBottomColor, Type = Color, Dynamic = False, Default = \"&c4B4B4B", Scope = Private	#tag EndConstant	#tag Constant, Name = EnabledTopColor, Type = Color, Dynamic = False, Default = \"&c505050", Scope = Private	#tag EndConstant	#tag Constant, Name = kButtonAdd, Type = Integer, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = kButtonNoButton, Type = Integer, Dynamic = False, Default = \"0", Scope = Private	#tag EndConstant	#tag Constant, Name = kButtonRemove, Type = Double, Dynamic = False, Default = \"2", Scope = Private	#tag EndConstant	#tag Constant, Name = kStateDown, Type = Integer, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = kStateUp, Type = Integer, Dynamic = False, Default = \"0", Scope = Private	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="AcceptFocus"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AcceptTabs"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AutoDeactivate"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Backdrop"			Visible=true			Group="Appearance"			Type="Picture"			EditorType="Picture"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="DoubleBuffer"			Visible=true			Group="Behavior"			InitialValue="False"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="EraseBackground"			Visible=true			Group="Behavior"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Height"			Visible=true			Group="Position"			InitialValue="22"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="HelpTag"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="InitialParent"			Group="Initial State"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockBottom"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockLeft"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockRight"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockTop"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabIndex"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabPanelIndex"			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabStop"			Visible=true			Group="Position"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="UseFocusRing"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Visible=true			Group="Position"			InitialValue="45"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass