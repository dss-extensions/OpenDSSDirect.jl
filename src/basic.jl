module Basic

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Clear All"""
    function ClearAll()
        Lib.DSS_ClearAll()
    end

    """Reset"""
    function Reset()
        Lib.DSS_Reset()
    end

    """Set the Active Class"""
    function SetActiveClass(ClassName::String)::Int
        return Lib.DSS_SetActiveClass(ClassName)
    end

    """Set the start code"""
    function Start(code::Int)
        return Lib.DSS_Start(code) != 0
    end

    """List of DSS intrinsic classes (names of the classes)"""
    function Classes()::Vector{String}
        return Utils.get_string_array(Lib.DSS_Get_Classes)
    end

    """DSS Data File Path.  Default path for reports, etc. from DSS (Getter)"""
    function DataPath()::String
        return Utils.get_string(Lib.DSS_Get_DataPath())
    end

    """DSS Data File Path.  Default path for reports, etc. from DSS (Setter)"""
    function DataPath(Value::String)
        Lib.DSS_Set_DataPath(Cstring(pointer(Value)))
    end

    """Returns the path name for the default text editor."""
    function DefaultEditor()::String
        return Utils.get_string(Lib.DSS_Get_DefaultEditor())
    end

    """Number of Circuits currently defined"""
    function NumCircuits()::Int
        return Lib.DSS_Get_NumCircuits()
    end

    """Number of DSS intrinsic classes"""
    function NumClasses()::Int
        return Lib.DSS_Get_NumClasses()
    end

    """Number of user-defined classes"""
    function NumUserClasses()::Int
        return Lib.DSS_Get_NumUserClasses()
    end

    """List of user-defined classes"""
    function UserClasses()::Vector{String}
        return Utils.get_string_array(Lib.DSS_Get_UserClasses)
    end

    """Get version string for the DSS."""
    function Version()::String
        return Utils.get_string(Lib.DSS_Get_Version())
    end

    """Gets/sets whether text output is allowed (Getter)"""
    function AllowForms()::Bool
        return Lib.DSS_Get_AllowForms() != 0
    end

    """Gets/sets whether text output is allowed (Setter)"""
    function AllowForms(Value::Bool)
        Lib.DSS_Set_AllowForms(Value ? 1 : 0)
    end

    function ShowPanel()
        @warn "ShowPanel is not implemented."
        return 0
    end

    """Create a new circuit"""
    function NewCircuit(name::String)::String
        Lib.DSS_NewCircuit(Cstring(pointer(name)))
        error_num = Lib.Error_Get_Number()
        if (error_num != 0)
            description = Utils.get_string(Lib.Error_Get_Description())
            throw(
                OpenDSSDirectException(
                    "[ERROR $error_num] $description"
               )
            )
        end

        return "New Circuit"
    end

end
