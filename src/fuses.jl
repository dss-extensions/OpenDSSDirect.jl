module Fuses

using ..lib
using ..utils

function Close()
    lib.Fuses_Close()
end

function IsBlown()::Bool
    return lib.Fuses_IsBlown() != 0
end

function Open()
    lib.Fuses_Open()
end

"""(read-only) Array of strings containing names of all Fuses in the circuit"""
function AllNames()
    return get_string_array(lib.Fuses_Get_AllNames)
end

"""(read-only) Number of Fuse elements in the circuit"""
function Count()
    return lib.Fuses_Get_Count()
end

"""
(read) A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.
(write) Fixed delay time in seconds added to the fuse blowing time to represent fuse clear or other delay.
"""
function Delay()
    return lib.Fuses_Get_Delay()
end


"""
(read) A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0.
(write) Fixed delay time in seconds added to the fuse blowing time to represent fuse clear or other delay.
"""
function Delay(Value)
    lib.Fuses_Set_Delay(Value)
end

"""(read-only) Set the first Fuse to be the active fuse. Returns 0 if none."""
function First()
    return lib.Fuses_Get_First()
end

"""Full name of the circuit element to which the fuse is connected."""
function MonitoredObj()
    return get_string(lib.Fuses_Get_MonitoredObj())
end

"""Full name of the circuit element to which the fuse is connected."""
function MonitoredObj(Value::String)
    lib.Fuses_Set_MonitoredObj(Cstring(pointer(Value)))
end

"""
(read) Terminal number to which the fuse is connected.
(write) Number of the terminal to which the fuse is connected
"""
function MonitoredTerm()
    return lib.Fuses_Get_MonitoredTerm()
end

"""
(read) Terminal number to which the fuse is connected.
(write) Number of the terminal to which the fuse is connected
"""
function MonitoredTerm(Value)
    lib.Fuses_Set_MonitoredTerm(Value)
end

"""
(read) Get the name of the active Fuse element
(write) Set the active Fuse element by name.
"""
function Name()
    return get_string(lib.Fuses_Get_Name())
end

"""
(read) Get the name of the active Fuse element
(write) Set the active Fuse element by name.
"""
function Name(Value)
    lib.Fuses_Set_Name(Cstring(pointer(Value)))
end

"""(read-only) Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses."""
function Next()
    return lib.Fuses_Get_Next()
end

"""(read-only) Number of phases, this fuse. """
function NumPhases()
    return lib.Fuses_Get_NumPhases()
end

"""
(read) Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps.
(write) Multiplier or actual fuse amps for the TCC curve. Defaults to 1.0. Has to correspond to the Current axis of TCCcurve object.
"""
function RatedCurrent()
    return lib.Fuses_Get_RatedCurrent()
end

"""
(read) Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps.
(write) Multiplier or actual fuse amps for the TCC curve. Defaults to 1.0. Has to correspond to the Current axis of TCCcurve object.
"""
function RatedCurrent(Value)
    lib.Fuses_Set_RatedCurrent(Value)
end

"""
(read) Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.
(write) Full name of the circuit element switch that the fuse controls. Defaults to MonitoredObj.
"""
function SwitchedObj()
    return get_string(lib.Fuses_Get_SwitchedObj())
end

"""
(read) Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj.
(write) Full name of the circuit element switch that the fuse controls. Defaults to MonitoredObj.
"""
function SwitchedObj(Value)
    lib.Fuses_Set_SwitchedObj(Cstring(pointer(Value)))
end

"""
(read) Number of the terminal containing the switch controlled by the fuse.
(write) Number of the terminal of the controlled element containing the switch controlled by the fuse.
"""
function SwitchedTerm()
    return lib.Fuses_Get_SwitchedTerm()
end

"""
(read) Number of the terminal containing the switch controlled by the fuse.
(write) Number of the terminal of the controlled element containing the switch controlled by the fuse.
"""
function SwitchedTerm(Value)
    lib.Fuses_Set_SwitchedTerm(Value)
end

"""Name of the TCCcurve object that determines fuse blowing."""
function TCCCurve()
    return get_string(lib.Fuses_Get_TCCcurve())
end

"""Name of the TCCcurve object that determines fuse blowing."""
function TCCCurve(Value)
    lib.Fuses_Set_TCCcurve(Cstring(pointer(Value)))
end

"""
(read) Get/set active fuse by index into the list of fuses. 1 based: 1..count
(write) Set Fuse active by index into the list of fuses. 1..count
"""
function Idx()
    return lib.Fuses_Get_idx()
end

"""
(read) Get/set active fuse by index into the list of fuses. 1 based: 1..count
(write) Set Fuse active by index into the list of fuses. 1..count
"""
function Idx(Value)
    lib.Fuses_Set_idx(Value)

end

end

