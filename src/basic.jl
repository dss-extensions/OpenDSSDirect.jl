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
    @checked Lib.DSS_ClearAll(C_NULL_CTX)
end

"""Reset"""
function Reset()
    @checked Lib.DSS_Reset(C_NULL_CTX)
end

"""Set the Active Class"""
function SetActiveClass(ClassName::String)::Int
    return @checked Lib.DSS_SetActiveClass(C_NULL_CTX, ClassName)
end

"""Set the start code"""
function Start(code::Int)
    return @checked(Lib.DSS_Start(C_NULL_CTX, code)) != 0
end

"""List of DSS intrinsic classes (names of the classes)"""
function Classes()::Vector{String}
    return get_string_array(Lib.DSS_Get_Classes, C_NULL_CTX)
end

"""DSS Data File Path.  Default path for reports, etc. from DSS (Getter)"""
function DataPath()::String
    return get_string(Lib.DSS_Get_DataPath(C_NULL_CTX))
end

"""DSS Data File Path.  Default path for reports, etc. from DSS (Setter)"""
function DataPath(Value::String)
    @checked Lib.DSS_Set_DataPath(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Returns the path name for the default text editor."""
function DefaultEditor()::String
    return get_string(@checked Lib.DSS_Get_DefaultEditor(C_NULL_CTX))
end

"""Number of Circuits currently defined"""
function NumCircuits()::Int
    return @checked Lib.DSS_Get_NumCircuits(C_NULL_CTX)
end

"""Number of DSS intrinsic classes"""
function NumClasses()::Int
    return @checked Lib.DSS_Get_NumClasses(C_NULL_CTX)
end

"""Number of user-defined classes"""
function NumUserClasses()::Int
    return @checked Lib.DSS_Get_NumUserClasses(C_NULL_CTX)
end

"""List of user-defined classes"""
function UserClasses()::Vector{String}
    return get_string_array(Lib.DSS_Get_UserClasses, C_NULL_CTX)
end

"""Get version string for the DSS."""
function Version()::String
    return get_string(@checked Lib.DSS_Get_Version(C_NULL_CTX))
end

"""Gets/sets whether text output is allowed (Getter)"""
function AllowForms()::Bool
    return @checked(Lib.DSS_Get_AllowForms(C_NULL_CTX)) != 0
end

"""Gets/sets whether text output is allowed (Setter)"""
function AllowForms(Value::Bool)
    @checked Lib.DSS_Set_AllowForms(C_NULL_CTX, Value ? 1 : 0)
end

function ShowPanel()
    @warn "ShowPanel is not implemented."
    return 0
end

"""Create a new circuit"""
function NewCircuit(name::String)::String
    @checked Lib.DSS_NewCircuit(C_NULL_CTX, Cstring(pointer(name)))
    return "New Circuit: $name"
end

"""
Gets/sets the state of the Legacy Models mechanism (Getter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function LegacyModelsLegacyModels()::Bool
    return @checked(Lib.DSS_Get_LegacyModels(C_NULL_CTX)) != 0
end

"""
Gets/sets the state of the Legacy Models mechanism (Setter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function LegacyModels(Value::Bool)
    @checked Lib.DSS_Set_LegacyModels(C_NULL_CTX, Value ? 1 : 0)
end

"""If enabled, in case of errors or empty arrays, the API returns arrays with values compatible with the 
official OpenDSS COM interface. 

For example, consider the function Loads_Get_ZIPV. If there is no active circuit or active load element:
- In the disabled state (COMErrorResults=False), the function will return "[]", an array with 0 elements.
- In the enabled state (COMErrorResults=True), the function will return "[0.0]" instead. This should
  be compatible with the return value of the official COM interface.

Defaults to True/1 (enabled state) in the v0.12.x series. This will change to false in future series.

This can also be set through the environment variable DSS_CAPI_COM_DEFAULTS. Setting it to 0 disables
the legacy/COM behavior. The value can be toggled through the API at any time.

(Getter)
(API Extension)
"""
function COMErrorResults()::Bool
    return (@checked Lib.DSS_Get_COMErrorResults(C_NULL_CTX)) != 0
end

"""If enabled, in case of errors or empty arrays, the API returns arrays with values compatible with the 
official OpenDSS COM interface. 

For example, consider the function Loads_Get_ZIPV. If there is no active circuit or active load element:
- In the disabled state (COMErrorResults=False), the function will return "[]", an array with 0 elements.
- In the enabled state (COMErrorResults=True), the function will return "[0.0]" instead. This should
  be compatible with the return value of the official COM interface.

Defaults to True/1 (enabled state) in the v0.12.x series. This will change to false in future series.

This can also be set through the environment variable DSS_CAPI_COM_DEFAULTS. Setting it to 0 disables
the legacy/COM behavior. The value can be toggled through the API at any time.

(Setter)
(API Extension)
"""
function COMErrorResults(Value::Bool)
    return @checked Lib.DSS_Set_COMErrorResults(C_NULL_CTX, Value)
end

"""If disabled, the engine will not change the active working directory during execution. E.g. a "compile"
command will not "chdir" to the file path.

If you have issues with long paths, enabling this might help in some scenarios.

Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API.
This might change to False in future versions.

This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to
disallow changing the active working directory.

(Getter)
(API Extension)"""
function AllowChangeDir()::Bool
    return (@checked Lib.DSS_Get_AllowChangeDir(C_NULL_CTX)) != 0
end

"""If disabled, the engine will not change the active working directory during execution. E.g. a "compile"
command will not "chdir" to the file path.

If you have issues with long paths, enabling this might help in some scenarios.

Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API.
This might change to False in future versions.

This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to
disallow changing the active working directory.

(Setter)
(API Extension)"""
function AllowChangeDir(Value::Bool)
    return @checked Lib.DSS_Set_AllowChangeDir(C_NULL_CTX, Value)
end

"""Gets/sets whether running the external editor for "Show" is allowed

AllowEditor controls whether the external editor is used in commands like "Show".
If you set to 0 (false), the editor is not executed. Note that other side effects,
such as the creation of files, are not affected.

(Getter)
(API Extension)"""
function AllowEditor()::Bool
    return (@checked Lib.DSS_Get_AllowEditor(C_NULL_CTX)) != 0
end

"""Gets/sets whether running the external editor for "Show" is allowed

AllowEditor controls whether the external editor is used in commands like "Show".
If you set to 0 (false), the editor is not executed. Note that other side effects,
such as the creation of files, are not affected. 

(Setter)
(API Extension)"""
function AllowEditor(Value::Bool)
    return @checked Lib.DSS_Set_AllowEditor(C_NULL_CTX, Value)
end

"""If enabled, the DOScmd command is allowed. Otherwise, an error is reported if the user tries to use it.
    
Defaults to False/0 (disabled state). Users should consider DOScmd deprecated on DSS Extensions.

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(Getter)
(API Extension)"""
function AllowDOScmd()::Bool
    return (@checked Lib.DSS_Get_AllowDOScmd(C_NULL_CTX)) != 0
end

"""If enabled, the DOScmd command is allowed. Otherwise, an error is reported if the user tries to use it.
    
Defaults to False/0 (disabled state). Users should consider DOScmd deprecated on DSS Extensions.

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(Setter)
(API Extension)"""
function AllowDOScmd(Value::Bool)
    return @checked Lib.DSS_Set_AllowDOScmd(C_NULL_CTX, Value)
end

end
