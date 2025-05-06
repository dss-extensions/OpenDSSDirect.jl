module Capacitors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Capacitors objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Capacitors_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Capacitors object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Capacitors_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Capacitors object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Capacitors_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Capacitors Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Capacitors_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Capacitors to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Capacitors_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Capacitors to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Capacitors_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Capacitors (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Capacitors_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Capacitors by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Capacitors_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Check if Capacitor AddStep is set"""
function AddStep(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Capacitors_AddStep, dss.ctx)) != 0
end
AddStep() = AddStep(DSS_DEFAULT_CTX)

"""Close all phases of Capacitor"""
function Close(dss::DSSContext)
    @checked dss_ccall(dss.capi.Capacitors_Close, dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""Open all phases of Capacitor"""
function Open(dss::DSSContext)
    @checked dss_ccall(dss.capi.Capacitors_Open, dss.ctx)
end
Open() = Open(DSS_DEFAULT_CTX)

"""Check if Capacitor SubtractStep is set"""
function SubtractStep(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Capacitors_SubtractStep, dss.ctx)) != 0
end
SubtractStep() = SubtractStep(DSS_DEFAULT_CTX)

"""
Number of Steps available in cap bank to be switched ON.

Original COM help: https://opendss.epri.com/AvailableSteps.html
"""
function AvailableSteps(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Capacitors_Get_AvailableSteps, dss.ctx)
end
AvailableSteps() = AvailableSteps(DSS_DEFAULT_CTX)

"""
Delta connection or wye?

Original COM help: https://opendss.epri.com/IsDelta.html

(Getter)
"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Capacitors_Get_IsDelta, dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""
Delta connection or wye?

Original COM help: https://opendss.epri.com/IsDelta.html

(Setter)
"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Capacitors_Set_IsDelta, dss.ctx, Value ? 1 : 0)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""
Number of steps (default 1) for distributing and switching the total bank kVAR.

Original COM help: https://opendss.epri.com/NumSteps.html

(Getter)
"""
function NumSteps(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Capacitors_Get_NumSteps, dss.ctx)
end
NumSteps() = NumSteps(DSS_DEFAULT_CTX)

"""
Number of steps (default 1) for distributing and switching the total bank kVAR.

Original COM help: https://opendss.epri.com/NumSteps.html

(Setter)
"""
function NumSteps(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Capacitors_Set_NumSteps, dss.ctx, Value)
end
NumSteps(Value::Int) = NumSteps(DSS_DEFAULT_CTX, Value)

"""
An array of integers [0..NumSteps-1] indicating state of each step. If the read value is -1 an error has occurred.

Original COM help: https://opendss.epri.com/States.html

(Getter)
"""
function States(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.Capacitors_Get_States, dss)
end
States() = States(DSS_DEFAULT_CTX)

"""
An array of integers [0..NumSteps-1] indicating state of each step. If the read value is -1 an error has occurred.

Original COM help: https://opendss.epri.com/States.html

(Setter)
"""
function States(dss::DSSContext, Value)
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked dss_ccall(dss.capi.Capacitors_Set_States, dss.ctx, ValuePtr, ValueCount)
end
States(Value) = States(DSS_DEFAULT_CTX, Value)

"""
Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.

Original COM help: https://opendss.epri.com/kV.html

(Getter)
"""
function kV(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Capacitors_Get_kV, dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""
Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.

Original COM help: https://opendss.epri.com/kV.html

(Setter)
"""
function kV(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Capacitors_Set_kV, dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""
Total bank KVAR, distributed equally among phases and steps.

(Getter)
"""
function kvar(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Capacitors_Get_kvar, dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""
Total bank KVAR, distributed equally among phases and steps.

(Setter)
"""
function kvar(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Capacitors_Set_kvar, dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

end
