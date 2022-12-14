module Relays

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings containing names of all Relay elements"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Relays_Get_AllNames, C_NULL_CTX)
end

"""Number of Relays in circuit"""
function Count()::Int
    return @checked Lib.Relays_Get_Count(C_NULL_CTX)
end

"""Set First Relay active. If none, returns 0."""
function First()::Int
    return @checked Lib.Relays_Get_First(C_NULL_CTX)
end

"""Full name of object this Relay is monitoring. (Getter)"""
function MonitoredObj()::String
    return get_string(@checked Lib.Relays_Get_MonitoredObj(C_NULL_CTX))
end

"""Full name of object this Relay is monitoring. (Setter)"""
function MonitoredObj(Value::String)
    @checked Lib.Relays_Set_MonitoredObj(C_NULL_CTX, Value)
end

"""Number of terminal of monitored element that this Relay is monitoring. (Getter)"""
function MonitoredTerm()::Int
    return @checked Lib.Relays_Get_MonitoredTerm(C_NULL_CTX)
end

"""Number of terminal of monitored element that this Relay is monitoring. (Setter)"""
function MonitoredTerm(Value::Int)
    @checked Lib.Relays_Set_MonitoredTerm(C_NULL_CTX, Value)
end

"""Name of active relay. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Relays_Get_Name(C_NULL_CTX))
end

"""Name of active relay. (Setter)"""
function Name(Value::String)
    @checked Lib.Relays_Set_Name(C_NULL_CTX, Value)
end

"""Advance to next Relay object. Returns 0 when no more relays."""
function Next()::Int
    return @checked Lib.Relays_Get_Next(C_NULL_CTX)
end

"""Full name of element that will be switched when relay trips. (Getter)"""
function SwitchedObj()::String
    return get_string(@checked Lib.Relays_Get_SwitchedObj(C_NULL_CTX))
end

"""Full name of element that will be switched when relay trips. (Setter)"""
function SwitchedObj(Value::String)
    @checked Lib.Relays_Set_SwitchedObj(C_NULL_CTX, Value)
end

"""Terminal number of the switched object that will be opened when the relay trips. (Getter)"""
function SwitchedTerm()::Int
    return @checked Lib.Relays_Get_SwitchedTerm(C_NULL_CTX)
end

"""Terminal number of the switched object that will be opened when the relay trips. (Setter)"""
function SwitchedTerm(Value::Int)
    @checked Lib.Relays_Set_SwitchedTerm(C_NULL_CTX, Value)
end

"""Active Relay by index into the Relay list. 1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.Relays_Get_idx(C_NULL_CTX)
end

"""Active Relay by index into the Relay list. 1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.Relays_Set_idx(C_NULL_CTX, Value)
end

"""Get/Set present state of relay. (Getter)
If set to open (ActionCodes.Open = 1), open relay's controlled element and lock out the relay. 
If set to close (ActionCodes.Close = 2), close relay's controlled element and resets relay to first operation."""
function State()::Lib.ActionCodes
    return @checked Lib.Relays_Get_State(C_NULL_CTX)
end

"""Get/Set present state of relay. (Setter)
If set to open (ActionCodes.Open = 1), open relay's controlled element and lock out the relay. 
If set to close (ActionCodes.Close = 2), close relay's controlled element and resets relay to first operation."""
function State(Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Relays_Set_State(C_NULL_CTX, Value)
end

"""Get/set normal state of relay. (Getter)"""
function NormalState()::Lib.ActionCodes
    return @checked Lib.Relays_Get_NormalState(C_NULL_CTX)
end

"""Get/set normal state of relay. (Setter)"""
function NormalState(Value::Union{Int,Lib.ActionCodes})
    return @checked Lib.Relays_Set_NormalState(C_NULL_CTX, Value)
end

"""Open relay's controlled element and lock out the relay."""
function Open()
    @checked Lib.Relays_Open(C_NULL_CTX)
end

"""Reset relay to normal state. If open, lock out the relay. If closed, resets relay to first operation."""
function Reset()
    @checked Lib.Relays_Reset(C_NULL_CTX)
end

"""Close the switched object controlled by the relay. Resets relay to first operation."""
function Close()
    @checked Lib.Relays_Close(C_NULL_CTX)
end

end
