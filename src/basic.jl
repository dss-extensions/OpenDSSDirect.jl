module Basic

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Clear All"""
function ClearAll(dss::DSSContext)
    @checked Lib.DSS_ClearAll(dss.ctx)
end
ClearAll() = ClearAll(DSS_DEFAULT_CTX)

"""Reset"""
function Reset(dss::DSSContext)
    @checked Lib.DSS_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""Set the Active Class"""
function SetActiveClass(dss::DSSContext, ClassName::String)::Int
    return @checked Lib.DSS_SetActiveClass(dss.ctx, ClassName)
end
SetActiveClass(ClassName::String) = SetActiveClass(DSS_DEFAULT_CTX, ClassName)

"""Set the start code"""
function Start(dss::DSSContext, code::Int)
    return @checked(Lib.DSS_Start(dss.ctx, code)) != 0
end
Start(code::Int) = Start(DSS_DEFAULT_CTX, code)

"""List of DSS intrinsic classes (names of the classes)"""
function Classes(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.DSS_Get_Classes, dss.ctx)
end
Classes() = Classes(DSS_DEFAULT_CTX)

"""DSS Data File Path.  Default path for reports, etc. from DSS (Getter)"""
function DataPath(dss::DSSContext)::String
    return get_string(Lib.DSS_Get_DataPath(dss.ctx))
end
DataPath() = DataPath(DSS_DEFAULT_CTX)

"""DSS Data File Path.  Default path for reports, etc. from DSS (Setter)"""
function DataPath(dss::DSSContext, Value::String)
    @checked Lib.DSS_Set_DataPath(dss.ctx, Cstring(pointer(Value)))
end
DataPath(Value::String) = DataPath(DSS_DEFAULT_CTX, Value)

"""Returns the path name for the default text editor."""
function DefaultEditor(dss::DSSContext)::String
    return get_string(@checked Lib.DSS_Get_DefaultEditor(dss.ctx))
end
DefaultEditor() = DefaultEditor(DSS_DEFAULT_CTX)

"""Number of Circuits currently defined"""
function NumCircuits(dss::DSSContext)::Int
    return @checked Lib.DSS_Get_NumCircuits(dss.ctx)
end
NumCircuits() = NumCircuits(DSS_DEFAULT_CTX)

"""Number of DSS intrinsic classes"""
function NumClasses(dss::DSSContext)::Int
    return @checked Lib.DSS_Get_NumClasses(dss.ctx)
end
NumClasses() = NumClasses(DSS_DEFAULT_CTX)

"""Number of user-defined classes"""
function NumUserClasses(dss::DSSContext)::Int
    return @checked Lib.DSS_Get_NumUserClasses(dss.ctx)
end
NumUserClasses() = NumUserClasses(DSS_DEFAULT_CTX)

"""List of user-defined classes"""
function UserClasses(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.DSS_Get_UserClasses, dss.ctx)
end
UserClasses() = UserClasses(DSS_DEFAULT_CTX)

"""Get version string for the DSS."""
function Version(dss::DSSContext)::String
    return get_string(@checked Lib.DSS_Get_Version(dss.ctx))
end
Version() = Version(DSS_DEFAULT_CTX)

"""Gets/sets whether text output is allowed (Getter)"""
function AllowForms(dss::DSSContext)::Bool
    return @checked(Lib.DSS_Get_AllowForms(dss.ctx)) != 0
end
AllowForms() = AllowForms(DSS_DEFAULT_CTX)

"""Gets/sets whether text output is allowed (Setter)"""
function AllowForms(dss::DSSContext, Value::Bool)
    @checked Lib.DSS_Set_AllowForms(dss.ctx, Value ? 1 : 0)
end
AllowForms(Value::Bool) = AllowForms(DSS_DEFAULT_CTX, Value)

function ShowPanel()
    @warn "ShowPanel is not implemented."
    return 0
end

"""Create a new circuit"""
function NewCircuit(dss::DSSContext, name::String)::String
    @checked Lib.DSS_NewCircuit(dss.ctx, Cstring(pointer(name)))
    return "New Circuit: $name"
end
NewCircuit(name::String) = NewCircuit(DSS_DEFAULT_CTX, name)

