
module Transformers

    using ..Lib
    using ..Utils

    """(read-only) Array of strings with all Transformer names in the active circuit."""
    function AllNames()::Vector{String}
        return get_string_array(Lib.Transformers_Get_AllNames)
    end

    function Count()::Int
        return Lib.Transformers_Get_Count()
    end

    """(read-only) Sets the first Transformer active. Returns 0 if no more."""
    function First()::Int
        return Lib.Transformers_Get_First()
    end

    """Active Winding delta or wye connection?"""
    function IsDelta()::Bool
        return Lib.Transformers_Get_IsDelta() != 0
    end

    """Active Winding delta or wye connection?"""
    function IsDelta(Value::Bool)
        Lib.Transformers_Set_IsDelta(Value ? 1 : 0)
    end

    """Active Winding maximum tap in per-unit."""
    function MaxTap()::Float64
        # TODO: should this be Int64
        return Lib.Transformers_Get_MaxTap()
    end

    """Active Winding maximum tap in per-unit."""
    function MaxTap(Value::Float64)
        Lib.Transformers_Set_MaxTap(Value)
    end

    """Active Winding minimum tap in per-unit."""
    function MinTap()::Float64
        return Lib.Transformers_Get_MinTap()
    end

    """Active Winding minimum tap in per-unit."""
    function MinTap(Value::Float64)
        Lib.Transformers_Set_MinTap(Value)
    end

    """Sets a Transformer active by Name."""
    function Name()::String
        return get_string(Lib.Transformers_Get_Name())
    end

    """Sets a Transformer active by Name."""
    function Name(Value::String)
        Lib.Transformers_Set_Name(Value)
    end

    """(read-only) Sets the next Transformer active. Returns 0 if no more."""
    function Next()::Int
        return Lib.Transformers_Get_Next()
    end

    """Active Winding number of tap steps betwein MinTap and MaxTap."""
    function NumTaps()::Int
        return Lib.Transformers_Get_NumTaps()
    end

    """Active Winding number of tap steps betwein MinTap and MaxTap."""
    function NumTaps(Value::Int)
        Lib.Transformers_Set_NumTaps(Value)
    end

    """Number of windings on this transformer. Allocates memory; set or change this property first."""
    function NumWindings()::Int
        return Lib.Transformers_Get_NumWindings()
    end

    """Number of windings on this transformer. Allocates memory; set or change this property first."""
    function NumWindings(Value::Int)
        Lib.Transformers_Set_NumWindings(Value)
    end

    """Active Winding resistance in %"""
    function R()::Float64
        return Lib.Transformers_Get_R()
    end

    """Active Winding resistance in %"""
    function R(Value::Float64)
        Lib.Transformers_Set_R(Value)
    end

    """Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye."""
    function Rneut()::Float64
        return Lib.Transformers_Get_Rneut()
    end

    """Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye."""
    function Rneut(Value::Float64)
        Lib.Transformers_Set_Rneut(Value)
    end

    """Active Winding tap in per-unit."""
    function Tap()::Float64
        return Lib.Transformers_Get_Tap()
    end

    """Active Winding tap in per-unit."""
    function Tap(Value::Float64)
        Lib.Transformers_Set_Tap(Value)
    end

    """Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)"""
    function Wdg()::Float64
        return Lib.Transformers_Get_Wdg()
    end

    """Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)"""
    function Wdg(Value::Float64)
        Lib.Transformers_Set_Wdg(Value)
    end

    """Name of an XfrmCode that supplies electircal parameters for this Transformer."""
    function XfmrCode()::String
        return get_string(Lib.Transformers_Get_XfmrCode())
    end

    """Name of an XfrmCode that supplies electircal parameters for this Transformer."""
    function XfmrCode(Value::String)
        Lib.Transformers_Set_XfmrCode(Value)
    end

    """Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers."""
    function Xhl()::Float64
        return Lib.Transformers_Get_Xhl()
    end

    """Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers."""
    function Xhl(Value::Float64)
        Lib.Transformers_Set_Xhl(Value)
    end

    """Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only."""
    function Xht()::Float64
        return Lib.Transformers_Get_Xht()
    end

    """Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only."""
    function Xht(Value::Float64)
        Lib.Transformers_Set_Xht(Value)
    end

    """Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only."""
    function Xlt()::Float64
        return Lib.Transformers_Get_Xlt()
    end

    """Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only."""
    function Xlt(Value::Float64)
        Lib.Transformers_Set_Xlt(Value)
    end

    """Active Winding neutral reactance [ohms] for wye connections."""
    function Xneut()::Float64
        return Lib.Transformers_Get_Xneut()
    end

    """Active Winding neutral reactance [ohms] for wye connections."""
    function Xneut(Value::Float64)
        Lib.Transformers_Set_Xneut(Value)
    end

    """Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer."""
    function kV()::Float64
        return Lib.Transformers_Get_kV()
    end

    """Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer."""
    function kV(Value::Float64)
        Lib.Transformers_Set_kV(Value)
    end

    """Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings."""
    function kVA()::Float64
        return Lib.Transformers_Get_kVA()
    end

    """Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings."""
    function kVA(Value::Float64)
        Lib.Transformers_Set_kVA(Value)
    end

end

