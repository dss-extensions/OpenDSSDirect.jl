module Capacitors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Check if Capacitor AddStep is set"""
function AddStep(dss::DSSContext)::Bool
    return @checked(Lib.Capacitors_AddStep(dss.ctx)) != 0
end
AddStep() = AddStep(DSS_DEFAULT_CTX)

"""Close all phases of Capacitor"""
function Close(dss::DSSContext)
    @checked Lib.Capacitors_Close(dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""Open all phases of Capacitor"""
function Open(dss::DSSContext)
    @checked Lib.Capacitors_Open(dss.ctx)
end
Open() = Open(DSS_DEFAULT_CTX)

"""Check if Capacitor SubtractStep is set"""
function SubtractStep(dss::DSSContext)::Bool
    return @checked(Lib.Capacitors_SubtractStep(dss.ctx)) != 0
end
SubtractStep() = SubtractStep(DSS_DEFAULT_CTX)

"""Array of strings with all Capacitor names in the circuit."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Capacitors_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of Steps available in cap bank to be switched ON."""
function AvailableSteps(dss::DSSContext)::Int
    return @checked Lib.Capacitors_Get_AvailableSteps(dss.ctx)
end
AvailableSteps() = AvailableSteps(DSS_DEFAULT_CTX)

"""Number of Capacitor objects in active circuit."""
function Count(dss::DSSContext)::Int
    return @checked Lib.Capacitors_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets the first Capacitor active. Returns 0 if no more."""
function First(dss::DSSContext)::Int
    return @checked Lib.Capacitors_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Delta connection or wye? (Getter)"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(Lib.Capacitors_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""Delta connection or wye? (Setter)"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked Lib.Capacitors_Set_IsDelta(dss.ctx, Value ? 1 : 0)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""Sets the active Capacitor by Name. (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Capacitors_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets the active Capacitor by Name. (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Capacitors_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next Capacitor active. Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Capacitors_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Number of steps (default 1) for distributing and switching the total bank kVAR. (Getter)"""
function NumSteps(dss::DSSContext)::Int
    return @checked Lib.Capacitors_Get_NumSteps(dss.ctx)
end
NumSteps() = NumSteps(DSS_DEFAULT_CTX)

"""Number of steps (default 1) for distributing and switching the total bank kVAR. (Setter)"""
function NumSteps(dss::DSSContext, Value::Int)
    @checked Lib.Capacitors_Set_NumSteps(dss.ctx, Value)
end
NumSteps(Value::Int) = NumSteps(DSS_DEFAULT_CTX, Value)

"""Array of  integer [0..numsteps-1] indicating state of each step. If value is -1 an error has occurred. (Getter)"""
function States(dss::DSSContext)::Vector{Int}
    return get_int32_array(Lib.Capacitors_Get_States, dss.ctx)
end
States() = States(DSS_DEFAULT_CTX)

"""Array of integer [0 ..numSteps-1] indicating the state of each step. (Setter)"""
function States(dss::DSSContext, Value)
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked Lib.Capacitors_Set_States(dss.ctx, ValuePtr, ValueCount)
end
States(Value) = States(DSS_DEFAULT_CTX, Value)

"""Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Getter)"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Capacitors_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Setter)"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.Capacitors_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""Total bank KVAR, distributed equally among phases and steps. (Getter)"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.Capacitors_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""Total bank KVAR, distributed equally among phases and steps. (Setter)"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.Capacitors_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""Capacitor Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Capacitors_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Capacitor Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Capacitors_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
