module Fuses

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Reset fuse"""
function Close()
    @checked Lib.Fuses_Close()
end

"""Check if the fuse is blown for any phase"""
function IsBlown()::Bool
    return @checked(Lib.Fuses_IsBlown()) != 0
end

"""Open all phases"""
function Open()
    @checked Lib.Fuses_Open()
end

"""Array of strings containing names of all Fuses in the circuit"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Fuses_Get_AllNames)
end

"""Number of Fuse elements in the circuit"""
function Count()::Int
    return @checked Lib.Fuses_Get_Count()
end

"""
A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Getter)
"""
function Delay()::Float64
    return @checked Lib.Fuses_Get_Delay()
end


"""
A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Setter)
"""
function Delay(Value::Float64)
    @checked Lib.Fuses_Set_Delay(Value)
end

"""Set the first Fuse to be the active fuse. Returns 0 if none."""
function First()::Int
    return @checked Lib.Fuses_Get_First()
end

"""Full name of the circuit element to which the fuse is connected."""
function MonitoredObj()::String
    return get_string(@checked Lib.Fuses_Get_MonitoredObj())
end

"""Full name of the circuit element to which the fuse is connected."""
function MonitoredObj(Value::String)
    @checked Lib.Fuses_Set_MonitoredObj(Cstring(pointer(Value)))
end

"""Terminal number to which the fuse is connected. (Getter)"""
function MonitoredTerm()::Int
    return @checked Lib.Fuses_Get_MonitoredTerm()
end

"""Terminal number to which the fuse is connected. (Setter)"""
function MonitoredTerm(Value::Int)
    @checked Lib.Fuses_Set_MonitoredTerm(Value)
end

"""Name of the active Fuse element (Getter)"""
function Name()::String
    return get_string(@checked Lib.Fuses_Get_Name())
end

"""Name of the active Fuse element (Setter)"""
function Name(Value::String)
    @checked Lib.Fuses_Set_Name(Cstring(pointer(Value)))
end

"""Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses."""
function Next()::Int
    return @checked Lib.Fuses_Get_Next()
end

"""Number of phases, this fuse. """
function NumPhases()::Int
    return @checked Lib.Fuses_Get_NumPhases()
end

"""
Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Getter)
"""
function RatedCurrent()::Float64
    return @checked Lib.Fuses_Get_RatedCurrent()
end

"""
Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Setter)
"""
function RatedCurrent(Value::Float64)
    @checked Lib.Fuses_Set_RatedCurrent(Value)
end

"""Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Getter)"""
function SwitchedObj()::String
    return get_string(@checked Lib.Fuses_Get_SwitchedObj())
end

"""Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Setter)"""
function SwitchedObj(Value::String)
    @checked Lib.Fuses_Set_SwitchedObj(Cstring(pointer(Value)))
end

"""Number of the terminal of the controlled element containing the switch controlled by the fuse. (Getter)"""
function SwitchedTerm()::Int
    return @checked Lib.Fuses_Get_SwitchedTerm()
end

"""Number of the terminal of the controlled element containing the switch controlled by the fuse. (Setter)"""
function SwitchedTerm(Value::Int)
    @checked Lib.Fuses_Set_SwitchedTerm(Value)
end

"""Name of the TCCcurve object that determines fuse blowing. (Getter)"""
function TCCCurve()::String
    return get_string(@checked Lib.Fuses_Get_TCCcurve())
end

"""Name of the TCCcurve object that determines fuse blowing. (Setter)"""
function TCCCurve(Value::String)
    @checked Lib.Fuses_Set_TCCcurve(Cstring(pointer(Value)))
end

"""
Active fuse by index into the list of fuses. 1 indexed based. 1..count (Getter)
"""
function Idx()::Int
    return @checked Lib.Fuses_Get_idx()
end

"""
Active fuse by index into the list of fuses. 1 indexed based. 1..count (Setter)
"""
function Idx(Value::Int)
    @checked Lib.Fuses_Set_idx(Value)
end

"""Array of strings ('open' or 'closed') indicating the normal state of each phase of the fuse. 
(Getter)"""
function NormalState()::Array{String}
    return get_string_array(Lib.Fuses_Get_NormalState)
end

"""Array of strings ('open' or 'closed') indicating the normal state of each phase of the fuse.
(Setter)"""
function NormalState(Value::Array{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.Fuses_Set_NormalState(ValuePtr, ValueCount)
end

"""Array of strings ('open' or 'closed') indicating the state of each phase of the fuse.
(Getter)"""
function State()::Array{String}
    return get_string_array(Lib.Fuses_Get_State)
end

"""Array of strings ('open' or 'closed') indicating the state of each phase of the fuse.
(Setter)"""
function State(Value::Array{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.Fuses_Set_State(ValuePtr, ValueCount)
end

"""Reset fuse to normal state."""
function Reset()
    @checked Lib.Fuses_Reset()
end

end
