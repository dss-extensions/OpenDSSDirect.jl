module Loads

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings containing all Load names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Loads_Get_AllNames, C_NULL_CTX)
end

"""Factor for allocating loads by connected xfkva (Getter)"""
function AllocationFactor()::Float64
    return @checked Lib.Loads_Get_AllocationFactor(C_NULL_CTX)
end

"""Factor for allocating loads by connected xfkva (Setter)"""
function AllocationFactor(Value::Float64)
    @checked Lib.Loads_Set_AllocationFactor(C_NULL_CTX, Value)
end

"""Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time. (Getter)"""
function CVRCurve()::String
    return get_string(Lib.Loads_Get_CVRcurve(C_NULL_CTX))
end

"""Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time. (Setter)"""
function CVRCurve(Value::String)
    @checked Lib.Loads_Set_CVRcurve(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR. (Getter)"""
function CVRvars()::Float64
    return @checked Lib.Loads_Get_CVRvars(C_NULL_CTX)
end

"""Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR. (Setter)"""
function CVRvars(Value::Float64)
    @checked Lib.Loads_Set_CVRvars(C_NULL_CTX, Value)
end

"""Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR. (Getter)"""
function CVRwatts()::Float64
    return @checked Lib.Loads_Get_CVRwatts(C_NULL_CTX)
end

"""Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR. (Setter)"""
function CVRwatts(Value::Float64)
    @checked Lib.Loads_Set_CVRwatts(C_NULL_CTX, Value)
end

"""Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/ (Getter)"""
function CFactor()::Float64
    return @checked Lib.Loads_Get_Cfactor(C_NULL_CTX)
end

"""Factor relates average to peak kw.  Used for allocation with kwh and kwhdays/ (Setter)"""
function CFactor(Value::Float64)
    @checked Lib.Loads_Set_Cfactor(C_NULL_CTX, Value)
end

"""Load Class (Getter)"""
function Class()::Int
    return @checked Lib.Loads_Get_Class_(C_NULL_CTX)
end

"""Load Class (Setter)"""
function Class(Value::Int)
    @checked Lib.Loads_Set_Class_(C_NULL_CTX, Value)
end

"""Number of Load objects in active circuit."""
function Count()::Int
    return @checked Lib.Loads_Get_Count(C_NULL_CTX)
end

"""Set first Load element to be active; returns 0 if none."""
function First()::Int
    return @checked Lib.Loads_Get_First(C_NULL_CTX)
end

"""Name of the growthshape curve for yearly load growth factors. (Getter)"""
function Growth()::String
    return get_string(@checked Lib.Loads_Get_Growth(C_NULL_CTX))
end

"""Name of the growthshape curve for yearly load growth factors. (Setter)"""
function Growth(Value::String)
    @checked Lib.Loads_Set_Growth(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Delta loads are connected line-to-line. (Getter)"""
function IsDelta()::Bool
    return @checked(Lib.Loads_Get_IsDelta(C_NULL_CTX)) != 0
end

"""Delta loads are connected line-to-line. (Setter)"""
function IsDelta(Value::Bool)
    @checked Lib.Loads_Set_IsDelta(C_NULL_CTX, Value ? 1 : 0)
end

"""The Load Model defines variation of P and Q with voltage. (Getter)"""
function Model()::Lib.LoadModels
    return @checked Lib.Loads_Get_Model(C_NULL_CTX)
end

"""The Load Model defines variation of P and Q with voltage. (Setter)"""
function Model(Value::Union{Int,Lib.LoadModels})
    Value = convert(Lib.LoadModels, Value)
    @checked Lib.Loads_Set_Model(C_NULL_CTX, Value)
end

"""Set active load by name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Loads_Get_Name(C_NULL_CTX))
end

"""Set active load by name. (Setter)"""
function Name(Value::String)
    @checked Lib.Loads_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Sets next Load element to be active; returns 0 of none else index of active load."""
function Next()::Int
    return @checked Lib.Loads_Get_Next(C_NULL_CTX)
end

"""Number of customers in this load, defaults to one. (Getter)"""
function NumCust()::Int
    return @checked Lib.Loads_Get_NumCust(C_NULL_CTX)
end

"""Number of customers in this load, defaults to one. (Setter)"""
function NumCust(Value::Int)
    @checked Lib.Loads_Set_NumCust(C_NULL_CTX, Value)
end

"""Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW value (Getter)"""
function PF()::Float64
    return @checked Lib.Loads_Get_PF(C_NULL_CTX)
end

"""Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW value (Setter)"""
function PF(Value::Float64)
    @checked Lib.Loads_Set_PF(C_NULL_CTX, Value)
end

"""Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load. (Getter)"""
function PctMean()::Float64
    return @checked Lib.Loads_Get_PctMean(C_NULL_CTX)
end

"""Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load. (Setter)"""
function PctMean(Value::Float64)
    @checked Lib.Loads_Set_PctMean(C_NULL_CTX, Value)
end

"""Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load. (Getter)"""
function PctStdDev()::Float64
    return @checked Lib.Loads_Get_PctStdDev(C_NULL_CTX)
end

"""Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load. (Setter)"""
function PctStdDev(Value::Float64)
    @checked Lib.Loads_Set_PctStdDev(C_NULL_CTX, Value)
end

"""Relative Weighting factor for the active LOAD (Getter)"""
function RelWeighting()::Float64
    return @checked Lib.Loads_Get_RelWeight(C_NULL_CTX)
end

"""Relative Weighting factor for the active LOAD (Setter)"""
function RelWeighting(Value::Float64)
    @checked Lib.Loads_Set_RelWeight(C_NULL_CTX, Value)
end

"""Neutral resistance for wye-connected loads. (Getter)"""
function Rneut()::Float64
    return @checked Lib.Loads_Get_Rneut(C_NULL_CTX)
end

"""Neutral resistance for wye-connected loads. (Setter)"""
function Rneut(Value::Float64)
    @checked Lib.Loads_Set_Rneut(C_NULL_CTX, Value)
end

"""Load Spectrum (Getter)"""
function Spectrum()::String
    return get_string(@checked Lib.Loads_Get_Spectrum(C_NULL_CTX))
end

"""Load Spectrum (Setter)"""
function Spectrum(Value::String)
    @checked Lib.Loads_Set_Spectrum(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all). (Getter)"""
function Status()::Lib.LoadStatus
    return @checked Lib.Loads_Get_Status(C_NULL_CTX)
end

"""Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all). (Setter)"""
function Status(Value::Union{Int,Lib.LoadStatus})
    Value = convert(Lib.LoadStatus, Value)
    @checked Lib.Loads_Set_Status(C_NULL_CTX, Value)
end

"""Maximum per-unit voltage to use the load model. Above this, constant Z applies. (Getter)"""
function Vmaxpu()::Float64
    return @checked Lib.Loads_Get_Vmaxpu(C_NULL_CTX)
end

"""Maximum per-unit voltage to use the load model. Above this, constant Z applies. (Setter)"""
function Vmaxpu(Value::Float64)
    @checked Lib.Loads_Set_Vmaxpu(C_NULL_CTX, Value)
end

"""Minimum voltage for unserved energy (UE) evaluation. (Getter)"""
function VminEmerg()::Float64
    return @checked Lib.Loads_Get_Vminemerg(C_NULL_CTX)
end

"""Minimum voltage for unserved energy (UE) evaluation. (Setter)"""
function VminEmerg(Value::Float64)
    @checked Lib.Loads_Set_Vminemerg(C_NULL_CTX, Value)
end

"""Minimum voltage for energy exceeding normal (EEN) evaluations. (Getter)"""
function VminNorm()::Float64
    return @checked Lib.Loads_Get_Vminnorm(C_NULL_CTX)
end

"""Minimum voltage for energy exceeding normal (EEN) evaluations. (Setter)"""
function VminNorm(Value::Float64)
    @checked Lib.Loads_Set_Vminnorm(C_NULL_CTX, Value)
end

"""Minimum voltage to apply the load model. Below this, constant Z is used. (Getter)"""
function Vminpu()::Float64
    return @checked Lib.Loads_Get_Vminpu(C_NULL_CTX)
end

"""Minimum voltage to apply the load model. Below this, constant Z is used. (Setter)"""
function Vminpu(Value::Float64)
    @checked Lib.Loads_Set_Vminpu(C_NULL_CTX, Value)
end

"""Neutral reactance for wye-connected loads. (Getter)"""
function Xneut()::Float64
    return @checked Lib.Loads_Get_Xneut(C_NULL_CTX)
end

"""Neutral reactance for wye-connected loads. (Setter)"""
function Xneut(Value::Float64)
    @checked Lib.Loads_Set_Xneut(C_NULL_CTX, Value)
end

"""Name of yearly duration loadshape (Getter)"""
function Yearly()::String
    return get_string(@checked Lib.Loads_Get_Yearly(C_NULL_CTX))
end

"""Name of yearly duration loadshape (Setter)"""
function Yearly(Value::String)
    @checked Lib.Loads_Set_Yearly(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Array of 7 doubles with values for ZIPV property of the LOAD object (Getter)"""
function ZipV()::Vector{Float64}
    result = get_float64_array(Lib.Loads_Get_ZIPV, C_NULL_CTX)
        # TODO: make more general? Currently [0.0] is changed to []
    if result == [0.0]
        return []
    end

    return result
end

"""Array of 7 doubles with values for ZIPV property of the LOAD object (Setter)"""
function ZipV(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Loads_Set_ZIPV(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Name of the loadshape for a daily load profile. (Getter)"""
function Daily()::String
    return get_string(Lib.Loads_Get_daily(C_NULL_CTX))
end

"""Name of the loadshape for a daily load profile. (Setter)"""
function Daily(Value::String)
    @checked Lib.Loads_Set_daily(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of the loadshape for a duty cycle simulation. (Getter)"""
function Duty()::String
    return get_string(@checked Lib.Loads_Get_duty(C_NULL_CTX))
end

"""Name of the loadshape for a duty cycle simulation. (Setter)"""
function Duty(Value::String)
    @checked Lib.Loads_Set_duty(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Load Index (Getter)"""
function Idx()::Int
    return @checked Lib.Loads_Get_idx(C_NULL_CTX)
end

"""Load Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Loads_Set_idx(C_NULL_CTX, Value)
end

"""Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals. (Getter)"""
function kV()::Float64
    return @checked Lib.Loads_Get_kV(C_NULL_CTX)
end

"""Set kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals. (Setter)"""
function kV(Value::Float64)
    @checked Lib.Loads_Set_kV(C_NULL_CTX, Value)
end

"""Set kW for active Load. Updates kvar based on present PF. (Getter)"""
function kW()::Float64
    return @checked Lib.Loads_Get_kW(C_NULL_CTX)
end

"""Set kW for active Load. Updates kvar based on present PF. (Setter)"""
function kW(Value::Float64)
    @checked Lib.Loads_Set_kW(C_NULL_CTX, Value)
end

"""Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva. (Getter)"""
function kVABase()::Float64
    return @checked Lib.Loads_Get_kva(C_NULL_CTX)
end

"""Base load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva. (Setter)"""
function kVABase(Value::Float64)
    @checked Lib.Loads_Set_kva(C_NULL_CTX, Value)
end

"""Set kvar for active Load. Updates PF based on present kW. (Getter)"""
function kvar()::Float64
    return @checked Lib.Loads_Get_kvar(C_NULL_CTX)
end

"""Set kvar for active Load. Updates PF based on present kW. (Setter)"""
function kvar(Value::Float64)
    @checked Lib.Loads_Set_kvar(C_NULL_CTX, Value)
end

"""kwh billed for this period. Can be used with Cfactor for load allocation. (Getter)"""
function kWh()::Float64
    return @checked Lib.Loads_Get_kwh(C_NULL_CTX)
end

"""kwh billed for this period. Can be used with Cfactor for load allocation. (Setter)"""
function kWh(Value::Float64)
    @checked Lib.Loads_Set_kwh(C_NULL_CTX, Value)
end

"""Length of kwh billing period for average demand calculation. Default 30. (Getter)"""
function kWhDays()::Float64
    return @checked Lib.Loads_Get_kwhdays(C_NULL_CTX)
end

"""Length of kwh billing period for average demand calculation. Default 30. (Setter)"""
function kWhDays(Value::Float64)
    @checked Lib.Loads_Set_kwhdays(C_NULL_CTX, Value)
end

"""Percent of Load that is modeled as series R-L for harmonics studies (Getter)"""
function puSeriesRL()::Float64
    return @checked Lib.Loads_Get_pctSeriesRL(C_NULL_CTX)
end

"""Percent of Load that is modeled as series R-L for harmonics studies (Setter)"""
function puSeriesRL(Value::Float64)
    @checked Lib.Loads_Set_pctSeriesRL(C_NULL_CTX, Value)
end

"""Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf. (Getter)"""
function XfkVA()::Float64
    return @checked Lib.Loads_Get_xfkVA(C_NULL_CTX)
end

"""Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf. (Setter)"""
function XfkVA(Value::Float64)
    @checked Lib.Loads_Set_xfkVA(C_NULL_CTX, Value)
end

"""Number of phases (Getter)"""
function Phases()::Int
    return @checked Lib.Loads_Get_Phases(C_NULL_CTX)
end

"""Number of phases (Setter)"""
function Phases(Value::Int)
    return @checked Lib.Loads_Set_Phases(C_NULL_CTX, Value)
end

"""Sensor"""
function Sensor()::String
    return get_string(@checked Lib.Loads_Get_Sensor(C_NULL_CTX))
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
    :Phases,
    :Sensor
]

end
