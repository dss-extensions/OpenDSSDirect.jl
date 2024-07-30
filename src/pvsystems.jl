module PVsystems

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Variant array of strings with all PVSystem names"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.PVSystems_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of PVSystems"""
function Count(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Set first PVSystem active; returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Present value of the Irradiance property in kW/m² (Getter)"""
function Irradiance(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_Irradiance(dss.ctx)
end
Irradiance() = Irradiance(DSS_DEFAULT_CTX)

"""Present value of the Irradiance property in kW/m² (Setter)"""
function Irradiance(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_Irradiance(dss.ctx, Value)
end
Irradiance(Value::Float64) = Irradiance(DSS_DEFAULT_CTX, Value)

"""Returns the current irradiance value for the active PVSystem. Use it to know what's the current irradiance value for the PV during a simulation."""
function IrradianceNow(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_IrradianceNow(dss.ctx)
end
IrradianceNow() = IrradianceNow(DSS_DEFAULT_CTX)

"""Gets the name of the active PVSystem element."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets the active PVSystem element by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets next PVSystem active; returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Power factor (Getter)"""
function pf(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_PF(dss.ctx)
end
pf() = pf(DSS_DEFAULT_CTX)

"""Power factor (Setter)"""
function pf(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_PF(dss.ctx, Value)
end
pf(Value::Float64) = pf(DSS_DEFAULT_CTX, Value)

"""Array of PVSYSTEM energy meter register names"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.PVSystems_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""Array of doubles containing values in PVSystem registers."""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.PVSystems_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

"""Active PVSystem by index;  1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Active PVSystem by index;  1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.PVSystems_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Rated kVA of the PVSystem (Getter)"""
function kVARated(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_kVArated(dss.ctx)
end
kVARated() = kVARated(DSS_DEFAULT_CTX)

"""Rated kVA of the PVSystem (Setter)"""
function kVARated(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_kVArated(dss.ctx, Value)
end
kVARated(Value::Float64) = kVARated(DSS_DEFAULT_CTX, Value)

"""Get kW output"""
function kW(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_kW(dss.ctx)
end
kW() = kW(DSS_DEFAULT_CTX)

"""kvar value (Getter)"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""kvar value (Setter)"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""Pmpp value (Getter)"""
function Pmpp(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_Pmpp(dss.ctx)
end
Pmpp() = Pmpp(DSS_DEFAULT_CTX)

"""Pmpp value (Setter)"""
function Pmpp(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_Pmpp(dss.ctx, Value)
end
Pmpp(Value::Float64) = Pmpp(DSS_DEFAULT_CTX, Value)

"""Name of the loadshape for a daily load profile. (Getter)"""
function Daily(dss::DSSContext)::String
    return get_string(Lib.PVSystems_Get_daily(dss.ctx))
end
Daily() = Daily(DSS_DEFAULT_CTX)

"""Name of the loadshape for a daily load profile. (Setter)"""
function Daily(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_daily(dss.ctx, Cstring(pointer(Value)))
end
Daily(Value::String) = Daily(DSS_DEFAULT_CTX, Value)

"""Name of the loadshape for a duty cycle simulation. (Getter)"""
function Duty(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_duty(dss.ctx))
end
Duty() = Duty(DSS_DEFAULT_CTX)

"""Name of the loadshape for a duty cycle simulation. (Setter)"""
function Duty(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_duty(dss.ctx, Cstring(pointer(Value)))
end
Duty(Value::String) = Duty(DSS_DEFAULT_CTX, Value)

"""Name of yearly duration loadshape (Getter)"""
function Yearly(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Yearly(dss.ctx))
end
Yearly() = Yearly(DSS_DEFAULT_CTX)

"""Name of yearly duration loadshape (Setter)"""
function Yearly(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Yearly(dss.ctx, Cstring(pointer(Value)))
end
Yearly(Value::String) = Yearly(DSS_DEFAULT_CTX, Value)

"""Name of the temperature shape to use for daily simulations. (Getter)"""
function TDaily(dss::DSSContext)::String
    return get_string(Lib.PVSystems_Get_Tdaily(dss.ctx))
end
TDaily() = TDaily(DSS_DEFAULT_CTX)

"""Name of the temperature shape to use for daily simulations. (Setter)"""
function TDaily(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Tdaily(dss.ctx, Cstring(pointer(Value)))
end
TDaily(Value::String) = TDaily(DSS_DEFAULT_CTX, Value)

"""Name of the temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. (Getter)"""
function TDuty(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Tduty(dss.ctx))
end
TDuty() = TDuty(DSS_DEFAULT_CTX)

"""Name of the emperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. (Setter)"""
function TDuty(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Tduty(dss.ctx, Cstring(pointer(Value)))
end
TDuty(Value::String) = TDuty(DSS_DEFAULT_CTX, Value)

"""Name of the temperature shape to use for yearly simulations. (Getter)"""
function TYearly(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Tyearly(dss.ctx))
end
TYearly() = TYearly(DSS_DEFAULT_CTX)

"""Name of the temperature shape to use for yearly simulations. (Setter)"""
function TYearly(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Tyearly(dss.ctx, Cstring(pointer(Value)))
end
TYearly(Value::String) = TYearly(DSS_DEFAULT_CTX, Value)

"""Dispatch shape to use for yearly simulations. Must be previously defined
as a Loadshape object. If this is not specified, the Daily dispatch shape,
if any, is repeated during Yearly solution modes. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.
(Getter)"""
function yearly(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_yearly(dss.ctx))
end
yearly() = yearly(DSS_DEFAULT_CTX)

"""Dispatch shape to use for yearly simulations. Must be previously defined
as a Loadshape object. If this is not specified, the Daily dispatch shape,
if any, is repeated during Yearly solution modes. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.
(Setter)"""
function yearly(dss::DSSContext, Value::String)
    return @checked Lib.PVSystems_Set_yearly(dss.ctx, Cstring(pointer(Value)))
end
yearly(Value::String) = yearly(DSS_DEFAULT_CTX, Value)

"""Name of the sensor monitoring this PVSystem element."""
function Sensor(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Sensor(dss.ctx))
end
Sensor() = Sensor(DSS_DEFAULT_CTX)

end
