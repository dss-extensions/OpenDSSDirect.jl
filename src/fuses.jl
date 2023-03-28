module Fuses

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Reset fuse"""
function Close(dss::DSSContext)
    @checked Lib.Fuses_Close(dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""Check if the fuse is blown for any phase"""
function IsBlown(dss::DSSContext)::Bool
    return @checked(Lib.Fuses_IsBlown(dss.ctx)) != 0
end
IsBlown() = IsBlown(DSS_DEFAULT_CTX)

"""Open all phases"""
function Open(dss::DSSContext)
    @checked Lib.Fuses_Open(dss.ctx)
end
Open() = Open(DSS_DEFAULT_CTX)

"""Array of strings containing names of all Fuses in the circuit"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Fuses_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of Fuse elements in the circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Getter)
"""
function Delay(dss::DSSContext)::Float64
    return @checked Lib.Fuses_Get_Delay(dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)


"""
A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Setter)
"""
function Delay(dss::DSSContext, Value::Float64)
    @checked Lib.Fuses_Set_Delay(dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""Set the first Fuse to be the active fuse. Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Full name of the circuit element to which the fuse is connected."""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked Lib.Fuses_Get_MonitoredObj(dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""Full name of the circuit element to which the fuse is connected."""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked Lib.Fuses_Set_MonitoredObj(dss.ctx, Cstring(pointer(Value)))
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""Terminal number to which the fuse is connected. (Getter)"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_MonitoredTerm(dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""Terminal number to which the fuse is connected. (Setter)"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked Lib.Fuses_Set_MonitoredTerm(dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""Name of the active Fuse element (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Fuses_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Name of the active Fuse element (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Fuses_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Number of phases, this fuse. """
function NumPhases(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_NumPhases(dss.ctx)
end
NumPhases() = NumPhases(DSS_DEFAULT_CTX)

"""
Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Getter)
"""
function RatedCurrent(dss::DSSContext)::Float64
    return @checked Lib.Fuses_Get_RatedCurrent(dss.ctx)
end
RatedCurrent() = RatedCurrent(DSS_DEFAULT_CTX)

"""
Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Setter)
"""
function RatedCurrent(dss::DSSContext, Value::Float64)
    @checked Lib.Fuses_Set_RatedCurrent(dss.ctx, Value)
end
RatedCurrent(Value::Float64) = RatedCurrent(DSS_DEFAULT_CTX, Value)

"""Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Getter)"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked Lib.Fuses_Get_SwitchedObj(dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Setter)"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked Lib.Fuses_Set_SwitchedObj(dss.ctx, Cstring(pointer(Value)))
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""Number of the terminal of the controlled element containing the switch controlled by the fuse. (Getter)"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_SwitchedTerm(dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""Number of the terminal of the controlled element containing the switch controlled by the fuse. (Setter)"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked Lib.Fuses_Set_SwitchedTerm(dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

"""Name of the TCCcurve object that determines fuse blowing. (Getter)"""
function TCCCurve(dss::DSSContext)::String
    return get_string(@checked Lib.Fuses_Get_TCCcurve(dss.ctx))
end
TCCCurve() = TCCCurve(DSS_DEFAULT_CTX)

"""Name of the TCCcurve object that determines fuse blowing. (Setter)"""
function TCCCurve(dss::DSSContext, Value::String)
    @checked Lib.Fuses_Set_TCCcurve(dss.ctx, Cstring(pointer(Value)))
end
TCCCurve(Value::String) = TCCCurve(DSS_DEFAULT_CTX, Value)

"""
Active fuse by index into the list of fuses. 1 indexed based. 1..count (Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Fuses_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Active fuse by index into the list of fuses. 1 indexed based. 1..count (Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Fuses_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Array of strings ('open' or 'closed') indicating the normal state of each phase of the fuse. 
(Getter)"""
function NormalState(dss::DSSContext)::Array{String}
    return get_string_array(Lib.Fuses_Get_NormalState, dss.ctx)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""Array of strings ('open' or 'closed') indicating the normal state of each phase of the fuse.
(Setter)"""
function NormalState(dss::DSSContext, Value::Array{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.Fuses_Set_NormalState(dss.ctx, ValuePtr, ValueCount)
end
NormalState(Value::Array{String}) = NormalState(DSS_DEFAULT_CTX, Value)

"""Array of strings ('open' or 'closed') indicating the state of each phase of the fuse.
(Getter)"""
function State(dss::DSSContext)::Array{String}
    return get_string_array(Lib.Fuses_Get_State, dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""Array of strings ('open' or 'closed') indicating the state of each phase of the fuse.
(Setter)"""
function State(dss::DSSContext, Value::Array{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.Fuses_Set_State(dss.ctx, ValuePtr, ValueCount)
end
State(Value::Array{String}) = State(DSS_DEFAULT_CTX, Value)

"""Reset fuse to normal state."""
function Reset(dss::DSSContext)
    @checked Lib.Fuses_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

end
