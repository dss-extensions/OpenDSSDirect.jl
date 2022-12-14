module Error

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Description of error for last operation"""
function Description(dss::DSSContext)::String
    return get_string(Lib.Error_Get_Description(dss.ctx))
end
Description() = Description(DSS_DEFAULT_CTX)

"""Error Number"""
function Number(dss::DSSContext)::Int
    return Lib.Error_Get_Number(dss.ctx)
end
Number() = Number(DSS_DEFAULT_CTX)

"""
Get/set the state of the Legacy Models mechanism (Getter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function ExtendedErrors(dss::DSSContext)::Bool
    return @checked(Lib.Error_Get_ExtendedErrors(dss.ctx)) != 0
end
ExtendedErrors() = ExtendedErrors(DSS_DEFAULT_CTX)

"""
Get/set the state of the Legacy Models mechanism (Setter)

If enabled, the legacy/deprecated models for PVSystem, InvControl, Storage and StorageControl are used.
WARNING: Changing the active value runs a "Clear" command, discarding the current circuit. 

Defaults to false (disabled state).

This can also be set through the environment variable DSS_CAPI_LEGACY_MODELS. Setting it to 1 enables
the legacy components, using the old models from the start.

(API Extension)
"""
function ExtendedErrors(dss::DSSContext, Value::Bool)
    @checked Lib.Error_Set_ExtendedErrors(dss.ctx, Value ? 1 : 0)
end
ExtendedErrors(Value::Bool) = ExtendedErrors(DSS_DEFAULT_CTX, Value)

"""EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True. (Getter)

(API Extension)"""
function EarlyAbort(dss::DSSContext)::Bool
    return (@checked Lib.Error_Get_EarlyAbort(dss.ctx)) != 0
end
EarlyAbort() = EarlyAbort(DSS_DEFAULT_CTX)

"""EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True. (Setter)

(API Extension) """
function EarlyAbort(dss::DSSContext, Value::Bool)
    return @checked Lib.Error_Set_EarlyAbort(dss.ctx, Value)
end
EarlyAbort(Value::Bool) = EarlyAbort(DSS_DEFAULT_CTX, Value)

end
