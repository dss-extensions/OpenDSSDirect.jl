
module Transformers

    using ..lib
    using ..utils

    """(read-only) Array of strings with all Transformer names in the active circuit."""
    function AllNames()
        return get_string_array(lib.Transformers_Get_AllNames)
    end

    function Count()
        return lib.Transformers_Get_Count()
    end

    """(read-only) Sets the first Transformer active. Returns 0 if no more."""
    function First()
        return lib.Transformers_Get_First()
    end

    """Active Winding delta or wye connection?"""
    function IsDelta()
        return lib.Transformers_Get_IsDelta() != 0
    end

    """Active Winding delta or wye connection?"""
    function IsDelta(Value)
        lib.Transformers_Set_IsDelta(Value)
    end

    """Active Winding maximum tap in per-unit."""
    function MaxTap()
        return lib.Transformers_Get_MaxTap()
    end

    """Active Winding maximum tap in per-unit."""
    function MaxTap(Value)
        lib.Transformers_Set_MaxTap(Value)
    end

    """Active Winding minimum tap in per-unit."""
    function MinTap()
        return lib.Transformers_Get_MinTap()
    end

    """Active Winding minimum tap in per-unit."""
    function MinTap(Value)
        lib.Transformers_Set_MinTap(Value)
    end

    """Sets a Transformer active by Name."""
    function Name()
        return get_string(lib.Transformers_Get_Name())
    end

    """Sets a Transformer active by Name."""
    function Name(Value::String)
        lib.Transformers_Set_Name(Value)
    end

    """(read-only) Sets the next Transformer active. Returns 0 if no more."""
    function Next()
        return lib.Transformers_Get_Next()
    end

    """Active Winding number of tap steps betwein MinTap and MaxTap."""
    function NumTaps()
        return lib.Transformers_Get_NumTaps()
    end

    """Active Winding number of tap steps betwein MinTap and MaxTap."""
    function NumTaps(Value)
        lib.Transformers_Set_NumTaps(Value)
    end

    """Number of windings on this transformer. Allocates memory; set or change this property first."""
    function NumWindings()
        return lib.Transformers_Get_NumWindings()
    end

    """Number of windings on this transformer. Allocates memory; set or change this property first."""
    function NumWindings(Value)
        lib.Transformers_Set_NumWindings(Value)
    end

    """Active Winding resistance in %"""
    function R()
        return lib.Transformers_Get_R()
    end

    """Active Winding resistance in %"""
    function R(Value)
        lib.Transformers_Set_R(Value)
    end

    """Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye."""
    function Rneut()
        return lib.Transformers_Get_Rneut()
    end

    """Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye."""
    function Rneut(Value)
        lib.Transformers_Set_Rneut(Value)
    end

    """Active Winding tap in per-unit."""
    function Tap()
        return lib.Transformers_Get_Tap()
    end

    """Active Winding tap in per-unit."""
    function Tap(Value)
        lib.Transformers_Set_Tap(Value)
    end

    """Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)"""
    function Wdg()
        return lib.Transformers_Get_Wdg()
    end

    """Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)"""
    function Wdg(Value)
        lib.Transformers_Set_Wdg(Value)
    end

    """Name of an XfrmCode that supplies electircal parameters for this Transformer."""
    function XfmrCode()
        return get_string(lib.Transformers_Get_XfmrCode())
    end

    """Name of an XfrmCode that supplies electircal parameters for this Transformer."""
    function XfmrCode(Value::String)
        lib.Transformers_Set_XfmrCode(Value)
    end

    """Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers."""
    function Xhl()
        return lib.Transformers_Get_Xhl()
    end

    """Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers."""
    function Xhl(Value)
        lib.Transformers_Set_Xhl(Value)
    end

    """Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only."""
    function Xht()
        return lib.Transformers_Get_Xht()
    end

    """Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only."""
    function Xht(Value)
        lib.Transformers_Set_Xht(Value)
    end

    """Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only."""
    function Xlt()
        return lib.Transformers_Get_Xlt()
    end

    """Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only."""
    function Xlt(Value)
        lib.Transformers_Set_Xlt(Value)
    end

    """Active Winding neutral reactance [ohms] for wye connections."""
    function Xneut()
        return lib.Transformers_Get_Xneut()
    end

    """Active Winding neutral reactance [ohms] for wye connections."""
    function Xneut(Value)
        lib.Transformers_Set_Xneut(Value)
    end

    """Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer."""
    function kV()
        return lib.Transformers_Get_kV()
    end

    """Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer."""
    function kV(Value)
        lib.Transformers_Set_kV(Value)
    end

    """Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings."""
    function kVA()
        return lib.Transformers_Get_kVA()
    end

    """Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings."""
    function kVA(Value)
        lib.Transformers_Set_kVA(Value)
    end

end

