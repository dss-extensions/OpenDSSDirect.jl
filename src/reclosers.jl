module Reclosers

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close recloser"""
function Close(dss::DSSContext)
    @checked Lib.Reclosers_Close(dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""Open recloser"""
function Open(dss::DSSContext)
    @checked Lib.Reclosers_Open(dss.ctx)
end
Open() = Open(DSS_DEFAULT_CTX)

"""Array of strings with names of all Reclosers in Active Circuit"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Reclosers_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of Reclosers in active circuit."""
function Count(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Set First Recloser to be Active Ckt Element. Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Ground (3I0) instantaneous trip setting - instantaneous curve multipler or actual amps. (Getter)"""
function GroundInst(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_GroundInst(dss.ctx)
end
GroundInst() = GroundInst(DSS_DEFAULT_CTX)

"""Ground (3I0) instantaneous trip setting - instantaneous curve multipler or actual amps. (Setter)"""
function GroundInst(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_GroundInst(dss.ctx, Value)
end
GroundInst(Value::Float64) = GroundInst(DSS_DEFAULT_CTX, Value)

"""Ground (3I0) trip multiplier or actual amps (Getter)"""
function GroundTrip(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_GroundTrip(dss.ctx)
end
GroundTrip() = GroundTrip(DSS_DEFAULT_CTX)

"""Ground (3I0) trip multiplier or actual amps (Setter)"""
function GroundTrip(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_GroundTrip(dss.ctx, Value)
end
GroundTrip(Value::Float64) = GroundTrip(DSS_DEFAULT_CTX, Value)

"""Full name of object the Recloser is monitoring. (Getter)"""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked Lib.Reclosers_Get_MonitoredObj(dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""Full name of object the Recloser is monitoring. (Setter)"""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked Lib.Reclosers_Set_MonitoredObj(dss.ctx, Value)
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""Terminal number of Monitored object for the Recloser (Getter)"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_MonitoredTerm(dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""Terminal number of Monitored object for the Recloser (Setter)"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_MonitoredTerm(dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""Get Name of active Recloser or set the active Recloser by name. (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Reclosers_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Get Name of active Recloser or set the active Recloser by name. (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Reclosers_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Iterate to the next recloser in the circuit. Returns zero if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Number of fast shots (Getter)"""
function NumFast(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_NumFast(dss.ctx)
end
NumFast() = NumFast(DSS_DEFAULT_CTX)

"""Number of fast shots (Setter)"""
function NumFast(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_NumFast(dss.ctx, Value)
end
NumFast(Value::Int) = NumFast(DSS_DEFAULT_CTX, Value)

"""Phase instantaneous curve multipler or actual amps (Getter)"""
function PhaseInst(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_PhaseInst(dss.ctx)
end
PhaseInst() = PhaseInst(DSS_DEFAULT_CTX)

"""Phase instantaneous curve multipler or actual amps (Setter)"""
function PhaseInst(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_PhaseInst(dss.ctx, Value)
end
PhaseInst(Value::Float64) = PhaseInst(DSS_DEFAULT_CTX, Value)

"""Phase trip curve multiplier or actual amps (Getter)"""
function PhaseTrip(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_PhaseTrip(dss.ctx)
end
PhaseTrip() = PhaseTrip(DSS_DEFAULT_CTX)

"""Phase trip curve multiplier or actual amps (Setter)"""
function PhaseTrip(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_PhaseTrip(dss.ctx, Value)
end
PhaseTrip(Value::Float64) = PhaseTrip(DSS_DEFAULT_CTX, Value)

"""Variant Array of Doubles: reclose intervals, s, between shots."""
function RecloseIntervals(dss::DSSContext)
    return get_float64_array(Lib.Reclosers_Get_RecloseIntervals, dss.ctx)
end
RecloseIntervals() = RecloseIntervals(DSS_DEFAULT_CTX)

"""Number of shots to lockout (fast + delayed) (Getter)"""
function Shots(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_Shots(dss.ctx)
end
Shots() = Shots(DSS_DEFAULT_CTX)

"""Number of shots to lockout (fast + delayed) (Setter)"""
function Shots(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_Shots(dss.ctx, Value)
end
Shots(Value::Int) = Shots(DSS_DEFAULT_CTX, Value)

"""Full name of the circuit element that is being switched by the Recloser. (Getter)"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked Lib.Reclosers_Get_SwitchedObj(dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""Full name of the circuit element that is being switched by the Recloser. (Setter)"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked Lib.Reclosers_Set_SwitchedObj(dss.ctx, Value)
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""Terminal number of the controlled device being switched by the Recloser (Getter)"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_SwitchedTerm(dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""Terminal number of the controlled device being switched by the Recloser (Setter)"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_SwitchedTerm(dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

"""Get/Set the active Recloser by index into the recloser list.  1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Get/Set the active Recloser by index into the recloser list.  1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Present state of recloser. If set to open, open recloser's controlled element and lock out the recloser. If set to close, close recloser's controlled element and resets recloser to first operation. (Getter)"""
function State(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.Reclosers_Get_State(dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""Present state of recloser. If set to open, open recloser's controlled element and lock out the recloser. If set to close, close recloser's controlled element and resets recloser to first operation. (Setter)"""
function State(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Reclosers_Set_State(dss.ctx, Value)
end
State(Value::Union{Int,Lib.ActionCodes}) = State(DSS_DEFAULT_CTX, Value)

"""Normal state (Getter)"""
function NormalState(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.Reclosers_Get_NormalState(dss.ctx)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""Normal state (Setter)"""
function NormalState(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Reclosers_Set_NormalState(dss.ctx, Value)
end
NormalState(Value::Union{Int,Lib.ActionCodes}) = NormalState(DSS_DEFAULT_CTX, Value)

"""Reset recloser to normal state. If open, lock out the recloser. If closed, resets recloser to first operation."""
function Reset(dss::DSSContext)
    @checked Lib.Reclosers_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

end