"""
Gets/sets the state of the Legacy Models mechanism (Getter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function LegacyModelsLegacyModels(dss::DSSContext)::Bool
    return @checked(Lib.DSS_Get_LegacyModels(dss.ctx)) != 0
end
LegacyModelsLegacyModels() = LegacyModelsLegacyModels(DSS_DEFAULT_CTX)

"""
Gets/sets the state of the Legacy Models mechanism (Setter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function LegacyModels(dss::DSSContext, Value::Bool)
    @checked Lib.DSS_Set_LegacyModels(dss.ctx, Value ? 1 : 0)
end
LegacyModels(Value::Bool) = LegacyModels(DSS_DEFAULT_CTX, Value)

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
function COMErrorResults(dss::DSSContext)::Bool
    return (@checked Lib.DSS_Get_COMErrorResults(dss.ctx)) != 0
end
COMErrorResults() = COMErrorResults(DSS_DEFAULT_CTX)

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
function COMErrorResults(dss::DSSContext, Value::Bool)
    return @checked Lib.DSS_Set_COMErrorResults(dss.ctx, Value)
end
COMErrorResults(Value::Bool) = COMErrorResults(DSS_DEFAULT_CTX, Value)

"""If disabled, the engine will not change the active working directory during execution. E.g. a "compile"
command will not "chdir" to the file path.

If you have issues with long paths, enabling this might help in some scenarios.

Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API.
This might change to False in future versions.

This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to
disallow changing the active working directory.

(Getter)
(API Extension)"""
function AllowChangeDir(dss::DSSContext)::Bool
    return (@checked Lib.DSS_Get_AllowChangeDir(dss.ctx)) != 0
end
AllowChangeDir() = AllowChangeDir(DSS_DEFAULT_CTX)

"""If disabled, the engine will not change the active working directory during execution. E.g. a "compile"
command will not "chdir" to the file path.

If you have issues with long paths, enabling this might help in some scenarios.

Defaults to True (allow changes, backwards compatible) in the 0.10.x versions of DSS C-API.
This might change to False in future versions.

This can also be set through the environment variable DSS_CAPI_ALLOW_CHANGE_DIR. Set it to 0 to
disallow changing the active working directory.

(Setter)
(API Extension)"""
function AllowChangeDir(dss::DSSContext, Value::Bool)
    return @checked Lib.DSS_Set_AllowChangeDir(dss.ctx, Value)
end
AllowChangeDir(Value::Bool) = AllowChangeDir(DSS_DEFAULT_CTX, Value)

"""Gets/sets whether running the external editor for "Show" is allowed

AllowEditor controls whether the external editor is used in commands like "Show".
If you set to 0 (false), the editor is not executed. Note that other side effects,
such as the creation of files, are not affected.

(Getter)
(API Extension)"""
function AllowEditor(dss::DSSContext)::Bool
    return (@checked Lib.DSS_Get_AllowEditor(dss.ctx)) != 0
end
AllowEditor() = AllowEditor(DSS_DEFAULT_CTX)

"""Gets/sets whether running the external editor for "Show" is allowed

AllowEditor controls whether the external editor is used in commands like "Show".
If you set to 0 (false), the editor is not executed. Note that other side effects,
such as the creation of files, are not affected. 

(Setter)
(API Extension)"""
function AllowEditor(dss::DSSContext, Value::Bool)
    return @checked Lib.DSS_Set_AllowEditor(dss.ctx, Value)
end
AllowEditor(Value::Bool) = AllowEditor(DSS_DEFAULT_CTX, Value)

"""If enabled, the DOScmd command is allowed. Otherwise, an error is reported if the user tries to use it.
    
Defaults to False/0 (disabled state). Users should consider DOScmd deprecated on DSS Extensions.

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(Getter)
(API Extension)"""
function AllowDOScmd(dss::DSSContext)::Bool
    return (@checked Lib.DSS_Get_AllowDOScmd(dss.ctx)) != 0
end
AllowDOScmd() = AllowDOScmd(DSS_DEFAULT_CTX)

"""If enabled, the DOScmd command is allowed. Otherwise, an error is reported if the user tries to use it.
    
Defaults to False/0 (disabled state). Users should consider DOScmd deprecated on DSS Extensions.

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(Setter)
(API Extension)"""
function AllowDOScmd(dss::DSSContext, Value::Bool)
    return @checked Lib.DSS_Set_AllowDOScmd(dss.ctx, Value)
end
AllowDOScmd(Value::Bool) = AllowDOScmd(DSS_DEFAULT_CTX, Value)

"""
Create a new DSS engine context.
(API Extension)
"""
function NewContext()::DSSContext
    return DSSContext(Lib.ctx_New())
end

"""
Disposes a DSS engine context. 
Cannot be called with the prime instance.
(API Extension)
"""
function DisposeContext(dss::DSSContext)
    return DSSContext(Lib.ctx_Dispose(dss.ctx))
end

end