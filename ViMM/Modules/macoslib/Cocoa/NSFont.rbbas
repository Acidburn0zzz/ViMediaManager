#tag ClassClass NSFontInherits NSObject	#tag Method, Flags = &h0		Function AdvancementForGlyph(aGlyph as UInt32) As Cocoa.NSSize		  		  #if TargetMacOS		    declare function advancementForGlyph lib CocoaLib selector "advancementForGlyph:" (obj_id as Ptr, aGlyph as UInt32) as Cocoa.NSSize		    		    return advancementForGlyph(self, aGlyph)		    		  #else		    #pragma unused aGlyph		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Ascender() As Single		  		  #if TargetMacOS		    declare function ascender lib CocoaLib selector "ascender" (obj_id as Ptr) as Single		    		    return ascender(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function BoldSystemFont(fontSIze as Single) As NSFont		  		  #if TargetMacOS		    declare function boldSystemFontOfSize lib CocoaLib selector "boldSystemFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = boldSystemFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function BoundingRectForFont() As Cocoa.NSRect		  		  #if TargetMacOS		    declare function boundingRectForFont lib CocoaLib selector "boundingRectForFont" (obj_id as Ptr) as Cocoa.NSRect		    		    return boundingRectForFont(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function BoundingRectForGlyph(aGlyph as UInt32) As Cocoa.NSRect		  		  #if TargetMacOS		    declare function boundingRectForGlyph lib CocoaLib selector "boundingRectForGlyph:" (obj_id as Ptr, aGlyph as UInt32) as Cocoa.NSRect		    		    return boundingRectForGlyph(self, aGlyph)		    		  #else		    #pragma unused aGlyph		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function CapHeight() As Single		  		  #if TargetMacOS		    declare function capHeight lib CocoaLib selector "capHeight" (obj_id as Ptr) as Single		    		    return capHeight(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function ClassRef() As Ptr		  		  static ref as Ptr = Cocoa.NSClassFromString("NSFont")		  return ref		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function ControlContentFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function controlContentFontOfSize lib CocoaLib selector "controlContentFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = controlContentFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function CoveredCharacterSet() As NSCharacterSet		  		  #if TargetMacOS		    declare function coveredCharacterSet lib CocoaLib selector "coveredCharacterSet" (obj_id as Ptr) as Ptr		    		    dim charSetRef as Ptr = coveredCharacterSet(self)		    if charSetRef <> nil then		      return new NSCharacterSet(charSetRef)		    else		      return nil		    end if		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Descender() As Single		  		  #if TargetMacOS		    declare function descender lib CocoaLib selector "descender" (obj_id as Ptr) as Single		    		    return descender(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function DisplayName() As String		  		  #if TargetMacOS		    declare function displayName lib CocoaLib selector "displayName" (obj_id as Ptr) as CFStringRef		    		    return displayName(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function FamilyName() As String		  		  #if TargetMacOS		    declare function familyName lib CocoaLib selector "familyName" (obj_id as Ptr) as CFStringRef		    		    return familyName(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function FontDescriptor() As NSFontDescriptor		  		  #if TargetMacOS		    declare function fontDescriptor lib CocoaLib selector "fontDescriptor" (obj_id as Ptr) as Ptr		    		    dim descriptorRef as Ptr = fontDescriptor(self)		    if descriptorRef <> nil then		      return new NSFontDescriptor(descriptorRef)		    else		      return nil		    end if		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function FontName() As String		  		  #if TargetMacOS		    declare function fontName lib CocoaLib selector "fontName" (obj_id as Ptr) as CFStringRef		    		    return fontName(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function FontWithDescriptor(descriptor as NSFontDescriptor, transform as NSAffineTransform) As NSFont		  		  #if TargetMacOS		    declare function fontWithDescriptor lib CocoaLib selector "fontWithDescriptor:textTransform:" (obj_id as Ptr, fontDescriptor as Ptr, transform as Ptr) as Ptr		    		    dim fontRef as Ptr = fontWithDescriptor(ClassRef, descriptor, transform)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused descriptor		    #pragma unused transform		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function FontWithDescriptor(descriptor as NSFontDescriptor, size as Single) As NSFont		  		  #if TargetMacOS		    declare function fontWithDescriptor lib CocoaLib selector "fontWithDescriptor:size:" (obj_id as Ptr, fontDescriptor as Ptr, size as Single) as Ptr		    		    dim fontRef as Ptr = fontWithDescriptor(ClassRef, descriptor, size)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused descriptor		    #pragma unused size		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function FontWithName(name as String, matrix as NSFontMatrix) As NSFont		  		  #if TargetMacOS		    declare function fontWithName lib CocoaLib selector "fontWithName:matrix:" (obj_id as Ptr, fontName as CFStringRef, byRef matrix as NSFontMatrix) as Ptr		    		    dim fontRef as Ptr = fontWithName(ClassRef, name, matrix)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused name		    #pragma unused matrix		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function FontWithName(name as String, size as Single) As NSFont		  		  #if TargetMacOS		    declare function fontWithName lib CocoaLib selector "fontWithName:size:" (obj_id as Ptr, fontName as CFStringRef, size as Single) as Ptr		    		    dim fontRef as Ptr = fontWithName(ClassRef, name, size)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused name		    #pragma unused size		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GlyphWithName(glyphName as String) As UInt32		  		  #if TargetMacOS		    declare function glyphWithName lib CocoaLib selector "glyphWithName:" (obj_id as Ptr, glyphName as CFStringRef) as UInt32		    		    return glyphWithName(self, glyphName)		    		  #else		    #pragma unused glyphName		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function IsFixedPitch() As Boolean		  		  #if TargetMacOS		    declare function isFixedPitch lib CocoaLib selector "isFixedPitch" (obj_id as Ptr) as Boolean		    		    return isFixedPitch(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function IsVertical() As Boolean		  		  #if TargetMacOS		    declare function isVertical lib CocoaLib selector "isVertical" (obj_id as Ptr) as Boolean		    		    return isVertical(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function ItalicAngle() As Single		  		  #if TargetMacOS		    declare function italicAngle lib CocoaLib selector "italicAngle" (obj_id as Ptr) as Single		    		    return italicAngle(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function LabelFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function labelFontOfSize lib CocoaLib selector "labelFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = labelFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function LabelFontSize() As Single		  		  #if TargetMacOS		    declare function labelFontSize lib CocoaLib selector "labelFontSize" (obj_id as Ptr) as Single		    		    return labelFontSize(ClassRef)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Leading() As Single		  		  #if TargetMacOS		    declare function leading lib CocoaLib selector "leading" (obj_id as Ptr) as Single		    		    return leading(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Matrix() As NSFontMatrix		  		  #if TargetMacOS		    declare function matrix lib CocoaLib selector "matrix" (obj_id as Ptr) as Ptr		    		    dim m as MemoryBlock = matrix(self)		    dim x as NSFontMatrix		    x.stringValue(m.littleEndian) = m.stringValue(0, 24)		    return x		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function MaximumAdvancement() As Cocoa.NSSize		  		  #if TargetMacOS		    declare function maximumAdvancement lib CocoaLib selector "maximumAdvancement" (obj_id as Ptr) as Cocoa.NSSize		    		    return maximumAdvancement(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function MenuBarFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function menuBarFontOfSize lib CocoaLib selector "menuBarFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = menuBarFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function MenuFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function menuFontOfSize lib CocoaLib selector "menuFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = menuFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function MessageFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function messageFontOfSize lib CocoaLib selector "messageFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = messageFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function MostCompatibleStringEncoding() As NSStringEncoding		  		  #if TargetMacOS		    declare function mostCompatibleStringEncoding lib CocoaLib selector "mostCompatibleStringEncoding" (obj_id as Ptr) as NSStringEncoding		    		    return mostCompatibleStringEncoding(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function NumberOfGlyphs() As Integer		  		  #if TargetMacOS		    declare function numberOfGlyphs lib CocoaLib selector "numberOfGlyphs" (obj_id as Ptr) as Integer		    		    return numberOfGlyphs(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function PaletteFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function paletteFontOfSize lib CocoaLib selector "paletteFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = paletteFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function PointSize() As Single		  		  #if TargetMacOS		    declare function pointSize lib CocoaLib selector "pointSize" (obj_id as Ptr) as Single		    		    return pointSize(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function PrinterFont() As NSFont		  		  #if TargetMacOS		    declare function printerFont lib CocoaLib selector "printerFont" (obj_id as Ptr) as Ptr		    		    dim fontRef as Ptr = printerFont(self)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function RenderingMode() As NSFontRenderingMode		  		  #if TargetMacOS		    declare function renderingMode lib CocoaLib selector "renderingMode" (obj_id as Ptr) as NSFontRenderingMode		    		    return renderingMode(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function ScreenFont() As NSFont		  		  #if TargetMacOS		    declare function screenFont lib CocoaLib selector "screenFont" (obj_id as Ptr) as Ptr		    		    dim fontRef as Ptr = screenFont(self)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function ScreenFontWithRenderingMode(mode as NSFontRenderingMode) As NSFont		  		  #if TargetMacOS		    declare function screenFontWithRenderingMode lib CocoaLib selector "screenFontWithRenderingMode:" (obj_id as Ptr, mode as NSFontRenderingMode) as Ptr		    		    dim fontRef as Ptr = screenFontWithRenderingMode(self, mode)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused mode		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub Set()		  		  #if TargetMacOS		    declare sub set lib CocoaLib selector "set" (obj_id as Ptr)		    		    set self		    		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Set(context as NSGraphicsContext)		  		  #if TargetMacOS		    declare sub setInContext lib CocoaLib selector "setInContext:" (obj_id as Ptr, graphicsContext as Ptr)		    		    if context <> nil then		      setInContext self, context		    end if		    		  #else		    #pragma unused context		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Sub SetUserFixedPitchFont(aFont as NSFont)		  		  #if TargetMacOS		    declare sub setUserFixedPitchFont lib CocoaLib selector "setUserFixedPitchFont:" (obj_id as Ptr, aFont as Ptr)		    		    if aFont <> nil then		      setUserFixedPitchFont ClassRef, aFont		    else		      setUserFixedPitchFont ClassRef, nil		    end if		    		  #else		    #pragma unused aFont		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Sub SetUserFont(aFont as NSFont)		  		  #if TargetMacOS		    declare sub setUserFont lib CocoaLib selector "setUserFont:" (obj_id as Ptr, aFont as Ptr)		    		    if aFont <> nil then		      setUserFont ClassRef, aFont		    else		      setUserFont ClassRef, nil		    end if		    		  #else		    #pragma unused aFont		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function SmallSystemFontSize() As Single		  		  #if TargetMacOS		    declare function smallSystemFontSize lib CocoaLib selector "smallSystemFontSize" (obj_id as Ptr) as Single		    		    return smallSystemFontSize(ClassRef)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function SystemFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function systemFontOfSize lib CocoaLib selector "systemFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = systemFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function SystemFontSize() As Single		  		  #if TargetMacOS		    declare function systemFontSize lib CocoaLib selector "systemFontSize" (obj_id as Ptr) as Single		    		    return systemFontSize(ClassRef)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function SystemFontSizeForControlSize(controlSize as NSControlSize) As Single		  		  #if TargetMacOS		    declare function systemFontSizeForControlSize lib CocoaLib selector "systemFontSizeForControlSize:" (obj_id as Ptr, controlSize as NSControlSize) as Single		    		    return systemFontSizeForControlSize(ClassRef, controlSize)		    		  #else		    #pragma unused controlSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function TextTransform() As NSAffineTransform		  		  #if TargetMacOS		    declare function textTransform lib CocoaLib selector "textTransform" (obj_id as Ptr) as Ptr		    		    dim transformRef as Ptr = textTransform(self)		    if transformRef <> nil then		      return new NSAffineTransform(transformRef)		    else		      return nil		    end if		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function TitleBarFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function titleBarFontOfSize lib CocoaLib selector "titleBarFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = titleBarFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function ToolTipsFont(fontSize as Single) As NSFont		  		  #if TargetMacOS		    declare function toolTipsFontOfSize lib CocoaLib selector "toolTipsFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = toolTipsFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function UnderlinePosition() As Single		  		  #if TargetMacOS		    declare function underlinePosition lib CocoaLib selector "underlinePosition" (obj_id as Ptr) as Single		    		    return underlinePosition(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function UnderlineThickness() As Single		  		  #if TargetMacOS		    declare function underlineThickness lib CocoaLib selector "underlineThickness" (obj_id as Ptr) as Single		    		    return underlineThickness(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function UserFixedPitchFont(fontSIze as Single) As NSFont		  		  #if TargetMacOS		    declare function userFixedPitchFontOfSize lib CocoaLib selector "userFixedPitchFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = userFixedPitchFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function UserFont(fontSIze as Single) As NSFont		  		  #if TargetMacOS		    declare function userFontOfSize lib CocoaLib selector "userFontOfSize:" (obj_id as Ptr, fontSize as Single) as Ptr		    		    dim fontRef as Ptr = userFontOfSize(ClassRef, fontSize)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #else		    #pragma unused fontSize		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function VerticalFont() As NSFont		  		  #if TargetMacOS		    declare function verticalFont lib CocoaLib selector "verticalFont" (obj_id as Ptr) as Ptr		    		    dim fontRef as Ptr = verticalFont(self)		    if fontRef <> nil then		      return new NSFont(fontRef)		    else		      return nil		    end if		    		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function XHeight() As Single		  		  #if TargetMacOS		    declare function xHeight lib CocoaLib selector "xHeight" (obj_id as Ptr) as Single		    		    return xHeight(self)		    		  #endif		  		End Function	#tag EndMethod	#tag Structure, Name = NSFontMatrix, Flags = &h0		item1 as Single		  item2 as Single		  item3 as Single		  item4 as Single		  item5 as Single		item6 as Single	#tag EndStructure	#tag Enum, Name = NSControlSize, Type = Integer, Flags = &h0		NSRegularControlSize		  NSSmallControlSize		NSMiniControlSize	#tag EndEnum	#tag Enum, Name = NSFontRenderingMode, Type = Integer, Flags = &h0		NSFontDefaultRenderingMode		  NSFontAntialiasedRenderingMode		  NSFontIntegerAdvancementsRenderingMode		NSFontAntialiasedIntegerAdvancementsRenderingMode	#tag EndEnum	#tag Enum, Name = NSStringEncoding, Type = UInt32, Flags = &h0		NSASCIIStringEncoding = 1		  NSNEXTSTEPStringEncoding = 2		  NSJapaneseEUCStringEncoding = 3		  NSUTF8StringEncoding = 4		  NSISOLatin1StringEncoding = 5		  NSSymbolStringEncoding = 6		  NSNonLossyASCIIStringEncoding = 7		  NSShiftJISStringEncoding = 8		  NSISOLatin2StringEncoding = 9		  NSUnicodeStringEncoding = 10		  NSWindowsCP1251StringEncoding = 11		  NSWindowsCP1252StringEncoding = 12		  NSWindowsCP1253StringEncoding = 13		  NSWindowsCP1254StringEncoding = 14		  NSWindowsCP1250StringEncoding = 15		  NSISO2022JPStringEncoding = 21		  NSMacOSRomanStringEncoding = 30		  NSUTF16StringEncoding = 10		  NSUTF16BigEndianStringEncoding = &h90000100		  NSUTF16LittleEndianStringEncoding = &h94000100		  NSUTF32StringEncoding = &h8c000100		  NSUTF32BigEndianStringEncoding = &h98000100		  NSUTF32LittleEndianStringEncoding = &h9c000100		NSProprietaryStringEncoding = 65536	#tag EndEnum	#tag ViewBehavior		#tag ViewProperty			Name="Description"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="NSObject"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass