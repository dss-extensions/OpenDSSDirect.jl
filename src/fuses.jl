module Fuses

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Fuse objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Fuses_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Fuse object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Fuses_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Fuse object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Fuses_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Fuse Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Fuse to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Fuse to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Fuse (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Fuse by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Fuses_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Close all phases of the fuse.

Original COM help: https://opendss.epri.com/Close3.html
"""
function Close(dss::DSSContext)
    @checked dss_ccall(dss.capi.Fuses_Close, dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""
Current state of the fuses. TRUE if any fuse on any phase is blown. Else FALSE.

Original COM help: https://opendss.epri.com/IsBlown.html
"""
function IsBlown(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Fuses_IsBlown, dss.ctx)) != 0
end
IsBlown() = IsBlown(DSS_DEFAULT_CTX)

"""
Manual opening of all phases of the fuse.

Original COM help: https://opendss.epri.com/Open2.html
"""
function Open(dss::DSSContext)
    @checked dss_ccall(dss.capi.Fuses_Open, dss.ctx)
end
Open() = Open(DSS_DEFAULT_CTX)

"""
A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.
This represents a fuse clear or other delay.

Original COM help: https://opendss.epri.com/Delay1.html

(Getter)
"""
function Delay(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Fuses_Get_Delay, dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)

"""
A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.
This represents a fuse clear or other delay.

Original COM help: https://opendss.epri.com/Delay1.html

(Setter)
"""
function Delay(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Fuses_Set_Delay, dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""
Full name of the circuit element to which the fuse is connected.

Original COM help: https://opendss.epri.com/MonitoredObj1.html

(Getter)
"""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Fuses_Get_MonitoredObj, dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""
Full name of the circuit element to which the fuse is connected.

Original COM help: https://opendss.epri.com/MonitoredObj1.html

(Setter)
"""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Fuses_Set_MonitoredObj, dss.ctx, Value)
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""
Terminal number to which the fuse is connected.

Original COM help: https://opendss.epri.com/MonitoredTerm1.html

(Getter)
"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_MonitoredTerm, dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""
Terminal number to which the fuse is connected.

Original COM help: https://opendss.epri.com/MonitoredTerm1.html

(Setter)
"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Fuses_Set_MonitoredTerm, dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""
Number of phases, this fuse.

Original COM help: https://opendss.epri.com/NumPhases1.html
"""
function NumPhases(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_NumPhases, dss.ctx)
end
NumPhases() = NumPhases(DSS_DEFAULT_CTX)

"""
Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.

Multiply current values of TCC curve by this to get actual amps.

Original COM help: https://opendss.epri.com/RatedCurrent.html

(Getter)
"""
function RatedCurrent(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Fuses_Get_RatedCurrent, dss.ctx)
end
RatedCurrent() = RatedCurrent(DSS_DEFAULT_CTX)

"""
Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.

Multiply current values of TCC curve by this to get actual amps.

Original COM help: https://opendss.epri.com/RatedCurrent.html

(Setter)
"""
function RatedCurrent(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Fuses_Set_RatedCurrent, dss.ctx, Value)
end
RatedCurrent(Value::Float64) = RatedCurrent(DSS_DEFAULT_CTX, Value)

"""
Full name of the circuit element switch that the fuse controls.
Defaults to the MonitoredObj.

Original COM help: https://opendss.epri.com/SwitchedObj.html

(Getter)
"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Fuses_Get_SwitchedObj, dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""
Full name of the circuit element switch that the fuse controls.
Defaults to the MonitoredObj.

Original COM help: https://opendss.epri.com/SwitchedObj.html

(Setter)
"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Fuses_Set_SwitchedObj, dss.ctx, Value)
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""
Number of the terminal of the controlled element containing the switch controlled by the fuse.

Original COM help: https://opendss.epri.com/SwitchedTerm.html

(Getter)
"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Fuses_Get_SwitchedTerm, dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""
Number of the terminal of the controlled element containing the switch controlled by the fuse.

Original COM help: https://opendss.epri.com/SwitchedTerm.html

(Setter)
"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Fuses_Set_SwitchedTerm, dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

"""
Name of the TCCcurve object that determines fuse blowing.

Original COM help: https://opendss.epri.com/TCCcurve.html

(Getter)
"""
function TCCCurve(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Fuses_Get_TCCcurve, dss.ctx))
end
TCCCurve() = TCCCurve(DSS_DEFAULT_CTX)

"""
Name of the TCCcurve object that determines fuse blowing.

Original COM help: https://opendss.epri.com/TCCcurve.html

(Setter)
"""
function TCCCurve(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Fuses_Set_TCCcurve, dss.ctx, Value)
end
TCCCurve(Value::String) = TCCCurve(DSS_DEFAULT_CTX, Value)

"""
Array of strings indicating the normal state of each phase of the fuse.

Original COM help: https://opendss.epri.com/NormalState2.html

(Getter)
"""
function NormalState(dss::DSSContext)::Array{String}
    return get_string_array(dss.capi.Fuses_Get_NormalState, dss)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""
Array of strings indicating the normal state of each phase of the fuse.

Original COM help: https://opendss.epri.com/NormalState2.html

(Setter)
"""
function NormalState(dss::DSSContext, Value::Array{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked dss_ccall(dss.capi.Fuses_Set_NormalState, dss.ctx, ValuePtr, ValueCount)
end
NormalState(Value::Array{String}) = NormalState(DSS_DEFAULT_CTX, Value)

"""
Array of strings indicating the state of each phase of the fuse.

Original COM help: https://opendss.epri.com/State2.html

(Getter)
"""
function State(dss::DSSContext)::Array{String}
    return get_string_array(dss.capi.Fuses_Get_State, dss)
end
State() = State(DSS_DEFAULT_CTX)

"""
Array of strings indicating the state of each phase of the fuse.

Original COM help: https://opendss.epri.com/State2.html

(Setter)
"""
function State(dss::DSSContext, Value::Array{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked dss_ccall(dss.capi.Fuses_Set_State, dss.ctx, ValuePtr, ValueCount)
end
State(Value::Array{String}) = State(DSS_DEFAULT_CTX, Value)

"""
Reset fuse to normal state.

Original COM help: https://opendss.epri.com/Reset7.html
"""
function Reset(dss::DSSContext)
    @checked dss_ccall(dss.capi.Fuses_Reset, dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

end
