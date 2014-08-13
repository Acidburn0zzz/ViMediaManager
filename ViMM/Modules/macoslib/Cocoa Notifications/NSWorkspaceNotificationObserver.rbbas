#tag ClassProtected Class NSWorkspaceNotificationObserverInherits CocoaDelegate	#tag Event		Function DelegateClassName() As String		  		  return "MLNSWorkspaceNotificationObserver"		  		End Function	#tag EndEvent	#tag Event		Function DelegateMethods() As Tuple()		  		  dim methodList() as Tuple		  methodList.Append kNotificationSelector : FPtr(AddressOf DispatchNotification) : "v@:@"		  		  return methodList		  		End Function	#tag EndEvent	#tag Method, Flags = &h1000		Sub Constructor(handler as NSWorkspaceNotificationInterface = nil)		  		  // construct a delegate and accept an optional delegate handler which is a NSWorkspaceNotificationInterface instance		  // this permits to use this class in two modes:		  //		  // 1. Without subclassing, just instantiating it passing a NSWorkspaceNotificationInterface member that will handle		  //     the events (eg. a window or another class). The handler can also be changed at any time setting the DelegateHandler		  //     property.		  //		  // 2. Subclassing this class and handling the events. This can be also done dragging an instance of this class in a window.		  //		  		  // store the handler		  DelegateHandler = handler		  		  // call super to construct the object		  super.Constructor		  		  // raise the Open event (for use by subclasses or instances dragged to a window)		  raiseEvent Open()		  		  		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Destructor()		  		  // if we are registered as observer, we must unregister before getting deallocated or a runtime error will happen		  if registered then		    self.Unregister		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Sub DispatchNotification(id as Ptr, sel as Ptr, notification as Ptr)		  		  // dispatch the message to the right instance handler		  		  #pragma StackOverflowChecking false		  		  #pragma unused sel		  		  if CocoaDelegateMap.HasKey(id) then // lookup the delegate instance		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))		    dim obj as NSWorkspaceNotificationObserver = NSWorkspaceNotificationObserver(w.Value) // get the delegate instance		    		    // be sure to have a valid object		    if obj = nil then		      return		    end if		    		    // build objects to pass to the instance method		    dim notificationObj as NSNotification		    if notification <> nil then		      notificationObj = new NSNotification(notification)		      		      // identify the notification and call the right handler		      select case notificationObj.Name		        		      case "NSWorkspaceWillLaunchApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_WillLaunchApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceDidLaunchApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_DidLaunchApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceDidTerminateApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_DidTerminateApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceSessionDidBecomeActiveNotification"		        obj.NSWorkspace_SessionDidBecomeActiveHandler notificationObj		        		      case "NSWorkspaceSessionDidResignActiveNotification"		        obj.NSWorkspace_SessionDidResignActiveHandler notificationObj		        		      case "NSWorkspaceDidHideApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_DidHideApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceDidUnhideApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_DidUnhideApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceDidActivateApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_DidActivateApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceDidDeactivateApplicationNotification"		        dim runningApp as new NSRunningApplication(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceApplicationKey))		        obj.NSWorkspace_DidDeactivateApplicationHandler notificationObj, runningApp		        		      case "NSWorkspaceDidRenameVolumeNotification"		        dim oldURL as new NSURL(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeOldURLKey))		        dim newURL as new NSURL(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeURLKey))		        dim oldName as new NSString(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeOldLocalizedNameKey))		        dim newName as new NSString(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeLocalizedNameKey))		        obj.NSWorkspace_DidRenameVolumeHandler notificationObj, oldURL, oldName, newURL, newName		        		      case "NSWorkspaceDidMountNotification"		        dim volumeURL as new NSURL(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeURLKey))		        dim volumeName as new NSString(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeLocalizedNameKey))		        obj.NSWorkspace_DidMountHandler notificationObj, volumeURL, volumeName		        		      case "NSWorkspaceWillUnmountNotification"		        dim volumeURL as new NSURL(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeURLKey))		        dim volumeName as new NSString(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeLocalizedNameKey))		        obj.NSWorkspace_WillUnmountHandler notificationObj, volumeURL, volumeName		        		      case "NSWorkspaceDidUnmountNotification"		        dim volumeURL as new NSURL(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeURLKey))		        dim volumeName as new NSString(notificationObj.userInfo.Value(NSWorkspace.NSWorkspaceVolumeLocalizedNameKey))		        obj.NSWorkspace_DidUnmountHandler notificationObj, volumeURL, volumeName		        		      case "NSWorkspaceDidPerformFileOperationNotification"		        dim opNumber as new NSNumber(notificationObj.userInfo.Value("NSOperationNumber"))		        obj.NSWorkspace_DidPerformFileOperationHandler notificationObj, opNumber.IntegerValue		        		      case "NSWorkspaceDidChangeFileLabelsNotification"		        obj.NSWorkspace_DidChangeFileLabelsHandler notificationObj		        		      case "NSWorkspaceActiveSpaceDidChangeNotification"		        obj.NSWorkspace_ActiveSpaceDidChangeHandler notificationObj		        		      case "NSWorkspaceDidWakeNotification"		        obj.NSWorkspace_DidWakeHandler notificationObj		        		      case "NSWorkspaceWillPowerOffNotification"		        obj.NSWorkspace_WillPowerOffHandler notificationObj		        		      case "NSWorkspaceWillSleepNotification"		        obj.NSWorkspace_WillSleepHandler notificationObj		        		      case "NSWorkspaceScreensDidSleepNotification"		        obj.NSWorkspace_ScreensDidSleepHandler notificationObj		        		      case "NSWorkspaceScreensDidWakeNotification"		        obj.NSWorkspace_ScreensDidWakeHandler notificationObj		        		      end select		      		    end if		    		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_ActiveSpaceDidChangeHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_ActiveSpaceDidChange(notification)		  else		    raiseEvent NSWorkspace_ActiveSpaceDidChange(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidActivateApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidActivateApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_DidActivateApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidChangeFileLabelsHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidChangeFileLabels(notification)		  else		    raiseEvent NSWorkspace_DidChangeFileLabels(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidDeactivateApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidDeactivateApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_DidDeactivateApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidHideApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidHideApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_DidHideApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidLaunchApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidLaunchApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_DidLaunchApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidMountHandler(notification as NSNotification, volumeURL as NSURL, volumeLocalizedName as String)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidMount(notification, volumeURL, volumeLocalizedName)		  else		    raiseEvent NSWorkspace_DidMount(notification, volumeURL, volumeLocalizedName)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidPerformFileOperationHandler(notification as NSNotification, operationNumber as Integer)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidPerformFileOperation(notification, operationNumber)		  else		    raiseEvent NSWorkspace_DidPerformFileOperation(notification, operationNumber)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidRenameVolumeHandler(notification as NSNotification, oldURL as NSURL, oldLocalizedName as String, newURL as NSURL, newLocalizedName as String)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidRenameVolume(notification, oldURL, oldLocalizedName, newURL, newLocalizedName)		  else		    raiseEvent NSWorkspace_DidRenameVolume(notification, oldURL, oldLocalizedName, newURL, newLocalizedName)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidTerminateApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidTerminateApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_DidTerminateApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidUnhideApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidUnhideApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_DidUnhideApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidUnmountHandler(notification as NSNotification, volumeURL as NSURL, volumeLocalizedName as String)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidUnmount(notification, volumeURL, volumeLocalizedName)		  else		    raiseEvent NSWorkspace_DidUnmount(notification, volumeURL, volumeLocalizedName)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_DidWakeHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_DidWake(notification)		  else		    raiseEvent NSWorkspace_DidWake(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_ScreensDidSleepHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_ScreensDidSleep(notification)		  else		    raiseEvent NSWorkspace_ScreensDidSleep(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_ScreensDidWakeHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_ScreensDidWake(notification)		  else		    raiseEvent NSWorkspace_ScreensDidWake(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_SessionDidBecomeActiveHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_SessionDidBecomeActive(notification)		  else		    raiseEvent NSWorkspace_SessionDidBecomeActive(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_SessionDidResignActiveHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_SessionDidResignActive(notification)		  else		    raiseEvent NSWorkspace_SessionDidResignActive(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_WillLaunchApplicationHandler(notification as NSNotification, runningApp as NSRunningApplication)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_WillLaunchApplication(notification, runningApp)		  else		    raiseEvent NSWorkspace_WillLaunchApplication(notification, runningApp)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_WillPowerOffHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_WillPowerOff(notification)		  else		    raiseEvent NSWorkspace_WillPowerOff(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_WillSleepHandler(notification as NSNotification)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_WillSleep(notification)		  else		    raiseEvent NSWorkspace_WillSleep(notification)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub NSWorkspace_WillUnmountHandler(notification as NSNotification, volumeURL as NSURL, volumeLocalizedName as String)		  		  // handle the message and call the handler or fire the event		  		  if DelegateHandler <> nil then		    DelegateHandler.NSWorkspace_WillUnmount(notification, volumeURL, volumeLocalizedName)		  else		    raiseEvent NSWorkspace_WillUnmount(notification, volumeURL, volumeLocalizedName)		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Register()		  		  // There is only one shared instance of NSWorkspace per application, so we just get this and add self as observer		  		  // only proceed if we are not already registered		  if not registered then		    // get the shared workspace		    dim workspace as NSWorkspace = NSWorkspace.SharedWorkspace		    		    // get the notification center		    dim center as NSNotificationCenter = workspace.NotificationCenter		    		    // register self as observer		    center.AddObserver self, kNotificationSelector, "", workspace		    		    // mark we registered as observer		    registered = true		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Unregister()		  		  // There is only one shared instance of NSWorkspace per application, so we just get this and remove self as observer		  		  // only proceed if we are currently registered		  if registered then		    // get the shared workspace		    dim workspace as NSWorkspace = NSWorkspace.SharedWorkspace		    		    // get the notification center		    dim center as NSNotificationCenter = workspace.NotificationCenter		    		    // unregister self as observer		    center.RemoveObserver self		    		    // mark we are no longer registered as observer		    registered = false		  end if		  		End Sub	#tag EndMethod	#tag Hook, Flags = &h0		Event NSWorkspace_ActiveSpaceDidChange(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidActivateApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidChangeFileLabels(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidDeactivateApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidHideApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidLaunchApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidMount(notification as NSNotification, volumeURL as NSURL, volumeLocalizedName as String)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidPerformFileOperation(notification as NSNotification, operationNumber as Integer)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidRenameVolume(notification as NSNotification, oldURL as NSURL, oldLocalizedName as String, newURL as NSURL, newLocalizedName as String)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidTerminateApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidUnhideApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidUnmount(notification as NSNotification, volumeURL as NSURL, volumeLocalizedName as String)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_DidWake(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_ScreensDidSleep(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_ScreensDidWake(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_SessionDidBecomeActive(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_SessionDidResignActive(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_WillLaunchApplication(notification as NSNotification, runningApp as NSRunningApplication)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_WillPowerOff(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_WillSleep(notification as NSNotification)	#tag EndHook	#tag Hook, Flags = &h0		Event NSWorkspace_WillUnmount(notification as NSNotification, volumeURL as NSURL, volumeLocalizedName as String)	#tag EndHook	#tag Hook, Flags = &h0		Event Open()	#tag EndHook	#tag Property, Flags = &h0		DelegateHandler As NSWorkspaceNotificationInterface	#tag EndProperty	#tag Property, Flags = &h21		Private registered As Boolean	#tag EndProperty	#tag Constant, Name = kNotificationSelector, Type = String, Dynamic = False, Default = \"dispatchWorkspaceNotification:", Scope = Private	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="ClassName"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="CocoaDelegate"		#tag EndViewProperty		#tag ViewProperty			Name="Description"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="NSObject"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass