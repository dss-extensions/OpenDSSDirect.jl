module Loads

    using ..lib
    using ..utils

    """(read-only) Array of strings containing all Load names"""
    function AllNames()
        return get_string_array(lib.Loads_Get_AllNames)
    end

    """Factor for allocating loads by connected xfkva"""
    function AllocationFactor()
        return lib.Loads_Get_AllocationFactor()
    end

    """Factor for allocating loads by connected xfkva"""
    function AllocationFactor(Value)
        lib.Loads_Set_AllocationFactor(Value)
    end

    """Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time."""
    function CVRCurve()
        return get_string(lib.Loads_Get_CVRcurve())
    end

    """Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time."""
    function CVRCurve(Value)
        lib.Loads_Set_CVRcurve(Cstring(pointer(Value)))
    end

    """Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR."""
    function CVRvars()
        return lib.Loads_Get_CVRvars()
    end

    """Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR."""
    function CVRvars(Value)
        lib.Loads_Set_CVRvars(Value)
    end

    """Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR."""
    function CVRwatts()
        return lib.Loads_Get_CVRwatts()
    end

    """Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR."""
    function CVRwatts(Value)
        lib.Loads_Set_CVRwatts(Value)
    end

    """Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/"""
    function CFactor()
        return lib.Loads_Get_Cfactor()
    end

    """Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/"""
    function CFactor(Value)
        lib.Loads_Set_Cfactor(Value)
    end

    function Class()
        return lib.Loads_Get_Class_()
    end

    function Class(Value)
        lib.Loads_Set_Class_(Value)
    end

    """(read-only) Number of Load objects in active circuit."""
    function Count()
        return lib.Loads_Get_Count()
    end

    """(read-only) Set first Load element to be active; returns 0 if none."""
    function First()
        return lib.Loads_Get_First()
    end

    """Name of the growthshape curve for yearly load growth factors."""
    function Growth()
        return get_string(lib.Loads_Get_Growth())
    end

    """Name of the growthshape curve for yearly load growth factors."""
    function Growth(Value::String)
        lib.Loads_Set_Growth(Cstring(pointer(Value)))
    end

    """Delta loads are connected line-to-line."""
    function IsDelta()
        return lib.Loads_Get_IsDelta() != 0
    end

    """Delta loads are connected line-to-line."""
    function IsDelta(Value)
        lib.Loads_Set_IsDelta(Value)
    end

    """The Load Model defines variation of P and Q with voltage."""
    function Model()
        return lib.Loads_Get_Model()
    end

    """The Load Model defines variation of P and Q with voltage."""
    function Model(Value)
        lib.Loads_Set_Model(Value)
    end

    """Set active load by name."""
    function Name()
        return get_string(lib.Loads_Get_Name())
    end

    """Set active load by name."""
    function Name(Value)
        lib.Loads_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets next Load element to be active; returns 0 of none else index of active load."""
    function Next()
        return lib.Loads_Get_Next()
    end

    """Number of customers in this load, defaults to one."""
    function NumCust()
        return lib.Loads_Get_NumCust()
    end

    """Number of customers in this load, defaults to one."""
    function NumCust(Value)
        lib.Loads_Set_NumCust(Value)
    end

    """
    (read) Set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on kW value
    (write) Set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW.
    """
    function PF()
        return lib.Loads_Get_PF()
    end

    """
    (read) Set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on kW value
    (write) Set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW.
    """
    function PF(Value)
        lib.Loads_Set_PF(Value)
    end

    """Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load."""
    function PctMean()
        return lib.Loads_Get_PctMean()
    end

    """Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load."""
    function PctMean(Value)
        lib.Loads_Set_PctMean(Value)
    end

    """Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load."""
    function PctStdDev()
        return lib.Loads_Get_PctStdDev()
    end

    """Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load."""
    function PctStdDev(Value)
        lib.Loads_Set_PctStdDev(Value)
    end

    """Relative Weighting factor for the active LOAD"""
    function RelWeighting()
        return lib.Loads_Get_RelWeight()
    end

    """Relative Weighting factor for the active LOAD"""
    function RelWeighting(Value)
        lib.Loads_Set_RelWeight(Value)
    end

    """Neutral resistance for wye-connected loads."""
    function Rneut()
        return lib.Loads_Get_Rneut()
    end

    """Neutral resistance for wye-connected loads."""
    function Rneut(Value)
        lib.Loads_Set_Rneut(Value)
    end

    function Spectrum()
        return get_string(lib.Loads_Get_Spectrum())
    end

    function Spectrum(Value::String)
        lib.Loads_Set_Spectrum(Cstring(pointer(Value)))
    end

    """Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all)."""
    function Status()
        return lib.Loads_Get_Status()
    end

    """Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all)."""
    function Status(Value)
        lib.Loads_Set_Status(Value)
    end

    """Maximum per-unit voltage to use the load model. Above this, constant Z applies."""
    function Vmaxpu()
        return lib.Loads_Get_Vmaxpu()
    end

    """Maximum per-unit voltage to use the load model. Above this, constant Z applies."""
    function Vmaxpu(Value)
        lib.Loads_Set_Vmaxpu(Value)
    end

    """Minimum voltage for unserved energy (UE) evaluation."""
    function VminEmerg()
        return lib.Loads_Get_Vminemerg()
    end

    """Minimum voltage for unserved energy (UE) evaluation."""
    function VminEmerg(Value)
        lib.Loads_Set_Vminemerg(Value)
    end

    """Minimum voltage for energy exceeding normal (EEN) evaluations."""
    function VminNorm()
        return lib.Loads_Get_Vminnorm()
    end

    """Minimum voltage for energy exceeding normal (EEN) evaluations."""
    function VminNorm(Value)
        lib.Loads_Set_Vminnorm(Value)
    end

    """Minimum voltage to apply the load model. Below this, constant Z is used."""
    function Vminpu()
        return lib.Loads_Get_Vminpu()
    end

    """Minimum voltage to apply the load model. Below this, constant Z is used."""
    function Vminpu(Value)
        lib.Loads_Set_Vminpu(Value)
    end

    """Neutral reactance for wye-connected loads."""
    function Xneut()
        return lib.Loads_Get_Xneut()
    end

    """Neutral reactance for wye-connected loads."""
    function Xneut(Value)
        lib.Loads_Set_Xneut(Value)
    end

    """Name of yearly duration loadshape"""
    function Yearly()
        return get_string(lib.Loads_Get_Yearly())
    end

    """Name of yearly duration loadshape"""
    function Yearly(Value::String)
        lib.Loads_Set_Yearly(Cstring(pointer(Value)))
    end

    """Array of 7  doubles with values for ZIPV property of the LOAD object"""
    function ZipV()
        result = get_float64_array(lib.Loads_Get_ZIPV)
        if result == [0]
            return []
        end

        return result
    end

    """Array of 7  doubles with values for ZIPV property of the LOAD object"""
    function ZipV(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Loads_Set_ZIPV(ValuePtr, ValueCount)
    end

    """Name of the loadshape for a daily load profile."""
    function Daily()
        return get_string(lib.Loads_Get_daily())
    end

    """Name of the loadshape for a daily load profile."""
    function Daily(Value::String)
        lib.Loads_Set_daily(Cstring(pointer(Value)))
    end

    """Name of the loadshape for a duty cycle simulation."""
    function Duty()
        return get_string(lib.Loads_Get_duty())
    end

    """Name of the loadshape for a duty cycle simulation."""
    function Duty(Value::String)
        lib.Loads_Set_duty(Cstring(pointer(Value)))
    end

    function Idx()
        return lib.Loads_Get_idx()
    end

    function Idx(Value)
        lib.Loads_Set_idx(Value)
    end

    """Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals."""
    function kV()
        return lib.Loads_Get_kV()
    end

    """Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals."""
    function kV(Value)
        lib.Loads_Set_kV(Value)
    end

    """Set kW for active Load. Updates kvar based on present PF."""
    function kW()
        return lib.Loads_Get_kW()
    end

    """Set kW for active Load. Updates kvar based on present PF."""
    function kW(Value)
        lib.Loads_Set_kW(Value)
    end

    """Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva."""
    function kVABase()
        return lib.Loads_Get_kva()
    end

    """Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva."""
    function kVABase(Value)
        lib.Loads_Set_kva(Value)
    end

    """Set kvar for active Load. Updates PF based on present kW."""
    function kvar()
        return lib.Loads_Get_kvar()
    end

    """Set kvar for active Load. Updates PF based on present kW."""
    function kvar(Value)
        lib.Loads_Set_kvar(Value)
    end

    """kwh billed for this period. Can be used with Cfactor for load allocation."""
    function kWh()
        return lib.Loads_Get_kwh()
    end

    """kwh billed for this period. Can be used with Cfactor for load allocation."""
    function kWh(Value)
        lib.Loads_Set_kwh(Value)
    end

    """Length of kwh billing period for average demand calculation. Default 30."""
    function kWhDays()
        return lib.Loads_Get_kwhdays()
    end

    """Length of kwh billing period for average demand calculation. Default 30."""
    function kWhDays(Value)
        lib.Loads_Set_kwhdays(Value)
    end

    """Percent of Load that is modeled as series R-L for harmonics studies"""
    function puSeriesRL()
        return lib.Loads_Get_pctSeriesRL()
    end

    """Percent of Load that is modeled as series R-L for harmonics studies"""
    function puSeriesRL(Value)
        lib.Loads_Set_pctSeriesRL(Value)
    end

    """Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf."""
    function XfkVA()
        return lib.Loads_Get_xfkVA()
    end

    """Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf."""
    function XfkVA(Value)
        lib.Loads_Set_xfkVA(Value)
    end

end

