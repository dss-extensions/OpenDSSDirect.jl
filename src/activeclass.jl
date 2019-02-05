module ActiveClass

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """


    """Returns name of active class."""
    function ActiveClassName()::String
        return Utils.get_string(Lib.ActiveClass_Get_ActiveClassName())
    end


    """Array of strings consisting of all element names in the active class."""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.ActiveClass_Get_AllNames)
    end


    """Number of elements in Active Class. Same as NumElements Property."""
    function Count()::Int
        return Lib.ActiveClass_Get_Count()
    end


    """Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none."""
    function First()::Int
        return Lib.ActiveClass_Get_First()
    end


    """Name of the Active Element of the Active Class (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.ActiveClass_Get_Name())
    end

    """Name of the Active Element of the Active Class (Setter)"""
    function Name(Value::String)
        Lib.ActiveClass_Set_Name(Cstring(pointer(Value)))
    end


    """Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more."""
    function Next()::Int
        return Lib.ActiveClass_Get_Next()
    end


    """Number of elements in this class. Same as Count property."""
    function NumElements()::Int
        return Lib.ActiveClass_Get_NumElements()
    end

end # ActiveClass

