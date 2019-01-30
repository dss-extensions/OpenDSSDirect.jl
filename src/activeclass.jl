module ActiveClass

    using ..lib
    using ..utils

    """(read-only) Returns name of active class."""
    function ActiveClassName()::String
        get_string(lib.ActiveClass_Get_ActiveClassName())
    end


    """(read-only) Array of strings consisting of all element names in the active class."""
    function AllNames()::Vector{String}
        get_string_array(lib.ActiveClass_Get_AllNames)
    end


    """(read-only) Number of elements in Active Class. Same as NumElements Property."""
    function Count()::Int
        lib.ActiveClass_Get_Count()
    end


    """(read-only) Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none."""
    function First()::Int
        lib.ActiveClass_Get_First()
    end


    """Name of the Active Element of the Active Class (Getter)"""
    function Name()::String
        get_string(lib.ActiveClass_Get_Name())
    end

    """Name of the Active Element of the Active Class (Setter)"""
    function Name(Value::String)
        lib.ActiveClass_Set_Name(Cstring(pointer(Value)))
    end


    """(read-only) Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more."""
    function Next()::Int
        lib.ActiveClass_Get_Next()
    end


    """(read-only) Number of elements in this class. Same as Count property."""
    function NumElements()::Int
        lib.ActiveClass_Get_NumElements()
    end

end # ActiveClass

