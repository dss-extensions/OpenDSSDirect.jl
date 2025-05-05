module Relays

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Relay objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Relays_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Relay object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Relays_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Relay object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Relays_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Relay Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Relays_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Relay to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Relays_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Relay to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Relays_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Relay (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Relays_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Relay by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Relays_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Full name of object this Relay is monitoring.

Original COM help: https://opendss.epri.com/MonitoredObj3.html

(Getter)
"""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked Lib.Relays_Get_MonitoredObj(dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""
Full name of object this Relay is monitoring.

Original COM help: https://opendss.epri.com/MonitoredObj3.html

(Setter)
"""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked Lib.Relays_Set_MonitoredObj(dss.ctx, Value)
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""
Number of terminal of monitored element that this Relay is monitoring.

Original COM help: https://opendss.epri.com/MonitoredTerm3.html

(Getter)
"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked Lib.Relays_Get_MonitoredTerm(dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""
Number of terminal of monitored element that this Relay is monitoring.

Original COM help: https://opendss.epri.com/MonitoredTerm3.html

(Setter)
"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked Lib.Relays_Set_MonitoredTerm(dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""
Full name of element that will be switched when relay trips.

Original COM help: https://opendss.epri.com/SwitchedObj2.html

(Getter)
"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked Lib.Relays_Get_SwitchedObj(dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""
Full name of element that will be switched when relay trips.

Original COM help: https://opendss.epri.com/SwitchedObj2.html

(Setter)
"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked Lib.Relays_Set_SwitchedObj(dss.ctx, Value)
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""
Terminal number of the switched object that will be opened when the relay trips.

Original COM help: https://opendss.epri.com/SwitchedTerm2.html

(Getter)
"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked Lib.Relays_Get_SwitchedTerm(dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""
Terminal number of the switched object that will be opened when the relay trips.

Original COM help: https://opendss.epri.com/SwitchedTerm2.html

(Setter)
"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked Lib.Relays_Set_SwitchedTerm(dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

"""
Present state of relay.
If set to open (ActionCodes.Open = 1), open relay's controlled element and lock out the relay. 
If set to close (ActionCodes.Close = 2), close relay's controlled element and resets relay to first operation.

(Getter)
"""
function State(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.Relays_Get_State(dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""
Present state of relay.
If set to open (ActionCodes.Open = 1), open relay's controlled element and lock out the relay. 
If set to close (ActionCodes.Close = 2), close relay's controlled element and resets relay to first operation.

(Setter)
"""
function State(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Relays_Set_State(dss.ctx, Value)
end
State(Value::Union{Int,Lib.ActionCodes}) = State(DSS_DEFAULT_CTX, Value)

"""
Normal state of relay.

Original COM help: https://opendss.epri.com/NormalState3.html

(Getter)
"""
function NormalState(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.Relays_Get_NormalState(dss.ctx)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""
Normal state of relay.

Original COM help: https://opendss.epri.com/NormalState3.html

(Setter)
"""
function NormalState(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Relays_Set_NormalState(dss.ctx, Value)
end
NormalState(Value::Union{Int,Lib.ActionCodes}) = NormalState(DSS_DEFAULT_CTX, Value)

"""
Open relay's controlled element and lock out the relay.

Original COM help: https://opendss.epri.com/Open4.html
"""
function Open(dss::DSSContext)
    @checked Lib.Relays_Open(dss.ctx)
end
Open() = Open(DSS_DEFAULT_CTX)

"""
Reset relay to normal state.
If open, lock out the relay.
If closed, resets relay to first operation.
"""
function Reset(dss::DSSContext)
    @checked Lib.Relays_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""
Close the switched object controlled by the relay. Resets relay to first operation.

Original COM help: https://opendss.epri.com/Close5.html
"""
function Close(dss::DSSContext)
    @checked Lib.Relays_Close(dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

end
