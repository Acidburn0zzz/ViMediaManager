#tag ModuleProtected Module ssWindowExtensions	#tag Method, Flags = &h0		Sub addChildWindowOrderedAbove(Extends pWindow As Window, pChildWindow As Window)		  // Adds a given window as a child window of the window.		  		  // After the childWindow is added as a child of the window, it is maintained in relative position		  // indicated by orderingMode for subsequent ordering operations involving either window.		  // While this attachment is active, moving childWindow will not cause the window to move		  // (as in sliding a drawer in or out), but moving the window will cause childWindow to move.		  		  // Note that you should not create cycles between parent and child windows.		  // For example, you should not add window B as child of window A, then add window A as a child of window B.		  		  #if TargetCocoa		    soft declare sub addChildWindow lib "Cocoa" selector "addChildWindow:ordered:" (WindowRef As WindowPtr, ChildWindowRef As WindowPtr, OrderingMode As Integer)		    addChildWindow pWindow, pChildWindow, kWindowOrderingModeAbove		  #Else		    #pragma Unused pWindow		    #pragma Unused pChildWindow		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub addChildWindowOrderedBelow(Extends pWindow As Window, pChildWindow As Window)		  // Adds a given window as a child window of the window.		  		  // After the childWindow is added as a child of the window, it is maintained in relative position		  // indicated by orderingMode for subsequent ordering operations involving either window.		  // While this attachment is active, moving childWindow will not cause the window to move		  // (as in sliding a drawer in or out), but moving the window will cause childWindow to move.		  		  // Note that you should not create cycles between parent and child windows.		  // For example, you should not add window B as child of window A, then add window A as a child of window B.		  		  #if TargetCocoa		    soft declare sub addChildWindow lib "Cocoa" selector "addChildWindow:ordered:" (WindowRef As WindowPtr, ChildWindowRef As WindowPtr, OrderingMode As Integer)		    addChildWindow pWindow, pChildWindow, kWindowOrderingModeBelow		  #Else		    #pragma Unused pWindow		    #pragma Unused pChildWindow		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function allowTooltipsWhenAppInactive(Extends pWindow As Window) As Boolean		  // Indicates whether the window is excluded from the application’s Windows menu.		  #if TargetCocoa		    soft declare function allowsToolTipsWhenApplicationIsInactive lib "Cocoa" selector "allowsToolTipsWhenApplicationIsInactive" (WindowRef As WindowPtr) As Boolean		    return allowsToolTipsWhenApplicationIsInactive(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub allowTooltipsWhenAppInactive(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window can display tooltips even when the application is in the background.		  #if TargetCocoa		    soft declare sub setAllowsToolTipsWhenApplicationIsInactive lib "Cocoa" selector "setAllowsToolTipsWhenApplicationIsInactive:" (WindowRef As WindowPtr, inFlag As Boolean)		    setAllowsToolTipsWhenApplicationIsInactive pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // Note: Enabling tooltips in an inactive application will cause the application to do		  // work any time the pointer passes over the window, thus degrading system performance		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function bottomBorderThickness(Extends pWindow As Window) As Integer		  // Indicates the thickness of a given border of the window.		  #if TargetCocoa		    soft declare function contentBorderThicknessForEdge lib "Cocoa" selector "contentBorderThicknessForEdge:" (WindowRef As WindowPtr, Edge As Integer) As Double		    return contentBorderThicknessForEdge(pWindow, kWindowEdgeBottom)		  #Else		    #pragma Unused pWindow		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub bottomBorderThickness(Extends pWindow As Window, Assigns pValue As Double)		  // Specifies the thickness of a given border of the window.		  #if TargetCocoa		    soft declare sub setBackingType lib "Cocoa" selector "setBackingType:" (WindowRef As WindowPtr, BackingType As Integer)		    soft declare sub setAutorecalculatesContentBorderThicknessForEdge lib "Cocoa" selector "setAutorecalculatesContentBorderThickness:forEdge:" (WindowRef As WindowPtr, Flag As Boolean, Edge As Integer)		    soft declare sub setContentBorderThicknessForEdge lib "Cocoa" selector "setContentBorderThickness:forEdge:" (WindowRef As WindowPtr, Thickness As Single, Edge As Integer)		    		    setBackingType pWindow, kBackingStoreType		    setAutorecalculatesContentBorderThicknessForEdge pWindow, FALSE, kWindowEdgeBottom		    setContentBorderThicknessForEdge pWindow, pValue, kWindowEdgeBottom		  #Else		    #pragma Unused pWindow		    #pragma Unused pValue		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function bottomCornerRounded(Extends pWindow As Window) As Boolean		  // Indicates if the window has rounded bottom corners.		  #if TargetCocoa		    soft declare function bottomCornerRounded lib "Cocoa" selector "bottomCornerRounded" (WindowRef As WindowPtr) As Boolean		    return bottomCornerRounded(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  //posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub bottomCornerRounded(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies if the window has rounded bottom corners		  #if TargetCocoa		    soft declare sub setBottomCornerRounded lib "Cocoa" selector "setBottomCornerRounded:" (WindowRef As WindowPtr, inFlag As Boolean)		    setBottomCornerRounded pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function canBeVisibleOnAllSpaces(Extends pWindow As Window) As Boolean		  // Indicates whether the window can be visible on all spaces or on only one space at a time.		  #if TargetCocoa		    soft declare function canBeVisibleOnAllSpaces lib "Cocoa" selector "canBeVisibleOnAllSpaces" (WindowRef As WindowPtr) As Boolean		    return canBeVisibleOnAllSpaces(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub canBeVisibleOnAllSpaces(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window can be visible on all spaces or on only one space at a time.		  #if TargetCocoa		    soft declare sub setCanBeVisibleOnAllSpaces lib "Cocoa" selector "setCanBeVisibleOnAllSpaces:" (WindowRef As WindowPtr, inFlag As Boolean)		    setCanBeVisibleOnAllSpaces pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function canHide(Extends pWindow As Window) As Boolean		  // Indicates whether the window can be hidden when its application becomes hidden.		  #if TargetCocoa		    soft declare function canHide lib "Cocoa" selector "canHide" (WindowRef As WindowPtr) As Boolean		    return canHide(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub canHide(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window can be hidden when its application becomes hidden.		  #if TargetCocoa		    soft declare sub setCanHide lib "Cocoa" selector "setCanHide:" (WindowRef As WindowPtr, inFlag As Boolean)		    setCanHide pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub center(Extends pWindow As Window)		  // Sets the window’s location to the center of the screen.		  #if TargetCocoa		    soft declare sub center lib "Cocoa" selector "center" (WindowRef As WindowPtr)		    center pWindow		  #Else		    '#pragma Unused pWindow		    		    pWindow.Left = ( Screen(0).Width / 2 ) - ( pWindow.Width / 2 )		    pWindow.Top = ( Screen(0).Height / 2 ) - ( pWindow.Height / 2 )		    		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function excludedFromWindowsMenu(Extends pWindow As Window) As Boolean		  // Indicates whether the window is excluded from the application’s Windows menu.		  #if TargetCocoa		    soft declare function isExcludedFromWindowsMenu lib "Cocoa" selector "isExcludedFromWindowsMenu" (WindowRef As WindowPtr) As Boolean		    return isExcludedFromWindowsMenu(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub excludedFromWindowsMenu(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window’s title is omitted from the application’s Windows menu.		  #if TargetCocoa		    soft declare sub setExcludedFromWindowsMenu lib "Cocoa" selector "setExcludedFromWindowsMenu:" (WindowRef As WindowPtr, inFlag As Boolean)		    setExcludedFromWindowsMenu pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function frameAutosaveName(Extends pWindow As Window, pFrameName As String) As Boolean		  // Sets the name used to automatically save the window’s frame rectangle in the defaults system to a given name.		  #if TargetCocoa		    soft declare function setFrameAutosaveName lib "Cocoa" selector "setFrameAutosaveName:" (WindowRef As WindowPtr, inFrameName As CFStringRef) As Boolean		    return setFrameAutosaveName(pWindow, pFrameName)		  #Else		    #pragma Unused pWindow		    #pragma Unused pFrameName		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function frameString(Extends pWindow As Window) As String		  // Returns a string representation of the window’s frame rectangle.		  #if TargetCocoa		    soft declare function stringWithSavedFrame lib "Cocoa" selector "stringWithSavedFrame" (WindowRef As WindowPtr) As CFStringRef		    return stringWithSavedFrame(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub frameString(Extends pWindow As Window, Assigns pFrameString As String)		  // Sets the window’s frame rectangle from a given string representation.		  #if TargetCocoa		    soft declare sub setFrameFromString lib "Cocoa" selector "setFrameFromString:" (WindowRef As WindowPtr, inFrameString As CFStringRef)		    setFrameFromString pWindow, pFrameString		  #Else		    #pragma Unused pWindow		    #pragma Unused pFrameString		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function hasShadow(Extends pWindow As Window) As Boolean		  // Indicates whether the window has a shadow.		  #if TargetCocoa		    soft declare function hasShadow lib "Cocoa" selector "hasShadow" (WindowRef As WindowPtr) As Boolean		    return hasShadow(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub hasShadow(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window has a shadow.		  #if TargetCocoa		    soft declare sub setHasShadow lib "Cocoa" selector "setHasShadow:" (WindowRef As WindowPtr, inFlag As Boolean)		    setHasShadow pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function hidesOnDeactivate(Extends pWindow As Window) As Boolean		  // Indicates whether the window is removed from the screen when its application becomes inactive.		  #if TargetCocoa		    soft declare function hidesOnDeactivate lib "Cocoa" selector "hidesOnDeactivate" (WindowRef As WindowPtr) As Boolean		    return hidesOnDeactivate(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub hidesOnDeactivate(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window is removed from the screen when the application is inactive.		  #if TargetCocoa		    soft declare sub setHidesOnDeactivate lib "Cocoa" selector "setHidesOnDeactivate:" (WindowRef As WindowPtr, inFlag As Boolean)		    setHidesOnDeactivate pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function ignoresMouseEvents(Extends pWindow As Window) As Boolean		  // Indicates whether the window is transparent to mouse events.		  #if TargetCocoa		    soft declare function ignoresMouseEvents lib "Cocoa" selector "ignoresMouseEvents" (WindowRef As WindowPtr) As Boolean		    return ignoresMouseEvents(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub ignoresMouseEvents(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window is transparent to mouse clicks and other mouse events, allowing overlay windows.		  #if TargetCocoa		    soft declare sub setIgnoresMouseEvents lib "Cocoa" selector "setIgnoresMouseEvents:" (WindowRef As WindowPtr, inFlag As Boolean)		    setIgnoresMouseEvents pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub invalidateShadow(Extends pWindow As Window)		  // Invalidates the window shadow so that it is recomputed based on the current window shape.		  #if TargetCocoa		    soft declare sub invalidateShadow lib "Cocoa" selector "invalidateShadow" (WindowRef As WindowPtr)		    invalidateShadow pWindow		  #Else		    #pragma Unused pWindow		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function isMiniaturized(Extends pWindow As Window) As Boolean		  // Indicates whether the window is minimized.		  #if TargetCocoa		    soft declare function isMiniaturized lib "Cocoa" selector "isMiniaturized" (WindowRef As WindowPtr) As Boolean		    return isMiniaturized(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function isMovable(Extends pWindow As Window) As Boolean		  // Indicates whether the window can be moved by clicking in its title bar or background.		  #if TargetCocoa		    soft declare function isMovable lib "Cocoa" selector "isMovable" (WindowRef As WindowPtr) As Boolean		    return isMovable(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub isMovable(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window can be dragged by clicking in its title bar or background.		  #if TargetCocoa		    soft declare sub setMovable lib "Cocoa" selector "setMovable:" (WindowRef As WindowPtr, inFlag As Boolean)		    setMovable pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function isOnActiveSpace(Extends pWindow As Window) As Boolean		  // Indicates whether the window is on the currently active space.		  #if TargetCocoa		    soft declare function isOnActiveSpace lib "Cocoa" selector "isOnActiveSpace" (WindowRef As Integer) As Boolean		    return isOnActiveSpace(pWindow.Handle)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function miniwindowTitle(Extends pWindow As Window) As String		  // Returns the title displayed in the window’s minimized window.		  #if TargetCocoa		    soft declare function miniwindowTitle lib "Cocoa" selector "miniwindowTitle" (WindowRef As WindowPtr) As CFStringRef		    return miniwindowTitle(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub miniwindowTitle(Extends pWindow As Window, Assigns pTitle As String)		  // Sets the title of the window’s miniaturized counterpart to a given string and redisplays it.		  #if TargetCocoa		    soft declare sub setMiniwindowTitle lib "Cocoa" selector "setMiniwindowTitle:" (WindowRef As WindowPtr, inTitle As CFStringRef)		    setMiniwindowTitle pWindow, pTitle		  #Else		    #pragma Unused pWindow		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function movableByWindowBackground(Extends pWindow As Window) As Boolean		  // Indicates whether the window is movable by clicking and dragging anywhere in its background.		  #if TargetCocoa		    soft declare function isMovableByWindowBackground lib "Cocoa" selector "isMovableByWindowBackground" (WindowRef As WindowPtr) As Boolean		    return isMovableByWindowBackground(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub movableByWindowBackground(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Sets whether the window is movable by clicking and dragging anywhere in its background.		  #if TargetCocoa		    soft declare sub setMovableByWindowBackground lib "Cocoa" selector "setMovableByWindowBackground:" (WindowRef As WindowPtr, inFlag As Boolean)		    setMovableByWindowBackground pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub orderFrontRegardless(Extends pWindow As Window)		  // Moves the window to the front of its level, even if its application isn’t active,		  // without changing either the key window or the main window.		  #if TargetCocoa		    soft declare sub orderFrontRegardless lib "Cocoa" selector "orderFrontRegardless" (WindowRef As WindowPtr)		    orderFrontRegardless pWindow		  #Else		    #pragma Unused pWindow		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function parentWindow(Extends pWindow As Window) As Window		  // Returns the parent window to which the window is attached as a child.		  #if TargetCocoa		    soft declare function parentWindow lib "Cocoa" selector "parentWindow" (WindowRef As WindowPtr) As Integer		    DIM tWindowPtr As Integer = parentWindow(pWindow)		    		    for i as Integer = 0 to (WindowCount() - 1)		      DIM tWindow As Window = Window(i)		      if (tWindow.Handle = tWindowPtr) then		        return tWindow		      end if		    next		    		    return NIL		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub removeChildWindow(Extends pWindow As Window, pChildWindow As Window)		  // Detaches a given child window from the window.		  #if TargetCocoa		    soft declare sub removeChildWindow lib "Cocoa" selector "removeChildWindow:" (WindowRef As WindowPtr, ChildWindowRef As WindowPtr)		    removeChildWindow pWindow, pChildWindow		  #Else		    #pragma Unused pWindow		    #pragma Unused pChildWindow		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function representedFilename(Extends pWindow As Window) As String		  // Returns the pathname of the file the window represents.		  #if TargetCocoa		    soft declare function representedFilename lib "Cocoa" selector "representedFilename" (WindowRef As WindowPtr) As CFStringRef		    return representedFilename(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub representedFilename(Extends pWindow As Window, Assigns pPath As String)		  // Sets the pathname of the file the window represents.		  #if TargetCocoa		    soft declare sub setRepresentedFilename lib "Cocoa" selector "setRepresentedFilename:" (WindowRef As WindowPtr, inPath As CFStringRef)		    setRepresentedFilename pWindow, pPath		  #Else		    #pragma Unused pWindow		    #pragma Unused pPath		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub setFrameWithAnimation(Extends pWindow As Window, pNSRect As cocoa.NSRect)		  // Sets the origin and size of the window’s frame rectangle, with optional animation,		  // according to a given frame rectangle, thereby setting its position and size onscreen.		  #if TargetCocoa		    // we need to convert the co-ordinates		    pNSRect.y = Screen(0).Height - (pNSRect.y + pWindow.Height)		    if (pWindow.Height <> pNSRect.h) then		      pNSRect.y = pNSRect.y - (pNSRect.h - pWindow.Height)		    end if		    pNSRect.h = pNSRect.h + 22		    		    soft declare sub setFrameDisplayAnimate lib "Cocoa" selector "setFrame:display:animate:" (WindowRef As WindowPtr, inNSRect As Cocoa.NSRect, Display As Boolean, Animate As Boolean)		    setFrameDisplayAnimate pWindow, pNSRect, TRUE, TRUE		  #Else		    #pragma Unused pWindow		    #pragma Unused pNSRect		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub setStyleMaskHUD(Extends pWindow As Window)		  // posted		  // only works on floating (palette) windows (frame = 3 & 7)		  #if TargetCocoa		    if ((pWindow.Frame = kWindowFrameFloatingWindow) OR (pWindow.Frame = kWindowFrameGlobalFloatingWindow)) then		      Dim tStyleMask As UInt32 = kWindowMaskHUD OR kWindowMaskTitled OR kWindowMaskUtility		      if (pWindow.Resizeable) then tStyleMask = tStyleMask or kWindowMaskResizable		      if (pWindow.CloseBox) then tStyleMask = tStyleMask or kWindowMaskClosable		      		      soft declare sub setStyleMask lib "Cocoa" selector "setStyleMask:" (WindowRef As WindowPtr, Mask As UInt32)		      setStyleMask pWindow, tStyleMask		    end if		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function showsToolbarButton(Extends pWindow As Window) As Boolean		  // Indicates whether the toolbar control button is currently displayed.		  #if TargetCocoa		    soft declare function showsToolbarButton lib "Cocoa" selector "showsToolbarButton" (WindowRef As WindowPtr) As Boolean		    return showsToolbarButton(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub showsToolbarButton(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies whether the window shows the toolbar control button.		  // If the window does not have a toolbar, this method has no effect.		  #if TargetCocoa		    soft declare sub setShowsToolbarButton lib "Cocoa" selector "setShowsToolbarButton:" (WindowRef As WindowPtr, Flag As Boolean)		    setShowsToolbarButton pWindow, pFlag		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SmoothResize(Extends w as Window, Width as Integer, Height as Integer, align as Integer = 0)		  // Sets the origin and size of the window’s frame rectangle, with optional animation,		  // according to a given frame rectangle, thereby setting its position and size onscreen.		  #if TargetCocoa		    		    Dim OrigRect, NewRect as Cocoa.NSRect		    OrigRect.x = w.Left		    OrigRect.y = w.Top		    OrigRect.w = w.Width		    OrigRect.h = w.Height		    		    		    // we need to convert the co-ordinates		    NewRect = OrigRect		    		    NewRect.w = Width		    NewRect.h = Height		    Select Case align // Use deltas in measurements, not absolutes		      		    Case 0 // Lock upper left		      // Just change the width & height		      		    Case 1 // Lock upper right		      NewRect.x = OrigRect.x - ( Width - w.Width )		      		    Case 2 // Lock lower left		      NewRect.y = OrigRect.y - ( Height - w.Height )		      		    Case 3 // Lock lower right		      NewRect.y = OrigRect.y - ( Height - w.Height )		      NewRect.x = OrigRect.x - ( Width - w.Width )		      		    Case 4 // Lock top center		      NewRect.x = OrigRect.x - ( ( Width - w.Width ) / 2 )		      		    Case 5 // Lock left center		      NewRect.y = OrigRect.y - ( ( Height - w.Height ) / 2 )		      		    Case 6 // Lock bottom center		      NewRect.x = OrigRect.x - ( ( Width - w.Width ) / 2 )		      NewRect.y = OrigRect.y - ( Height - w.Height )		      		    Case 7 // Lock right center		      NewRect.x = OrigRect.x - ( Width - w.Width )		      NewRect.y = OrigRect.y - ( ( Height - w.Height ) / 2 )		      		      		    Case 8 // Lock Center Center		      NewRect.x = OrigRect.x - ( ( Width - w.Width ) / 2 )		      NewRect.y = OrigRect.y - ( ( Height - w.Height ) / 2 )		      		    Else		      Return		      		    End Select		    		    		    NewRect.y = Screen(0).Height - (NewRect.y + w.Height)		    If (w.Height <> NewRect.h) Then		      NewRect.y = NewRect.y - (NewRect.h - w.Height)		    End If		    NewRect.h = NewRect.h + 22 // Account for titlebar		    		    soft declare sub setFrameDisplayAnimate lib "Cocoa" selector "setFrame:display:animate:" (WindowRef As WindowPtr, inNSRect As Cocoa.NSRect, Display As Boolean, Animate As Boolean)		    setFrameDisplayAnimate w, NewRect, TRUE, TRUE		    		  #Else		    		    w.Width = Width		    w.Height = Height		    #pragma Unused align		    		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function titleWithRepresentedFilename(Extends pWindow As Window) As String		  // Returns either the string that appears in the title bar of the window, or the path to the represented file.		  #if TargetCocoa		    soft declare function titleWithRepresentedFilename lib "Cocoa" selector "title" (WindowRef As WindowPtr) As CFStringRef		    return titleWithRepresentedFilename(pWindow)		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub titleWithRepresentedFilename(Extends pWindow As Window, Assigns pPath As String)		  // Sets a given path as the window’s title, formatting it as a file-system path,		  // and records this path as the window’s associated filename.		  #if TargetCocoa		    soft declare sub setTitleWithRepresentedFilename lib "Cocoa" selector "setTitleWithRepresentedFilename:" (WindowRef As WindowPtr, inPath As CFStringRef)		    setTitleWithRepresentedFilename pWindow, pPath		  #Else		    #pragma Unused pWindow		    #pragma Unused pPath		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub transparency(Extends pWindow As Window, Assigns pValue As Double)		  // posted		  #if TargetCocoa		    // get the reference to the NSColor class so we can call one of the class methods		    soft declare function NSClassFromString lib "Cocoa" (aClassName as CFStringRef) as Ptr		    dim NSColorClassRef as Ptr = NSClassFromString("NSColor")		    		    // now ask the NSColor class to create a new NSColor from the values we have		    soft declare function colorWithDeviceRed lib "Cocoa" selector "colorWithDeviceRed:green:blue:alpha:" (classRef as Ptr, red as Single, green as single, blue as single, alpha as single) as Ptr		    dim NSColorInstance as Ptr = colorWithDeviceRed(NSColorClassRef, 0.0, 0.0, 0.0, pValue)		    		    // set the features on the window		    soft declare sub setAlphaValue lib "Cocoa" selector "setAlphaValue:" (WindowRef As WindowPtr, AlphaValue As Single)		    soft declare sub setOpaque lib "Cocoa" selector "setOpaque:" (WindowRef As WindowPtr, IsOpaque As Boolean)		    soft declare sub setBackgroundColor lib "Cocoa" selector "setBackgroundColor:" (WindowRef As WindowPtr, inNSColorInstance As Ptr)		    		    setAlphaValue pWindow, 1.0		    setOpaque pWindow, FALSE		    setBackgroundColor pWindow, NSColorInstance		    		    // force the window to update so we get the proper shadowing		    pWindow.Width = pWindow.Width + 1		    pWindow.Width = pWindow.Width - 1		  #Else		    #pragma Unused pWindow		    #pragma Unused pValue		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function usesLightBottomGradient(Extends pWindow As Window) As Boolean		  // Indicates that the textured window uses a light gradient at the bottom of the window.		  #if TargetCocoa		    if (pWindow.Frame = kWindowFrameTexturedWindow) then		      soft declare function usesLightBottomGradient lib "Cocoa" selector "_usesLightBottomGradient" (WindowRef As WindowPtr) As Boolean		      return usesLightBottomGradient(pWindow)		    end if		  #Else		    #pragma Unused pWindow		  #endif		  		  // posted		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub usesLightBottomGradient(Extends pWindow As Window, Assigns pFlag As Boolean)		  // Specifies that the textured window will use a light gradient at the bottom of the window.		  #if TargetCocoa		    if (pWindow.Frame = kWindowFrameTexturedWindow) then		      soft declare sub setUsesLightBottomGradient lib "Cocoa" selector "_setUsesLightBottomGradient:" (WindowRef As WindowPtr, Flag As Boolean)		      setUsesLightBottomGradient pWindow, pFlag		      pWindow.Refresh  ' otherwise it does not show		    end if		  #Else		    #pragma Unused pWindow		    #pragma Unused pFlag		  #endif		  		  // posted		End Sub	#tag EndMethod	#tag Constant, Name = kBackingStoreType, Type = Double, Dynamic = False, Default = \"2", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowEdgeBottom, Type = Double, Dynamic = False, Default = \"1", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowEdgeTop, Type = Double, Dynamic = False, Default = \"3", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameDocument, Type = Double, Dynamic = False, Default = \"0", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameDrawerWindow, Type = Double, Dynamic = False, Default = \"10", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameFloatingWindow, Type = Double, Dynamic = False, Default = \"3", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameGlobalFloatingWindow, Type = Double, Dynamic = False, Default = \"7", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameModalDialog, Type = Double, Dynamic = False, Default = \"2", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameModelessDialog, Type = Double, Dynamic = False, Default = \"11", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameMovableModal, Type = Double, Dynamic = False, Default = \"1", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFramePlainBox, Type = Double, Dynamic = False, Default = \"4", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameRoundedWindow, Type = Double, Dynamic = False, Default = \"6", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameShadowedBox, Type = Double, Dynamic = False, Default = \"5", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameSheetWindow, Type = Double, Dynamic = False, Default = \"8", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowFrameTexturedWindow, Type = Double, Dynamic = False, Default = \"9", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowMaskBorderless, Type = Double, Dynamic = False, Default = \"0", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowMaskClosable, Type = Double, Dynamic = False, Default = \"2", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowMaskHUD, Type = Double, Dynamic = False, Default = \"8192", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowMaskResizable, Type = Double, Dynamic = False, Default = \"8", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowMaskTitled, Type = Double, Dynamic = False, Default = \"1", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowMaskUtility, Type = Double, Dynamic = False, Default = \"16", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowOrderingModeAbove, Type = Double, Dynamic = False, Default = \"1", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowOrderingModeBelow, Type = Double, Dynamic = False, Default = \"-1", Scope = Protected	#tag EndConstant	#tag Constant, Name = kWindowOrderingModeOut, Type = Double, Dynamic = False, Default = \"0", Scope = Protected	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule