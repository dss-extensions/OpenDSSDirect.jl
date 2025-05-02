module Loads

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Load objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Loads_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Load object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Load object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Load Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Load to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Load to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Load (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Load by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Loads_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Factor for allocating loads by connected xfkva

Original COM help: https://opendss.epri.com/AllocationFactor.html

(Getter)
"""
function AllocationFactor(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_AllocationFactor(dss.ctx)
end
AllocationFactor() = AllocationFactor(DSS_DEFAULT_CTX)

"""
Factor for allocating loads by connected xfkva

Original COM help: https://opendss.epri.com/AllocationFactor.html

(Setter)
"""
function AllocationFactor(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_AllocationFactor(dss.ctx, Value)
end
AllocationFactor(Value::Float64) = AllocationFactor(DSS_DEFAULT_CTX, Value)

"""
Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time.

Original COM help: https://opendss.epri.com/CVRcurve.html

(Getter)
"""
function CVRCurve(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_CVRcurve(dss.ctx))
end
CVRCurve() = CVRCurve(DSS_DEFAULT_CTX)

"""
Name of a loadshape with both Mult and Qmult, for CVR factors as a function of time.

Original COM help: https://opendss.epri.com/CVRcurve.html

(Setter)
"""
function CVRCurve(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_CVRcurve(dss.ctx, Cstring(pointer(Value)))
end
CVRCurve(Value::String) = CVRCurve(DSS_DEFAULT_CTX, Value)

"""
Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR.

Original COM help: https://opendss.epri.com/CVRvars.html

(Getter)
"""
function CVRvars(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_CVRvars(dss.ctx)
end
CVRvars() = CVRvars(DSS_DEFAULT_CTX)

"""
Percent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR.

Original COM help: https://opendss.epri.com/CVRvars.html

(Setter)
"""
function CVRvars(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_CVRvars(dss.ctx, Value)
end
CVRvars(Value::Float64) = CVRvars(DSS_DEFAULT_CTX, Value)

"""
Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR.

Original COM help: https://opendss.epri.com/CVRwatts.html

(Getter)
"""
function CVRwatts(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_CVRwatts(dss.ctx)
end
CVRwatts() = CVRwatts(DSS_DEFAULT_CTX)

"""
Percent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR.

Original COM help: https://opendss.epri.com/CVRwatts.html

(Setter)
"""
function CVRwatts(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_CVRwatts(dss.ctx, Value)
end
CVRwatts(Value::Float64) = CVRwatts(DSS_DEFAULT_CTX, Value)

"""
CFactor relates average to peak kw.  Used for allocation with kwh and kwhdays

Original COM help: https://opendss.epri.com/Cfactor.html

(Getter)
"""
function CFactor(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Cfactor(dss.ctx)
end
CFactor() = CFactor(DSS_DEFAULT_CTX)

"""
CFactor relates average to peak kw.  Used for allocation with kwh and kwhdays

Original COM help: https://opendss.epri.com/Cfactor.html

(Setter)
"""
function CFactor(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Cfactor(dss.ctx, Value)
end
CFactor(Value::Float64) = CFactor(DSS_DEFAULT_CTX, Value)

"""
Code number used to separate loads by class or group. No effect on the solution.

Original COM help: https://opendss.epri.com/Class.html

(Getter)
"""
function Class(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_Class_(dss.ctx)
end
Class() = Class(DSS_DEFAULT_CTX)

"""
Code number used to separate loads by class or group. No effect on the solution.

Original COM help: https://opendss.epri.com/Class.html

(Setter)
"""
function Class(dss::DSSContext, Value::Int)
    @checked Lib.Loads_Set_Class_(dss.ctx, Value)
end
Class(Value::Int) = Class(DSS_DEFAULT_CTX, Value)

"""
Name of the growthshape curve for yearly load growth factors.

Original COM help: https://opendss.epri.com/Growth.html

(Getter)
"""
function Growth(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_Growth(dss.ctx))
end
Growth() = Growth(DSS_DEFAULT_CTX)

"""
Name of the growthshape curve for yearly load growth factors.

Original COM help: https://opendss.epri.com/Growth.html

(Setter)
"""
function Growth(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_Growth(dss.ctx, Cstring(pointer(Value)))
end
Growth(Value::String) = Growth(DSS_DEFAULT_CTX, Value)

"""
Delta loads are connected line-to-line.

Original COM help: https://opendss.epri.com/IsDelta1.html

(Getter)
"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(Lib.Loads_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""
Delta loads are connected line-to-line.

Original COM help: https://opendss.epri.com/IsDelta1.html

(Setter)
"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked Lib.Loads_Set_IsDelta(dss.ctx, Value ? 1 : 0)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""
The Load Model defines variation of P and Q with voltage.

Original COM help: https://opendss.epri.com/Model1.html

(Getter)
"""
function Model(dss::DSSContext)::Lib.LoadModels
    return @checked Lib.Loads_Get_Model(dss.ctx)
end
Model() = Model(DSS_DEFAULT_CTX)

"""
The Load Model defines variation of P and Q with voltage.

Original COM help: https://opendss.epri.com/Model1.html

(Setter)
"""
function Model(dss::DSSContext, Value::Union{Int,Lib.LoadModels})
    Value = convert(Lib.LoadModels, Value)
    @checked Lib.Loads_Set_Model(dss.ctx, Value)
end
Model(Value::Union{Int,Lib.LoadModels}) = Model(DSS_DEFAULT_CTX, Value)

"""
Number of customers in this load, defaults to one.

Original COM help: https://opendss.epri.com/NumCust1.html

(Getter)
"""
function NumCust(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_NumCust(dss.ctx)
end
NumCust() = NumCust(DSS_DEFAULT_CTX)

"""
Number of customers in this load, defaults to one.

Original COM help: https://opendss.epri.com/NumCust1.html

(Setter)
"""
function NumCust(dss::DSSContext, Value::Int)
    @checked Lib.Loads_Set_NumCust(dss.ctx, Value)
end
NumCust(Value::Int) = NumCust(DSS_DEFAULT_CTX, Value)

"""
Get or set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW

Original COM help: https://opendss.epri.com/PF1.html

(Getter)
"""
function PF(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_PF(dss.ctx)
end
PF() = PF(DSS_DEFAULT_CTX)

"""
Get or set Power Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW

Original COM help: https://opendss.epri.com/PF1.html

(Setter)
"""
function PF(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_PF(dss.ctx, Value)
end
PF(Value::Float64) = PF(DSS_DEFAULT_CTX, Value)

"""
Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load.

Original COM help: https://opendss.epri.com/PctMean.html

(Getter)
"""
function PctMean(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_PctMean(dss.ctx)
end
PctMean() = PctMean(DSS_DEFAULT_CTX)

"""
Average percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load.

Original COM help: https://opendss.epri.com/PctMean.html

(Setter)
"""
function PctMean(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_PctMean(dss.ctx, Value)
end
PctMean(Value::Float64) = PctMean(DSS_DEFAULT_CTX, Value)

"""
Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load.

Original COM help: https://opendss.epri.com/PctStdDev.html

(Getter)
"""
function PctStdDev(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_PctStdDev(dss.ctx)
end
PctStdDev() = PctStdDev(DSS_DEFAULT_CTX)

"""
Percent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load.

Original COM help: https://opendss.epri.com/PctStdDev.html

(Setter)
"""
function PctStdDev(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_PctStdDev(dss.ctx, Value)
end
PctStdDev(Value::Float64) = PctStdDev(DSS_DEFAULT_CTX, Value)

"""
Relative Weighting factor for the active load.

This value is used in reliability methods.

(Getter)
"""
function RelWeighting(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_RelWeight(dss.ctx)
end
RelWeighting() = RelWeighting(DSS_DEFAULT_CTX)

"""
Relative Weighting factor for the active load.

This value is used in reliability methods.

Original COM help: https://opendss.epri.com/RelWeight.html

(Setter)
"""
function RelWeighting(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_RelWeight(dss.ctx, Value)
end
RelWeighting(Value::Float64) = RelWeighting(DSS_DEFAULT_CTX, Value)

"""
Neutral resistance for wye-connected loads.

Original COM help: https://opendss.epri.com/Rneut.html

(Getter)
"""
function Rneut(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Rneut(dss.ctx)
end
Rneut() = Rneut(DSS_DEFAULT_CTX)

"""
Neutral resistance for wye-connected loads.

Original COM help: https://opendss.epri.com/Rneut.html

(Setter)
"""
function Rneut(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Rneut(dss.ctx, Value)
end
Rneut(Value::Float64) = Rneut(DSS_DEFAULT_CTX, Value)

"""
Name of harmonic current spectrum shape.

Original COM help: https://opendss.epri.com/Spectrum.html

(Getter)
"""
function Spectrum(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_Spectrum(dss.ctx))
end
Spectrum() = Spectrum(DSS_DEFAULT_CTX)

"""
Name of harmonic current spectrum shape.

Original COM help: https://opendss.epri.com/Spectrum.html

(Setter)
"""
function Spectrum(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_Spectrum(dss.ctx, Cstring(pointer(Value)))
end
Spectrum(Value::String) = Spectrum(DSS_DEFAULT_CTX, Value)

"""
Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all).

Original COM help: https://opendss.epri.com/Status.html

(Getter)
"""
function Status(dss::DSSContext)::Lib.LoadStatus
    return @checked Lib.Loads_Get_Status(dss.ctx)
end
Status() = Status(DSS_DEFAULT_CTX)

"""
Response to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all).

Original COM help: https://opendss.epri.com/Status.html

(Setter)
"""
function Status(dss::DSSContext, Value::Union{Int,Lib.LoadStatus})
    Value = convert(Lib.LoadStatus, Value)
    @checked Lib.Loads_Set_Status(dss.ctx, Value)
end
Status(Value::Union{Int,Lib.LoadStatus}) = Status(DSS_DEFAULT_CTX, Value)

"""
Maximum per-unit voltage to use the load model. Above this, constant Z applies.

Original COM help: https://opendss.epri.com/Vmaxpu1.html

(Getter)
"""
function Vmaxpu(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Vmaxpu(dss.ctx)
end
Vmaxpu() = Vmaxpu(DSS_DEFAULT_CTX)

"""
Maximum per-unit voltage to use the load model. Above this, constant Z applies.

Original COM help: https://opendss.epri.com/Vmaxpu1.html

(Setter)
"""
function Vmaxpu(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Vmaxpu(dss.ctx, Value)
end
Vmaxpu(Value::Float64) = Vmaxpu(DSS_DEFAULT_CTX, Value)

"""
Minimum voltage for unserved energy (UE) evaluation.

Original COM help: https://opendss.epri.com/Vminemerg.html

(Getter)
"""
function VminEmerg(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Vminemerg(dss.ctx)
end
VminEmerg() = VminEmerg(DSS_DEFAULT_CTX)

"""
Minimum voltage for unserved energy (UE) evaluation.

Original COM help: https://opendss.epri.com/Vminemerg.html

(Setter)
"""
function VminEmerg(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Vminemerg(dss.ctx, Value)
end
VminEmerg(Value::Float64) = VminEmerg(DSS_DEFAULT_CTX, Value)

"""
Minimum voltage for energy exceeding normal (EEN) evaluations.

Original COM help: https://opendss.epri.com/Vminnorm.html

(Getter)
"""
function VminNorm(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Vminnorm(dss.ctx)
end
VminNorm() = VminNorm(DSS_DEFAULT_CTX)

"""
Minimum voltage for energy exceeding normal (EEN) evaluations.

Original COM help: https://opendss.epri.com/Vminnorm.html

(Setter)
"""
function VminNorm(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Vminnorm(dss.ctx, Value)
end
VminNorm(Value::Float64) = VminNorm(DSS_DEFAULT_CTX, Value)

"""
Minimum voltage to apply the load model. Below this, constant Z is used.

Original COM help: https://opendss.epri.com/Vminpu1.html

(Getter)
"""
function Vminpu(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Vminpu(dss.ctx)
end
Vminpu() = Vminpu(DSS_DEFAULT_CTX)

"""
Minimum voltage to apply the load model. Below this, constant Z is used.

Original COM help: https://opendss.epri.com/Vminpu1.html

(Setter)
"""
function Vminpu(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Vminpu(dss.ctx, Value)
end
Vminpu(Value::Float64) = Vminpu(DSS_DEFAULT_CTX, Value)

"""
Neutral reactance for wye-connected loads.

Original COM help: https://opendss.epri.com/Xneut.html

(Getter)
"""
function Xneut(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_Xneut(dss.ctx)
end
Xneut() = Xneut(DSS_DEFAULT_CTX)

"""
Neutral reactance for wye-connected loads.

Original COM help: https://opendss.epri.com/Xneut.html

(Setter)
"""
function Xneut(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_Xneut(dss.ctx, Value)
end
Xneut(Value::Float64) = Xneut(DSS_DEFAULT_CTX, Value)

"""
Name of yearly duration loadshape

Original COM help: https://opendss.epri.com/Yearly.html

(Getter)
"""
function Yearly(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_Yearly(dss.ctx))
end
Yearly() = Yearly(DSS_DEFAULT_CTX)

"""
Name of yearly duration loadshape

Original COM help: https://opendss.epri.com/Yearly.html

(Setter)
"""
function Yearly(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_Yearly(dss.ctx, Cstring(pointer(Value)))
end
Yearly(Value::String) = Yearly(DSS_DEFAULT_CTX, Value)

"""
Array of 7 doubles with values for ZIPV property of the load object

Original COM help: https://opendss.epri.com/ZIPV.html

(Getter)
"""
function ZipV(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Loads_Get_ZIPV, dss.ctx)
end
ZipV() = ZipV(DSS_DEFAULT_CTX)

"""
Array of 7 doubles with values for ZIPV property of the load object

Original COM help: https://opendss.epri.com/ZIPV.html

(Setter)
"""
function ZipV(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Loads_Set_ZIPV(dss.ctx, ValuePtr, ValueCount)
end
ZipV(Value::Vector{Float64}) = ZipV(DSS_DEFAULT_CTX, Value)

"""
Name of the loadshape for a daily load profile.

Original COM help: https://opendss.epri.com/daily.html

(Getter)
"""
function Daily(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_daily(dss.ctx))
end
Daily() = Daily(DSS_DEFAULT_CTX)

"""
Name of the loadshape for a daily load profile.

Original COM help: https://opendss.epri.com/daily.html

(Setter)
"""
function Daily(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_daily(dss.ctx, Cstring(pointer(Value)))
end
Daily(Value::String) = Daily(DSS_DEFAULT_CTX, Value)

"""
Name of the loadshape for a duty cycle simulation.

Original COM help: https://opendss.epri.com/duty.html

(Getter)
"""
function Duty(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_duty(dss.ctx))
end
Duty() = Duty(DSS_DEFAULT_CTX)

"""
Name of the loadshape for a duty cycle simulation.

Original COM help: https://opendss.epri.com/duty.html

(Setter)
"""
function Duty(dss::DSSContext, Value::String)
    @checked Lib.Loads_Set_duty(dss.ctx, Cstring(pointer(Value)))
end
Duty(Value::String) = Duty(DSS_DEFAULT_CTX, Value)

"""
kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals.

Original COM help: https://opendss.epri.com/kV2.html

(Getter)
"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""
kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals.

Original COM help: https://opendss.epri.com/kV2.html

(Setter)
"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""
Set kW for active Load. Updates kvar based on present PF.

Original COM help: https://opendss.epri.com/kW1.html

(Getter)
"""
function kW(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_kW(dss.ctx)
end
kW() = kW(DSS_DEFAULT_CTX)

"""
Set kW for active Load. Updates kvar based on present PF.

Original COM help: https://opendss.epri.com/kW1.html

(Setter)
"""
function kW(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_kW(dss.ctx, Value)
end
kW(Value::Float64) = kW(DSS_DEFAULT_CTX, Value)

"""
Base load kVA. 

Also defined kW and kvar or PF input, or load allocation by kWh or XFkVA.

Original COM help: https://opendss.epri.com/kva.html

(Getter)
"""
function kVABase(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_kva(dss.ctx)
end
kVABase() = kVABase(DSS_DEFAULT_CTX)

"""
Base load kVA. 

Also defined kW and kvar or PF input, or load allocation by kWh or XFkVA.

Original COM help: https://opendss.epri.com/kva.html

(Setter)
"""
function kVABase(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_kva(dss.ctx, Value)
end
kVABase(Value::Float64) = kVABase(DSS_DEFAULT_CTX, Value)

"""
Reactive power in kvar for active Load. If set, updates PF based on present kW.

Original COM help: https://opendss.epri.com/kvar1.html

(Getter)
"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""
Reactive power in kvar for active Load. If set, updates PF based on present kW.

Original COM help: https://opendss.epri.com/kvar1.html

(Setter)
"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""
kWh billed for this period. Can be used with Cfactor for load allocation.

Original COM help: https://opendss.epri.com/kwh.html

(Getter)
"""
function kWh(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_kwh(dss.ctx)
end
kWh() = kWh(DSS_DEFAULT_CTX)

"""
kWh billed for this period. Can be used with Cfactor for load allocation.

Original COM help: https://opendss.epri.com/kwh.html

(Setter)
"""
function kWh(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_kwh(dss.ctx, Value)
end
kWh(Value::Float64) = kWh(DSS_DEFAULT_CTX, Value)

"""
Length of kWh billing period for average demand calculation. Default 30.

Original COM help: https://opendss.epri.com/kwhdays.html

(Getter)
"""
function kWhDays(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_kwhdays(dss.ctx)
end
kWhDays() = kWhDays(DSS_DEFAULT_CTX)

"""
Length of kWh billing period for average demand calculation. Default 30.

Original COM help: https://opendss.epri.com/kwhdays.html

(Setter)
"""
function kWhDays(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_kwhdays(dss.ctx, Value)
end
kWhDays(Value::Float64) = kWhDays(DSS_DEFAULT_CTX, Value)

"""
PU of Load that is modeled as series R-L for harmonics studies

*Deprecated: used `PctSeriesRL` instead*

(Getter)
"""
function puSeriesRL(dss::DSSContext)::Float64
    return (@checked Lib.Loads_Get_pctSeriesRL(dss.ctx)) / 100
end
puSeriesRL() = puSeriesRL(DSS_DEFAULT_CTX)

"""
PU of Load that is modeled as series R-L for harmonics studies 

*Deprecated: used `PctSeriesRL` instead*

(Setter)
"""
function puSeriesRL(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_pctSeriesRL(dss.ctx, Value * 100)
end
puSeriesRL(Value::Float64) = puSeriesRL(DSS_DEFAULT_CTX, Value)

"""
Percent of Load that is modeled as series R-L for harmonics studies

(Getter)
"""
function PctSeriesRL(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_pctSeriesRL(dss.ctx)
end
PctSeriesRL() = PctSeriesRL(DSS_DEFAULT_CTX)

"""
Percent of Load that is modeled as series R-L for harmonics studies 

(Setter)
"""
function PctSeriesRL(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_pctSeriesRL(dss.ctx, Value)
end
PctSeriesRL(Value::Float64) = PctSeriesRL(DSS_DEFAULT_CTX, Value)

@deprecate puSeriesRL PctSeriesRL

"""
Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf.

Original COM help: https://opendss.epri.com/xfkVA.html

(Getter)
"""
function XfkVA(dss::DSSContext)::Float64
    return @checked Lib.Loads_Get_xfkVA(dss.ctx)
end
XfkVA() = XfkVA(DSS_DEFAULT_CTX)

"""
Rated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf.

Original COM help: https://opendss.epri.com/xfkVA.html

(Setter)
"""
function XfkVA(dss::DSSContext, Value::Float64)
    @checked Lib.Loads_Set_xfkVA(dss.ctx, Value)
end
XfkVA(Value::Float64) = XfkVA(DSS_DEFAULT_CTX, Value)

"""
Number of phases

**(API Extension)**

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.Loads_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of phases

**(API Extension)**

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    @checked Lib.Loads_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
Name of the sensor monitoring this load.

Original COM help: https://opendss.epri.com/Sensor.html
"""
function Sensor(dss::DSSContext)::String
    return get_string(@checked Lib.Loads_Get_Sensor(dss.ctx))
end
Sensor() = Sensor(DSS_DEFAULT_CTX)

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
    :PctSeriesRL,
    :XfkVA,
    :Phases,
    :Sensor
]

end
