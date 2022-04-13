module Capacitors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Check if Capacitor AddStep is set"""
function AddStep()::Bool
    return @checked(Lib.Capacitors_AddStep()) != 0
end

"""Close all phases of Capacitor"""
function Close()
    @checked Lib.Capacitors_Close()
end

"""Open all phases of Capacitor"""
function Open()
    @checked Lib.Capacitors_Open()
end

"""Check if Capacitor SubtractStep is set"""
function SubtractStep()::Bool
    return @checked(Lib.Capacitors_SubtractStep()) != 0
end

"""Array of strings with all Capacitor names in the circuit."""
function AllNames()::Vector{String}
    return get_string_array(Lib.Capacitors_Get_AllNames)
end

"""Number of Steps available in cap bank to be switched ON."""
function AvailableSteps()::Int
    return @checked Lib.Capacitors_Get_AvailableSteps()
end

"""Number of Capacitor objects in active circuit."""
function Count()::Int
    return @checked Lib.Capacitors_Get_Count()
end

"""Sets the first Capacitor active. Returns 0 if no more."""
function First()::Int
    return @checked Lib.Capacitors_Get_First()
end

"""Delta connection or wye? (Getter)"""
function IsDelta()::Bool
    return @checked(Lib.Capacitors_Get_IsDelta()) != 0
end

"""Delta connection or wye? (Setter)"""
function IsDelta(Value::Bool)
    @checked Lib.Capacitors_Set_IsDelta(Value ? 1 : 0)
end

"""Sets the active Capacitor by Name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Capacitors_Get_Name())
end

"""Sets the active Capacitor by Name. (Setter)"""
function Name(Value::String)
    @checked Lib.Capacitors_Set_Name(Cstring(pointer(Value)))
end

"""Sets the next Capacitor active. Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Capacitors_Get_Next()
end

"""Number of steps (default 1) for distributing and switching the total bank kVAR. (Getter)"""
function NumSteps()::Int
    return @checked Lib.Capacitors_Get_NumSteps()
end

"""Number of steps (default 1) for distributing and switching the total bank kVAR. (Setter)"""
function NumSteps(Value::Int)
    @checked Lib.Capacitors_Set_NumSteps(Value)
end

"""Array of  integer [0..numsteps-1] indicating state of each step. If value is -1 an error has occurred. (Getter)"""
function States()::Vector{Int}
    return get_int32_array(Lib.Capacitors_Get_States)
end

"""Array of integer [0 ..numSteps-1] indicating the state of each step. (Setter)"""
function States(Value)
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked Lib.Capacitors_Set_States(ValuePtr, ValueCount)
end

"""Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Getter)"""
function kV()::Float64
    return @checked Lib.Capacitors_Get_kV()
end

"""Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Setter)"""
function kV(Value::Float64)
    @checked Lib.Capacitors_Set_kV(Value)
end

"""Total bank KVAR, distributed equally among phases and steps. (Getter)"""
function kvar()::Float64
    return @checked Lib.Capacitors_Get_kvar()
end

"""Total bank KVAR, distributed equally among phases and steps. (Setter)"""
function kvar(Value::Float64)
    @checked Lib.Capacitors_Set_kvar(Value)
end

"""Capacitor Index (Getter)"""
function Idx()::Int
    return @checked Lib.Capacitors_Get_idx()
end

"""Capacitor Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Capacitors_Set_idx(Value)
end

end
