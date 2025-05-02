module Error

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Description of error for last operation

Original COM help: https://opendss.epri.com/Description1.html

(Getter)
"""
function Description(dss::DSSContext)::String
    return get_string(Lib.Error_Get_Description(dss.ctx))
end
Description() = Description(DSS_DEFAULT_CTX)

"""
Error Number (returns current value and then resets to zero)

Original COM help: https://opendss.epri.com/Number.html
"""
function Number(dss::DSSContext)::Int
    return Lib.Error_Get_Number(dss.ctx)
end
Number() = Number(DSS_DEFAULT_CTX)

"""
Set the description of error for last operation; for advanced usage, not typically used directly by users.

Original COM help: https://opendss.epri.com/Description1.html

(Setter)
"""
function Description(dss::DSSContext, Value::String)
    @checked Lib.Error_Set_Description(dss.ctx, Cstring(pointer(Value)))
end
Description(Value::String) = Description(DSS_DEFAULT_CTX, Value)

"""
Controls whether the extended error mechanism is used. Defaults to True.

Extended errors are errors derived from checks across the API to ensure
a valid state. Although many of these checks are already present in the
original/official COM interface, the checks do not produce any error
message. An error value can be returned by a function but this value
can, for many of the functions, be a valid value. As such, the user
has no means to detect an invalid API call.

Extended errors use the Error interface to provide a more clear message
and should help users, especially new users, to find usage issues earlier.

At Julia level, an exception is raised when an error is detected through
the Error interface.

The current default state is ON. For compatibility, the user can turn it
off to restore the previous behavior.

**(API Extension)**

(Getter)
"""
function ExtendedErrors(dss::DSSContext)::Bool
    return @checked(Lib.Error_Get_ExtendedErrors(dss.ctx)) != 0
end
ExtendedErrors() = ExtendedErrors(DSS_DEFAULT_CTX)

"""
Controls whether the extended error mechanism is used. Defaults to True.

Extended errors are errors derived from checks across the API to ensure
a valid state. Although many of these checks are already present in the
original/official COM interface, the checks do not produce any error
message. An error value can be returned by a function but this value
can, for many of the functions, be a valid value. As such, the user
has no means to detect an invalid API call.

Extended errors use the Error interface to provide a more clear message
and should help users, especially new users, to find usage issues earlier.

At Julia level, an exception is raised when an error is detected through
the Error interface.

The current default state is ON. For compatibility, the user can turn it
off to restore the previous behavior.

**(API Extension)**

(Setter)
"""
function ExtendedErrors(dss::DSSContext, Value::Bool)
    @checked Lib.Error_Set_ExtendedErrors(dss.ctx, Value ? 1 : 0)
end
ExtendedErrors(Value::Bool) = ExtendedErrors(DSS_DEFAULT_CTX, Value)

"""
EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True.

**(API Extension)**

(Getter)
"""
function EarlyAbort(dss::DSSContext)::Bool
    return (@checked Lib.Error_Get_EarlyAbort(dss.ctx)) != 0
end
EarlyAbort() = EarlyAbort(DSS_DEFAULT_CTX)

"""
EarlyAbort controls whether all errors halts the DSS script processing (Compile/Redirect), defaults to True.

**(API Extension)**

(Setter)
"""
function EarlyAbort(dss::DSSContext, Value::Bool)
    @checked Lib.Error_Set_EarlyAbort(dss.ctx, Value ? 1 : 0)
end
EarlyAbort(Value::Bool) = EarlyAbort(DSS_DEFAULT_CTX, Value)

end
