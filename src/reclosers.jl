module Reclosers

    using ..lib
    using ..utils

    function Close()
        lib.Reclosers_Close()
    end

    function Open()
        lib.Reclosers_Open()
    end

    """(read-only) Array of strings with names of all Reclosers in Active Circuit"""
    function AllNames()::Vector{String}
        return get_string_array(lib.Reclosers_Get_AllNames)
    end

    """(read-only) Number of Reclosers in active circuit."""
    function Count()::Int
        return lib.Reclosers_Get_Count()
    end

    """(read-only) Set First Recloser to be Active Ckt Element. Returns 0 if none."""
    function First()::Int
        return lib.Reclosers_Get_First()
    end

    """
    (read) Ground (3I0) instantaneous trip setting - curve multipler or actual amps.
    (write) Ground (3I0) trip instantaneous multiplier or actual amps
    """
    function GroundInst()::Float64
        return lib.Reclosers_Get_GroundInst()
    end

    """
    (read) Ground (3I0) instantaneous trip setting - curve multipler or actual amps.
    (write) Ground (3I0) trip instantaneous multiplier or actual amps
    """
    function GroundInst(Value::Float64)
        lib.Reclosers_Set_GroundInst(Value)
    end

    """Ground (3I0) trip multiplier or actual amps"""
    function GroundTrip()::Float64
        return lib.Reclosers_Get_GroundTrip()
    end

    """Ground (3I0) trip multiplier or actual amps"""
    function GroundTrip(Value::Float64)
        lib.Reclosers_Set_GroundTrip(Value)
    end

    """
    (read) Full name of object this Recloser is monitoring.
    (write) Set monitored object by full name.
    """
    function MonitoredObj()::String
        return get_string(lib.Reclosers_Get_MonitoredObj())
    end

    """
    (read) Full name of object this Recloser is monitoring.
    (write) Set monitored object by full name.
    """
    function MonitoredObj(Value::String)
        lib.Reclosers_Set_MonitoredObj(Value)
    end

    """Terminal number of Monitored object for the Recloser """
    function MonitoredTerm()::Int
        return lib.Reclosers_Get_MonitoredTerm()
    end

    """Terminal number of Monitored object for the Recloser """
    function MonitoredTerm(Value::Int)
        lib.Reclosers_Set_MonitoredTerm(Value)
    end

    """Get Name of active Recloser or set the active Recloser by name."""
    function Name()::String
        return get_string(lib.Reclosers_Get_Name())
    end

    """Get Name of active Recloser or set the active Recloser by name."""
    function Name(Value::String)
        lib.Reclosers_Set_Name(Value)
    end

    """(read-only) Iterate to the next recloser in the circuit. Returns zero if no more."""
    function Next()::Int
        return lib.Reclosers_Get_Next()
    end

    """Number of fast shots"""
    function NumFast()::Int
        return lib.Reclosers_Get_NumFast()
    end

    """Number of fast shots"""
    function NumFast(Value::Int)
        lib.Reclosers_Set_NumFast(Value)
    end

    """Phase instantaneous curve multipler or actual amps"""
    function PhaseInst()::Float64
        return lib.Reclosers_Get_PhaseInst()
    end

    """Phase instantaneous curve multipler or actual amps"""
    function PhaseInst(Value::Float64)
        lib.Reclosers_Set_PhaseInst(Value)
    end

    """
    (read) Phase trip curve multiplier or actual amps
    (write) Phase Trip multiplier or actual amps
    """
    function PhaseTrip()::Float64
        return lib.Reclosers_Get_PhaseTrip()
    end

    """
    (read) Phase trip curve multiplier or actual amps
    (write) Phase Trip multiplier or actual amps
    """
    function PhaseTrip(Value::Float64)
        lib.Reclosers_Set_PhaseTrip(Value)
    end

    """(read-only) Variant Array of Doubles: reclose intervals, s, between shots."""
    function RecloseIntervals()
        return get_float64_array(lib.Reclosers_Get_RecloseIntervals)
    end

    """Number of shots to lockout (fast + delayed)"""
    function Shots()::Int
        return lib.Reclosers_Get_Shots()
    end

    """Number of shots to lockout (fast + delayed)"""
    function Shots(Value::Int)
        lib.Reclosers_Set_Shots(Value)
    end

    """Full name of the circuit element that is being switched by the Recloser."""
    function SwitchedObj()::String
        return get_string(lib.Reclosers_Get_SwitchedObj())
    end

    """Full name of the circuit element that is being switched by the Recloser."""
    function SwitchedObj(Value::String)
        lib.Reclosers_Set_SwitchedObj(Value)
    end

    """Terminal number of the controlled device being switched by the Recloser"""
    function SwitchedTerm()::Int
        return lib.Reclosers_Get_SwitchedTerm()
    end

    """Terminal number of the controlled device being switched by the Recloser"""
    function SwitchedTerm(Value::Int)
        lib.Reclosers_Set_SwitchedTerm(Value)
    end

    """Get/Set the active Recloser by index into the recloser list.  1..Count"""
    function Idx()::Int
        return lib.Reclosers_Get_idx()
    end

    """Get/Set the active Recloser by index into the recloser list.  1..Count"""
    function Idx(Value::Int)
        lib.Reclosers_Set_idx(Value)
    end

end

