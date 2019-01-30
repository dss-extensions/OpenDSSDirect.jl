module Basic

    using ..utils
    using ..lib

    function ClearAll()
        lib.DSS_ClearAll()
    end

    function Reset()
        lib.DSS_Reset()
    end

    function SetActiveClass(ClassName::String)::Int
        return lib.DSS_SetActiveClass(Cstring(pointer(ClassName)))
    end

    function Start(code::Int)
        return lib.DSS_Start(code) != 0
    end

    """(read-only) List of DSS intrinsic classes (names of the classes)"""
    function Classes()::Vector{String}
        return get_string_array(lib.DSS_Get_Classes)
    end

    """DSS Data File Path.  Default path for reports, etc. from DSS (Getter)"""
    function DataPath()::String
        return get_string(lib.DSS_Get_DataPath())
    end

    """DSS Data File Path.  Default path for reports, etc. from DSS (Setter)"""
    function DataPath(Value::String)
        lib.DSS_Set_DataPath(Cstring(pointer(Value)))
    end

    """(read-only) Returns the path name for the default text editor."""
    function DefaultEditor()::String
        return get_string(lib.DSS_Get_DefaultEditor())
    end

    """(read-only) Number of Circuits currently defined"""
    function NumCircuits()::Int
        return lib.DSS_Get_NumCircuits()
    end

    """(read-only) Number of DSS intrinsic classes"""
    function NumClasses()::Int
        return lib.DSS_Get_NumClasses()
    end

    """(read-only) Number of user-defined classes"""
    function NumUserClasses()::Int
        return lib.DSS_Get_NumUserClasses()
    end

    """(read-only) List of user-defined classes"""
    function UserClasses()::Vector{String}
        return get_string_array(lib.DSS_Get_UserClasses)
    end

    """(read-only) Get version string for the DSS."""
    function Version()::String
        return get_string(lib.DSS_Get_Version())
    end

    """Gets/sets whether text output is allowed (Getter)"""
    function AllowForms()::Bool
        return lib.DSS_Get_AllowForms() != 0
    end

    """Gets/sets whether text output is allowed (Setter)"""
    function AllowForms(Value::String)
        lib.DSS_Set_AllowForms(Cstring(pointer(Value)))
    end

    function ShowPanel()
        @warn "ShowPanel is not implemented."
        return 0
    end

    function NewCircuit(name::String)::String
        lib.DSS_NewCircuit(Cstring(pointer(name)))
        error_num = lib.Error_Get_Number()
        if ~(error_num == 0)
            description = get_string(lib.Error_Get_Description())
            throw(
                OpenDSSDirectException(
                    "[ERROR $error_num] $description"
               )
            )
        end

        return "New Circuit"
    end

end
