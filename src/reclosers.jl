module Reclosers

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close recloser"""
function Close()
    @checked Lib.Reclosers_Close(C_NULL_CTX)
end

"""Open recloser"""
function Open()
    @checked Lib.Reclosers_Open(C_NULL_CTX)
end

"""Array of strings with names of all Reclosers in Active Circuit"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Reclosers_Get_AllNames, C_NULL_CTX)
end

"""Number of Reclosers in active circuit."""
function Count()::Int
    return @checked Lib.Reclosers_Get_Count(C_NULL_CTX)
end

"""Set First Recloser to be Active Ckt Element. Returns 0 if none."""
function First()::Int
    return @checked Lib.Reclosers_Get_First(C_NULL_CTX)
end

"""Ground (3I0) instantaneous trip setting - instantaneous curve multipler or actual amps. (Getter)"""
function GroundInst()::Float64
    return @checked Lib.Reclosers_Get_GroundInst(C_NULL_CTX)
end

"""Ground (3I0) instantaneous trip setting - instantaneous curve multipler or actual amps. (Setter)"""
function GroundInst(Value::Float64)
    @checked Lib.Reclosers_Set_GroundInst(C_NULL_CTX, Value)
end

"""Ground (3I0) trip multiplier or actual amps (Getter)"""
function GroundTrip()::Float64
    return @checked Lib.Reclosers_Get_GroundTrip(C_NULL_CTX)
end

"""Ground (3I0) trip multiplier or actual amps (Setter)"""
function GroundTrip(Value::Float64)
    @checked Lib.Reclosers_Set_GroundTrip(C_NULL_CTX, Value)
end

"""Full name of object the Recloser is monitoring. (Getter)"""
function MonitoredObj()::String
    return get_string(@checked Lib.Reclosers_Get_MonitoredObj(C_NULL_CTX))
end

"""Full name of object the Recloser is monitoring. (Setter)"""
function MonitoredObj(Value::String)
    @checked Lib.Reclosers_Set_MonitoredObj(C_NULL_CTX, Value)
end

"""Terminal number of Monitored object for the Recloser (Getter)"""
function MonitoredTerm()::Int
    return @checked Lib.Reclosers_Get_MonitoredTerm(C_NULL_CTX)
end

"""Terminal number of Monitored object for the Recloser (Setter)"""
function MonitoredTerm(Value::Int)
    @checked Lib.Reclosers_Set_MonitoredTerm(C_NULL_CTX, Value)
end

"""Get Name of active Recloser or set the active Recloser by name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Reclosers_Get_Name(C_NULL_CTX))
end

"""Get Name of active Recloser or set the active Recloser by name. (Setter)"""
function Name(Value::String)
    @checked Lib.Reclosers_Set_Name(C_NULL_CTX, Value)
end

"""Iterate to the next recloser in the circuit. Returns zero if no more."""
function Next()::Int
    return @checked Lib.Reclosers_Get_Next(C_NULL_CTX)
end

"""Number of fast shots (Getter)"""
function NumFast()::Int
    return @checked Lib.Reclosers_Get_NumFast(C_NULL_CTX)
end

"""Number of fast shots (Setter)"""
function NumFast(Value::Int)
    @checked Lib.Reclosers_Set_NumFast(C_NULL_CTX, Value)
end

"""Phase instantaneous curve multipler or actual amps (Getter)"""
function PhaseInst()::Float64
    return @checked Lib.Reclosers_Get_PhaseInst(C_NULL_CTX)
end

"""Phase instantaneous curve multipler or actual amps (Setter)"""
function PhaseInst(Value::Float64)
    @checked Lib.Reclosers_Set_PhaseInst(C_NULL_CTX, Value)
end

"""Phase trip curve multiplier or actual amps (Getter)"""
function PhaseTrip()::Float64
    return @checked Lib.Reclosers_Get_PhaseTrip(C_NULL_CTX)
end

"""Phase trip curve multiplier or actual amps (Setter)"""
function PhaseTrip(Value::Float64)
    @checked Lib.Reclosers_Set_PhaseTrip(C_NULL_CTX, Value)
end

"""Variant Array of Doubles: reclose intervals, s, between shots."""
function RecloseIntervals()
    return get_float64_array(Lib.Reclosers_Get_RecloseIntervals, C_NULL_CTX)
end

"""Number of shots to lockout (fast + delayed) (Getter)"""
function Shots()::Int
    return @checked Lib.Reclosers_Get_Shots(C_NULL_CTX)
end

"""Number of shots to lockout (fast + delayed) (Setter)"""
function Shots(Value::Int)
    @checked Lib.Reclosers_Set_Shots(C_NULL_CTX, Value)
end

"""Full name of the circuit element that is being switched by the Recloser. (Getter)"""
function SwitchedObj()::String
    return get_string(@checked Lib.Reclosers_Get_SwitchedObj(C_NULL_CTX))
end

"""Full name of the circuit element that is being switched by the Recloser. (Setter)"""
function SwitchedObj(Value::String)
    @checked Lib.Reclosers_Set_SwitchedObj(C_NULL_CTX, Value)
end

"""Terminal number of the controlled device being switched by the Recloser (Getter)"""
function SwitchedTerm()::Int
    return @checked Lib.Reclosers_Get_SwitchedTerm(C_NULL_CTX)
end

"""Terminal number of the controlled device being switched by the Recloser (Setter)"""
function SwitchedTerm(Value::Int)
    @checked Lib.Reclosers_Set_SwitchedTerm(C_NULL_CTX, Value)
end

"""Get/Set the active Recloser by index into the recloser list.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.Reclosers_Get_idx(C_NULL_CTX)
end

"""Get/Set the active Recloser by index into the recloser list.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.Reclosers_Set_idx(C_NULL_CTX, Value)
end

"""Present state of recloser. If set to open, open recloser's controlled element and lock out the recloser. If set to close, close recloser's controlled element and resets recloser to first operation. (Getter)"""
function State()::Lib.ActionCodes
    return @checked Lib.Reclosers_Get_State(C_NULL_CTX)
end

"""Present state of recloser. If set to open, open recloser's controlled element and lock out the recloser. If set to close, close recloser's controlled element and resets recloser to first operation. (Setter)"""
function State(Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Reclosers_Set_State(C_NULL_CTX, Value)
end

"""Normal state (Getter)"""
function NormalState()::Lib.ActionCodes
    return @checked Lib.Reclosers_Get_NormalState(C_NULL_CTX)
end

"""Normal state (Setter)"""
function NormalState(Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Reclosers_Set_NormalState(C_NULL_CTX, Value)
end

"""Reset recloser to normal state. If open, lock out the recloser. If closed, resets recloser to first operation."""
function Reset()
    @checked Lib.Reclosers_Reset(C_NULL_CTX)
end

end
