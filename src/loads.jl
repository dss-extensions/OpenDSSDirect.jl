module Loads

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Array of strings containing all Load names"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.Loads_Get_AllNames)
    end

    """Factor for allocating loads by connected xfkva (Getter)"""
    function AllocationFactor()::Float64
        return Lib.Loads_Get_AllocationFactor()
    end

    """Factor for allocating loads by connected xfkva (Setter)"""
    function AllocationFactor(Value::Float64)
        Lib.Loads_Set_AllocationFactor(Value)
    end

    """Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time. (Getter)"""
    function CVRCurve()::String
        return Utils.get_string(Lib.Loads_Get_CVRcurve())
    end

    """Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time. (Setter)"""
    function CVRCurve(Value::String)
        Lib.Loads_Set_CVRcurve(Cstring(pointer(Value)))
    end

    """Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR. (Getter)"""
    function CVRvars()::Float64
        return Lib.Loads_Get_CVRvars()
    end

    """Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR. (Setter)"""
    function CVRvars(Value::Float64)
        Lib.Loads_Set_CVRvars(Value)
    end

    """Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR. (Getter)"""
    function CVRwatts()::Float64
        return Lib.Loads_Get_CVRwatts()
    end

    """Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR. (Setter)"""
    function CVRwatts(Value::Float64)
        Lib.Loads_Set_CVRwatts(Value)
    end

    """Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/ (Getter)"""
    function CFactor()::Float64
        return Lib.Loads_Get_Cfactor()
    end

    """Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/ (Setter)"""
    function CFactor(Value::Float64)
        Lib.Loads_Set_Cfactor(Value)
    end

    """Load Class (Getter)"""
    function Class()::Int
        return Lib.Loads_Get_Class_()
    end

    """Load Class (Setter)"""
    function Class(Value::Int)
        Lib.Loads_Set_Class_(Value)
    end

    """Number of Load objects in active circuit."""
    function Count()::Int
        return Lib.Loads_Get_Count()
    end

    """Set first Load element to be active; returns 0 if none."""
    function First()::Int
        return Lib.Loads_Get_First()
    end

    """Name of the growthshape curve for yearly load growth factors. (Getter)"""
    function Growth()::String
        return Utils.get_string(Lib.Loads_Get_Growth())
    end

    """Name of the growthshape curve for yearly load growth factors. (Setter)"""
    function Growth(Value::String)
        Lib.Loads_Set_Growth(Cstring(pointer(Value)))
    end

    """Delta loads are connected line-to-line. (Getter)"""
    function IsDelta()::Bool
        return Lib.Loads_Get_IsDelta() != 0
    end

    """Delta loads are connected line-to-line. (Setter)"""
    function IsDelta(Value::Bool)
        Lib.Loads_Set_IsDelta(Value ? 1 : 0)
    end

    """The Load Model defines variation of P and Q with voltage. (Getter)"""
    function Model()::Lib.LoadModels
        return Lib.Loads_Get_Model()
    end

    """The Load Model defines variation of P and Q with voltage. (Setter)"""
    function Model(Value::Union{Int, Lib.LoadModels})
        Value = convert(Lib.LoadModels, Value)
        Lib.Loads_Set_Model(Value)
    end

    """Set active load by name. (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.Loads_Get_Name())
    end

    """Set active load by name. (Setter)"""
    function Name(Value::String)
        Lib.Loads_Set_Name(Cstring(pointer(Value)))
    end

    """Sets next Load element to be active; returns 0 of none else index of active load."""
    function Next()::Int
        return Lib.Loads_Get_Next()
    end

    """Number of customers in this load, defaults to one. (Getter)"""
    function NumCust()::Int
        return Lib.Loads_Get_NumCust()
    end

    """Number of customers in this load, defaults to one. (Setter)"""
    function NumCust(Value::Int)
        Lib.Loads_Set_NumCust(Value)
    end

    """Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW value (Getter)"""
    function PF()::Float64
        return Lib.Loads_Get_PF()
    end

    """Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW value (Setter)"""
    function PF(Value::Float64)
        Lib.Loads_Set_PF(Value)
    end

    """Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load. (Getter)"""
    function PctMean()::Float64
        return Lib.Loads_Get_PctMean()
    end

    """Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load. (Setter)"""
    function PctMean(Value::Float64)
        Lib.Loads_Set_PctMean(Value)
    end

    """Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load. (Getter)"""
    function PctStdDev()::Float64
        return Lib.Loads_Get_PctStdDev()
    end

    """Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load. (Setter)"""
    function PctStdDev(Value::Float64)
        Lib.Loads_Set_PctStdDev(Value)
    end

    """Relative Weighting factor for the active LOAD (Getter)"""
    function RelWeighting()::Float64
        return Lib.Loads_Get_RelWeight()
    end

    """Relative Weighting factor for the active LOAD (Setter)"""
    function RelWeighting(Value::Float64)
        Lib.Loads_Set_RelWeight(Value)
    end

    """Neutral resistance for wye-connected loads. (Getter)"""
    function Rneut()::Float64
        return Lib.Loads_Get_Rneut()
    end

    """Neutral resistance for wye-connected loads. (Setter)"""
    function Rneut(Value::Float64)
        Lib.Loads_Set_Rneut(Value)
    end

    """Load Spectrum (Getter)"""
    function Spectrum()::String
        return Utils.get_string(Lib.Loads_Get_Spectrum())
    end

    """Load Spectrum (Setter)"""
    function Spectrum(Value::String)
        Lib.Loads_Set_Spectrum(Cstring(pointer(Value)))
    end

    """Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all). (Getter)"""
    function Status()::Lib.LoadStatus
        return Lib.Loads_Get_Status()
    end

    """Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all). (Setter)"""
    function Status(Value::Union{Int, Lib.LoadStatus})
        Value = convert(Lib.LoadStatus, Value)
        Lib.Loads_Set_Status(Value)
    end

    """Maximum per-unit voltage to use the load model. Above this, constant Z applies. (Getter)"""
    function Vmaxpu()::Float64
        return Lib.Loads_Get_Vmaxpu()
    end

    """Maximum per-unit voltage to use the load model. Above this, constant Z applies. (Setter)"""
    function Vmaxpu(Value::Float64)
        Lib.Loads_Set_Vmaxpu(Value)
    end

    """Minimum voltage for unserved energy (UE) evaluation. (Getter)"""
    function VminEmerg()::Float64
        return Lib.Loads_Get_Vminemerg()
    end

    """Minimum voltage for unserved energy (UE) evaluation. (Setter)"""
    function VminEmerg(Value::Float64)
        Lib.Loads_Set_Vminemerg(Value)
    end

    """Minimum voltage for energy exceeding normal (EEN) evaluations. (Getter)"""
    function VminNorm()::Float64
        return Lib.Loads_Get_Vminnorm()
    end

    """Minimum voltage for energy exceeding normal (EEN) evaluations. (Setter)"""
    function VminNorm(Value::Float64)
        Lib.Loads_Set_Vminnorm(Value)
    end

    """Minimum voltage to apply the load model. Below this, constant Z is used. (Getter)"""
    function Vminpu()::Float64
        return Lib.Loads_Get_Vminpu()
    end

    """Minimum voltage to apply the load model. Below this, constant Z is used. (Setter)"""
    function Vminpu(Value::Float64)
        Lib.Loads_Set_Vminpu(Value)
    end

    """Neutral reactance for wye-connected loads. (Getter)"""
    function Xneut()::Float64
        return Lib.Loads_Get_Xneut()
    end

    """Neutral reactance for wye-connected loads. (Setter)"""
    function Xneut(Value::Float64)
        Lib.Loads_Set_Xneut(Value)
    end

    """Name of yearly duration loadshape (Getter)"""
    function Yearly()::String
        return Utils.get_string(Lib.Loads_Get_Yearly())
    end

    """Name of yearly duration loadshape (Setter)"""
    function Yearly(Value::String)
        Lib.Loads_Set_Yearly(Cstring(pointer(Value)))
    end

    """Array of 7 doubles with values for ZIPV property of the LOAD object (Getter)"""
    function ZipV()::Vector{Float64}
        result = Utils.get_float64_array(Lib.Loads_Get_ZIPV)
        # TODO: make more general? Currently [0.0] is changed to []
        if result == [0.0]
            return []
        end

        return result
    end

    """Array of 7 doubles with values for ZIPV property of the LOAD object (Setter)"""
    function ZipV(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Loads_Set_ZIPV(ValuePtr, ValueCount)
    end

    """Name of the loadshape for a daily load profile. (Getter)"""
    function Daily()::String
        return Utils.get_string(Lib.Loads_Get_daily())
    end

    """Name of the loadshape for a daily load profile. (Setter)"""
    function Daily(Value::String)
        Lib.Loads_Set_daily(Cstring(pointer(Value)))
    end

    """Name of the loadshape for a duty cycle simulation. (Getter)"""
    function Duty()::String
        return Utils.get_string(Lib.Loads_Get_duty())
    end

    """Name of the loadshape for a duty cycle simulation. (Setter)"""
    function Duty(Value::String)
        Lib.Loads_Set_duty(Cstring(pointer(Value)))
    end

    """Load Index (Getter)"""
    function Idx()::Int
        return Lib.Loads_Get_idx()
    end

    """Load Index (Setter)"""
    function Idx(Value::Int)
        Lib.Loads_Set_idx(Value)
    end

    """Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals. (Getter)"""
    function kV()::Float64
        return Lib.Loads_Get_kV()
    end

    """Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals. (Setter)"""
    function kV(Value::Float64)
        Lib.Loads_Set_kV(Value)
    end

    """Set kW for active Load. Updates kvar based on present PF. (Getter)"""
    function kW()::Float64
        return Lib.Loads_Get_kW()
    end

    """Set kW for active Load. Updates kvar based on present PF. (Setter)"""
    function kW(Value::Float64)
        Lib.Loads_Set_kW(Value)
    end

    """Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva. (Getter)"""
    function kVABase()::Float64
        return Lib.Loads_Get_kva()
    end

    """Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva. (Setter)"""
    function kVABase(Value::Float64)
        Lib.Loads_Set_kva(Value)
    end

    """Set kvar for active Load. Updates PF based on present kW. (Getter)"""
    function kvar()::Float64
        return Lib.Loads_Get_kvar()
    end

    """Set kvar for active Load. Updates PF based on present kW. (Setter)"""
    function kvar(Value::Float64)
        Lib.Loads_Set_kvar(Value)
    end

    """kwh billed for this period. Can be used with Cfactor for load allocation. (Getter)"""
    function kWh()::Float64
        return Lib.Loads_Get_kwh()
    end

    """kwh billed for this period. Can be used with Cfactor for load allocation. (Setter)"""
    function kWh(Value::Float64)
        Lib.Loads_Set_kwh(Value)
    end

    """Length of kwh billing period for average demand calculation. Default 30. (Getter)"""
    function kWhDays()::Float64
        return Lib.Loads_Get_kwhdays()
    end

    """Length of kwh billing period for average demand calculation. Default 30. (Setter)"""
    function kWhDays(Value::Float64)
        Lib.Loads_Set_kwhdays(Value)
    end

    """Percent of Load that is modeled as series R-L for harmonics studies (Getter)"""
    function puSeriesRL()::Float64
        return Lib.Loads_Get_pctSeriesRL()
    end

    """Percent of Load that is modeled as series R-L for harmonics studies (Setter)"""
    function puSeriesRL(Value::Float64)
        Lib.Loads_Set_pctSeriesRL(Value)
    end

    """Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf. (Getter)"""
    function XfkVA()::Float64
        return Lib.Loads_Get_xfkVA()
    end

    """Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf. (Setter)"""
    function XfkVA(Value::Float64)
        Lib.Loads_Set_xfkVA(Value)
    end

    _columns = [
        :AllocationFactor,
        :CVRCurve,
        :CVRvars,
        :CVRwatts,
        :CFactor,
        :Class,
        :Growth,
        :IsDelta,
        :Model,
        :Name,
        :NumCust,
        :PF,
        :PctMean,
        :PctStdDev,
        :RelWeighting,
        :Rneut,
        :Spectrum,
        :Status,
        :Vmaxpu,
        :VminEmerg,
        :VminNorm,
        :Vminpu,
        :Xneut,
        :Yearly,
        :ZipV,
        :Daily,
        :Duty,
        :Idx,
        :kV,
        :kW,
        :kVABase,
        :kvar,
        :kWh,
        :kWhDays,
        :puSeriesRL,
        :XfkVA,
    ]

end

