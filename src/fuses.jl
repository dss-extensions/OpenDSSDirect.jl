module Fuses

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Reset fuse"""
    function Close()
        Lib.Fuses_Close()
    end

    """Check if the fuse is blown for any phase"""
    function IsBlown()::Bool
        return Lib.Fuses_IsBlown() != 0
    end

    """Open all phases"""
    function Open()
        Lib.Fuses_Open()
    end

    """Array of strings containing names of all Fuses in the circuit"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.Fuses_Get_AllNames)
    end

    """Number of Fuse elements in the circuit"""
    function Count()::Int
        return Lib.Fuses_Get_Count()
    end

    """
    A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Getter)
    """
    function Delay()::Float64
        return Lib.Fuses_Get_Delay()
    end


    """
    A fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Setter)
    """
    function Delay(Value::Float64)
        Lib.Fuses_Set_Delay(Value)
    end

    """Set the first Fuse to be the active fuse. Returns 0 if none."""
    function First()::Int
        return Lib.Fuses_Get_First()
    end

    """Full name of the circuit element to which the fuse is connected."""
    function MonitoredObj()::String
        return Utils.get_string(Lib.Fuses_Get_MonitoredObj())
    end

    """Full name of the circuit element to which the fuse is connected."""
    function MonitoredObj(Value::String)
        Lib.Fuses_Set_MonitoredObj(Cstring(pointer(Value)))
    end

    """Terminal number to which the fuse is connected. (Getter)"""
    function MonitoredTerm()::Int
        return Lib.Fuses_Get_MonitoredTerm()
    end

    """Terminal number to which the fuse is connected. (Setter)"""
    function MonitoredTerm(Value::Int)
        Lib.Fuses_Set_MonitoredTerm(Value)
    end

    """Name of the active Fuse element (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.Fuses_Get_Name())
    end

    """Name of the active Fuse element (Setter)"""
    function Name(Value::String)
        Lib.Fuses_Set_Name(Cstring(pointer(Value)))
    end

    """Advance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses."""
    function Next()::Int
        return Lib.Fuses_Get_Next()
    end

    """Number of phases, this fuse. """
    function NumPhases()::Int
        return Lib.Fuses_Get_NumPhases()
    end

    """
    Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Getter)
    """
    function RatedCurrent()::Float64
        return Lib.Fuses_Get_RatedCurrent()
    end

    """
    Multiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Setter)
    """
    function RatedCurrent(Value::Float64)
        Lib.Fuses_Set_RatedCurrent(Value)
    end

    """Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Getter)"""
    function SwitchedObj()::String
        return Utils.get_string(Lib.Fuses_Get_SwitchedObj())
    end

    """Full name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Setter)"""
    function SwitchedObj(Value::String)
        Lib.Fuses_Set_SwitchedObj(Cstring(pointer(Value)))
    end

    """Number of the terminal of the controlled element containing the switch controlled by the fuse. (Getter)"""
    function SwitchedTerm()::Int
        return Lib.Fuses_Get_SwitchedTerm()
    end

    """Number of the terminal of the controlled element containing the switch controlled by the fuse. (Setter)"""
    function SwitchedTerm(Value::Int)
        Lib.Fuses_Set_SwitchedTerm(Value)
    end

    """Name of the TCCcurve object that determines fuse blowing. (Getter)"""
    function TCCCurve()::String
        return Utils.get_string(Lib.Fuses_Get_TCCcurve())
    end

    """Name of the TCCcurve object that determines fuse blowing. (Setter)"""
    function TCCCurve(Value::String)
        Lib.Fuses_Set_TCCcurve(Cstring(pointer(Value)))
    end

    """
    Active fuse by index into the list of fuses. 1 indexed based. 1..count (Getter)
    """
    function Idx()::Int
        return Lib.Fuses_Get_idx()
    end

    """
    Active fuse by index into the list of fuses. 1 indexed based. 1..count (Setter)
    """
    function Idx(Value::Int)
        Lib.Fuses_Set_idx(Value)
    end

end

