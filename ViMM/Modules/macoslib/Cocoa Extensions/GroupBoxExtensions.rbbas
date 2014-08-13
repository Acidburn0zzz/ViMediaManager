#tag ModuleProtected Module GroupBoxExtensions	#tag Method, Flags = &h0		Function BorderColor(Extends g as GroupBox) As Color		  		  #if TargetCocoa		    		    declare function borderColor lib CocoaLib selector "borderColor" (obj_id as Integer) as Ptr		    		    return new NSColor(borderColor(g.handle))		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub BorderColor(Extends g as GroupBox, Assigns value as Color)		  		  #if TargetCocoa		    		    declare sub setBorderColor lib CocoaLib selector "setBorderColor:" (obj_id as Integer, value as Ptr)		    		    setBorderColor(g.handle, new NSColor(value))		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function BorderType(Extends g as GroupBox) As NSBorderType		  		  #if TargetCocoa		    		    declare function borderType lib CocoaLib selector "borderType" (obj_id as Integer) as NSBorderType		    		    return borderType(g.handle)		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub BorderType(Extends g as GroupBox, Assigns value as NSBorderType)		  		  #if TargetCocoa		    		    declare sub setBorderType lib CocoaLib selector "setBorderType:" (obj_id as Integer, value as NSBorderType)		    		    setBorderType(g.handle, value)		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function BorderWidth(Extends g as GroupBox) As Single		  		  #if TargetCocoa		    		    declare function borderWidth lib CocoaLib selector "borderWidth" (obj_id as Integer) as Single		    		    return borderWidth(g.handle)		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub BorderWidth(Extends g as GroupBox, Assigns value as Single)		  		  #if TargetCocoa		    		    declare sub setBorderWidth lib CocoaLib selector "setBorderWidth:" (obj_id as Integer, value as Single)		    		    setBorderWidth(g.handle, value)		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function BoxType(Extends g as GroupBox) As NSBoxType		  		  #if TargetCocoa		    		    declare function boxType lib CocoaLib selector "boxType" (obj_id as Integer) as NSBoxType		    		    return boxType(g.handle)		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub BoxType(Extends g as GroupBox, Assigns value as NSBoxType)		  		  #if TargetCocoa		    		    declare sub setBoxType lib CocoaLib selector "setBoxType:" (obj_id as Integer, value as NSBoxType)		    		    setBoxType(g.handle, value)		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function CornerRadius(Extends g as GroupBox) As Single		  		  #if TargetCocoa		    		    declare function cornerRadius lib CocoaLib selector "cornerRadius" (obj_id as Integer) as Single		    		    return cornerRadius(g.handle)		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub CornerRadius(Extends g as GroupBox, Assigns value as Single)		  		  #if TargetCocoa		    		    declare sub setCornerRadius lib CocoaLib selector "setCornerRadius:" (obj_id as Integer, value as Single)		    		    setCornerRadius(g.handle, value)		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function FillColor(Extends g as GroupBox) As Color		  		  #if TargetCocoa		    		    declare function fillColor lib CocoaLib selector "fillColor" (obj_id as Integer) as Ptr		    		    return new NSColor(fillColor(g.handle))		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub FillColor(Extends g as GroupBox, Assigns value as Color)		  		  #if TargetCocoa		    		    declare sub setFillColor lib CocoaLib selector "setFillColor:" (obj_id as Integer, value as Ptr)		    		    setFillColor(g.handle, new NSColor(value))		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function TitlePosition(Extends g as GroupBox) As NSTitlePosition		  		  #if TargetCocoa		    		    declare function titlePosition lib CocoaLib selector "titlePosition" (obj_id as Integer) as NSTitlePosition		    		    return titlePosition(g.handle)		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub TitlePosition(Extends g as GroupBox, Assigns value as NSTitlePosition)		  		  #if TargetCocoa		    		    declare sub setTitlePosition lib CocoaLib selector "setTitlePosition:" (obj_id as Integer, value as NSTitlePosition)		    		    setTitlePosition(g.handle, value)		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function Transparent(Extends g as GroupBox) As Boolean		  		  #if TargetCocoa		    		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Integer) as Boolean		    		    return isTransparent(g.handle)		    		  #else		    		    #pragma unused g		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub Transparent(Extends g as GroupBox, Assigns value as Boolean)		  		  #if TargetCocoa		    		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Integer, value as Boolean)		    		    setTransparent(g.handle, value)		    		  #else		    		    #pragma unused g		    #pragma unused value		    		  #endif		  		End Sub	#tag EndMethod	#tag Enum, Name = NSBorderType, Type = Integer, Flags = &h0		NSNoBorder		  NSLineBorder		  NSBezelBorder		NSGrooveBorder	#tag EndEnum	#tag Enum, Name = NSBoxType, Type = Integer, Flags = &h0		NSBoxPrimary		  NSBoxSecondary		  NSBoxSeparator		  NSBoxOldStyle		NSBoxCustom	#tag EndEnum	#tag Enum, Name = NSTitlePosition, Type = Integer, Flags = &h0		NSNoTitle		  NSAboveTop		  NSAtTop		  NSBelowTop		  NSAboveBottom		  NSAtBottom		NSBelowBottom	#tag EndEnum	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule