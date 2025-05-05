module Reclosers

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Recloser objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Reclosers_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Recloser object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Reclosers_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Recloser object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Reclosers_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Recloser Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Recloser to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Recloser to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Recloser (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Recloser by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

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

"""
Ground (3I0) instantaneous trip setting - curve multiplier or actual amps.

Original COM help: https://opendss.epri.com/GroundInst.html

(Getter)
"""
function GroundInst(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_GroundInst(dss.ctx)
end
GroundInst() = GroundInst(DSS_DEFAULT_CTX)

"""
Ground (3I0) instantaneous trip setting - curve multiplier or actual amps.

Original COM help: https://opendss.epri.com/GroundInst.html

(Setter)
"""
function GroundInst(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_GroundInst(dss.ctx, Value)
end
GroundInst(Value::Float64) = GroundInst(DSS_DEFAULT_CTX, Value)

"""
Ground (3I0) trip multiplier or actual amps

Original COM help: https://opendss.epri.com/GroundTrip.html

(Getter)
"""
function GroundTrip(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_GroundTrip(dss.ctx)
end
GroundTrip() = GroundTrip(DSS_DEFAULT_CTX)

"""
Ground (3I0) trip multiplier or actual amps

Original COM help: https://opendss.epri.com/GroundTrip.html

(Setter)
"""
function GroundTrip(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_GroundTrip(dss.ctx, Value)
end
GroundTrip(Value::Float64) = GroundTrip(DSS_DEFAULT_CTX, Value)

"""
Full name of object this Recloser to be monitored.

Original COM help: https://opendss.epri.com/MonitoredObj2.html

(Getter)
"""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked Lib.Reclosers_Get_MonitoredObj(dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""
Full name of object this Recloser to be monitored.

Original COM help: https://opendss.epri.com/MonitoredObj2.html

(Setter)
"""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked Lib.Reclosers_Set_MonitoredObj(dss.ctx, Value)
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""
Terminal number of Monitored object for the Recloser

Original COM help: https://opendss.epri.com/MonitoredTerm2.html

(Getter)
"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_MonitoredTerm(dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""
Terminal number of Monitored object for the Recloser

Original COM help: https://opendss.epri.com/MonitoredTerm2.html

(Setter)
"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_MonitoredTerm(dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""
Number of fast shots

Original COM help: https://opendss.epri.com/NumFast.html

(Getter)
"""
function NumFast(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_NumFast(dss.ctx)
end
NumFast() = NumFast(DSS_DEFAULT_CTX)

"""
Number of fast shots

Original COM help: https://opendss.epri.com/NumFast.html

(Setter)
"""
function NumFast(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_NumFast(dss.ctx, Value)
end
NumFast(Value::Int) = NumFast(DSS_DEFAULT_CTX, Value)

"""
Phase instantaneous curve multiplier or actual amps

Original COM help: https://opendss.epri.com/PhaseInst.html

(Getter)
"""
function PhaseInst(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_PhaseInst(dss.ctx)
end
PhaseInst() = PhaseInst(DSS_DEFAULT_CTX)

"""
Phase instantaneous curve multiplier or actual amps

Original COM help: https://opendss.epri.com/PhaseInst.html

(Setter)
"""
function PhaseInst(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_PhaseInst(dss.ctx, Value)
end
PhaseInst(Value::Float64) = PhaseInst(DSS_DEFAULT_CTX, Value)

"""
Phase trip curve multiplier or actual amps

Original COM help: https://opendss.epri.com/PhaseTrip.html

(Getter)
"""
function PhaseTrip(dss::DSSContext)::Float64
    return @checked Lib.Reclosers_Get_PhaseTrip(dss.ctx)
end
PhaseTrip() = PhaseTrip(DSS_DEFAULT_CTX)

"""
Phase trip curve multiplier or actual amps

Original COM help: https://opendss.epri.com/PhaseTrip.html

(Setter)
"""
function PhaseTrip(dss::DSSContext, Value::Float64)
    @checked Lib.Reclosers_Set_PhaseTrip(dss.ctx, Value)
end
PhaseTrip(Value::Float64) = PhaseTrip(DSS_DEFAULT_CTX, Value)

"""
Array of Doubles: reclose intervals, s, between shots.

Original COM help: https://opendss.epri.com/RecloseIntervals.html
"""
function RecloseIntervals(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Reclosers_Get_RecloseIntervals, dss.ctx)
end
RecloseIntervals() = RecloseIntervals(DSS_DEFAULT_CTX)

"""
Number of shots to lockout (fast + delayed)

Original COM help: https://opendss.epri.com/Shots.html

(Getter)
"""
function Shots(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_Shots(dss.ctx)
end
Shots() = Shots(DSS_DEFAULT_CTX)

"""
Number of shots to lockout (fast + delayed)

Original COM help: https://opendss.epri.com/Shots.html

(Setter)
"""
function Shots(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_Shots(dss.ctx, Value)
end
Shots(Value::Int) = Shots(DSS_DEFAULT_CTX, Value)

"""
Full name of the circuit element that is being switched by the Recloser.

Original COM help: https://opendss.epri.com/SwitchedObj1.html

(Getter)
"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked Lib.Reclosers_Get_SwitchedObj(dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""
Full name of the circuit element that is being switched by the Recloser.

Original COM help: https://opendss.epri.com/SwitchedObj1.html

(Setter)
"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked Lib.Reclosers_Set_SwitchedObj(dss.ctx, Value)
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""
Terminal number of the controlled device being switched by the Recloser

Original COM help: https://opendss.epri.com/SwitchedTerm1.html

(Getter)
"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked Lib.Reclosers_Get_SwitchedTerm(dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""
Terminal number of the controlled device being switched by the Recloser

Original COM help: https://opendss.epri.com/SwitchedTerm1.html

(Setter)
"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked Lib.Reclosers_Set_SwitchedTerm(dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

"""
Present state of recloser.
If set to open (ActionCodes.Open=1), open recloser's controlled element and lock out the recloser.
If set to close (ActionCodes.Close=2), close recloser's controlled element and resets recloser to first operation.

(Getter)
"""
function State(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.Reclosers_Get_State(dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""
Present state of recloser.
If set to open (ActionCodes.Open=1), open recloser's controlled element and lock out the recloser.
If set to close (ActionCodes.Close=2), close recloser's controlled element and resets recloser to first operation.

(Setter)
"""
function State(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Reclosers_Set_State(dss.ctx, Value)
end
State(Value::Union{Int,Lib.ActionCodes}) = State(DSS_DEFAULT_CTX, Value)

"""
Normal state (ActionCodes.Open=1, ActionCodes.Close=2) of the recloser.

Original COM help: https://opendss.epri.com/NormalState1.html

(Getter)
"""
function NormalState(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.Reclosers_Get_NormalState(dss.ctx)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""
Normal state (ActionCodes.Open=1, ActionCodes.Close=2) of the recloser.

Original COM help: https://opendss.epri.com/NormalState1.html

(Setter)
"""
function NormalState(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Reclosers_Set_NormalState(dss.ctx, Value)
end
NormalState(Value::Union{Int,Lib.ActionCodes}) = NormalState(DSS_DEFAULT_CTX, Value)

"""
Reset recloser to normal state.
If open, lock out the recloser.
If closed, resets recloser to first operation.
"""
function Reset(dss::DSSContext)
    @checked Lib.Reclosers_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

end
