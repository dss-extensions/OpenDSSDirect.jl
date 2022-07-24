module Error

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Description of error for last operation"""
function Description()::String
    return get_string(Lib.Error_Get_Description())
end

"""Error Number"""
function Number()::Int
    return Lib.Error_Get_Number()
end

"""
Get/set the state of the Legacy Models mechanism (Getter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function ExtendedErrors()::Bool
    return @checked(Lib.Error_Get_ExtendedErrors()) != 0
end

"""
Get/set the state of the Legacy Models mechanism (Setter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function ExtendedErrors(Value::Bool)
    @checked Lib.Error_Set_ExtendedErrors(Value ? 1 : 0)
end

"""EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True. (Getter)

(API Extension)"""
function EarlyAbort()::Bool
    return (@checked Lib.Error_Get_EarlyAbort()) != 0
end

"""EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True. (Setter)

(API Extension) """
function EarlyAbort(Value::Bool)
    return @checked Lib.Error_Set_EarlyAbort(Value)
end

end
