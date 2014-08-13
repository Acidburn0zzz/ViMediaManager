#tag ModuleProtected Module IntrospectionExtensions	#tag Method, Flags = &h0		Function ClassName(extends obj as Object) As string		  //# Gets the class name of the passed object		  		  return   Introspection.GetType( obj ).FullName		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function HasAttribute(extends obj as Object, wantedName as string) As boolean		  //# Returns true if the object has the given attribute name		  		  Dim myAttributes() as Introspection.AttributeInfo= _		  Introspection.GetType( obj ).GetAttributes		  		  For i as Integer = 0 to Ubound(myAttributes)		    if myAttributes(i).Name = wantedName then		      return true //found		    end if		  Next		  		  return false //Not found		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function HasProperty(extends obj as Object, wantedProperty as string) As boolean		  //# Returns true if the object has the given property name		  		  Dim myProperties() as Introspection.PropertyInfo= _		  Introspection.GetType( obj ).GetProperties		  		  For i as Integer = 0 to Ubound(myProperties)		    if myProperties( i ).Name = wantedProperty then		      return true //found		    end if		  Next		  		  return false //Not found		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function PropertyValue(extends obj as Object, propName as string) As variant		  //# Get the property value of the passed object and name		  		  Dim myProperties() as Introspection.PropertyInfo= _		  Introspection.GetType( obj ).GetProperties		  		  For i as Integer = 0 to Ubound(myProperties)		    if myProperties( i ).Name = propName then		      return   myProperties( i ).Value( obj )		    end if		  Next		  		  return   nil		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub PropertyValue(extends obj as Object, propName as string, assigns newValue as variant)		  //# Set the property value of the passed object and name		  		  Dim myProperties() as Introspection.PropertyInfo= _		  Introspection.GetType( obj ).GetProperties		  		  For i as Integer = 0 to Ubound(myProperties)		    if myProperties( i ).Name = propName then		      myProperties( i ).Value( obj ) = newValue		    end if		  Next		  		End Sub	#tag EndMethod	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule