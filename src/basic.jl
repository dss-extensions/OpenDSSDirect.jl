module Basic

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Clear All"""
function ClearAll()
    @checked Lib.DSS_ClearAll()
end

"""Reset"""
function Reset()
    @checked Lib.DSS_Reset()
end

"""Set the Active Class"""
function SetActiveClass(ClassName::String)::Int
    return @checked Lib.DSS_SetActiveClass(ClassName)
end

"""Set the start code"""
function Start(code::Int)
    return @checked(Lib.DSS_Start(code)) != 0
end

"""List of DSS intrinsic classes (names of the classes)"""
function Classes()::Vector{String}
    return get_string_array(Lib.DSS_Get_Classes)
end

"""DSS Data File Path.  Default path for reports, etc. from DSS (Getter)"""
function DataPath()::String
    return get_string(Lib.DSS_Get_DataPath())
end

"""DSS Data File Path.  Default path for reports, etc. from DSS (Setter)"""
function DataPath(Value::String)
    @checked Lib.DSS_Set_DataPath(Cstring(pointer(Value)))
end

"""Returns the path name for the default text editor."""
function DefaultEditor()::String
    return get_string(@checked Lib.DSS_Get_DefaultEditor())
end

"""Number of Circuits currently defined"""
function NumCircuits()::Int
    return @checked Lib.DSS_Get_NumCircuits()
end

"""Number of DSS intrinsic classes"""
function NumClasses()::Int
    return @checked Lib.DSS_Get_NumClasses()
end

"""Number of user-defined classes"""
function NumUserClasses()::Int
    return @checked Lib.DSS_Get_NumUserClasses()
end

"""List of user-defined classes"""
function UserClasses()::Vector{String}
    return get_string_array(Lib.DSS_Get_UserClasses)
end

"""Get version string for the DSS."""
function Version()::String
    return get_string(@checked Lib.DSS_Get_Version())
end

"""Gets/sets whether text output is allowed (Getter)"""
function AllowForms()::Bool
    return @checked(Lib.DSS_Get_AllowForms()) != 0
end

"""Gets/sets whether text output is allowed (Setter)"""
function AllowForms(Value::Bool)
    @checked Lib.DSS_Set_AllowForms(Value ? 1 : 0)
end

function ShowPanel()
    @warn "ShowPanel is not implemented."
    return 0
end

"""Create a new circuit"""
function NewCircuit(name::String)::String
    @checked Lib.DSS_NewCircuit(Cstring(pointer(name)))
    return "New Circuit: $name"
end

end
