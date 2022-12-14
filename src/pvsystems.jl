module PVsystems

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Variant array of strings with all PVSystem names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.PVSystems_Get_AllNames, C_NULL_CTX)
end

"""Number of PVSystems"""
function Count()::Int
    return @checked Lib.PVSystems_Get_Count(C_NULL_CTX)
end

"""Set first PVSystem active; returns 0 if none."""
function First()::Int
    return @checked Lib.PVSystems_Get_First(C_NULL_CTX)
end

"""Present value of the Irradiance property in kW/m² (Getter)"""
function Irradiance()::Float64
    return @checked Lib.PVSystems_Get_Irradiance(C_NULL_CTX)
end

"""Present value of the Irradiance property in kW/m² (Setter)"""
function Irradiance(Value::Float64)
    @checked Lib.PVSystems_Set_Irradiance(C_NULL_CTX, Value)
end

"""Returns the current irradiance value for the active PVSystem. Use it to know what's the current irradiance value for the PV during a simulation."""
function IrradianceNow()::Float64
    return @checked Lib.PVSystems_Get_IrradianceNow(C_NULL_CTX)
end

"""Name of the active PVSystem (Getter)"""
function Name()::String
    return get_string(@checked Lib.PVSystems_Get_Name(C_NULL_CTX))
end

"""Name of the active PVSystem (Setter)"""
function Name(Value::String)
    @checked Lib.PVSystems_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Sets next PVSystem active; returns 0 if no more."""
function Next()::Int
    return @checked Lib.PVSystems_Get_Next(C_NULL_CTX)
end

"""Power factor (Getter)"""
function pf()::Float64
    return @checked Lib.PVSystems_Get_PF(C_NULL_CTX)
end

"""Power factor (Setter)"""
function pf(Value::Float64)
    @checked Lib.PVSystems_Set_PF(C_NULL_CTX, Value)
end

"""Array of PVSYSTEM energy meter register names"""
function RegisterNames()::Vector{String}
    return get_string_array(Lib.PVSystems_Get_RegisterNames, C_NULL_CTX)
end

"""Array of doubles containing values in PVSystem registers."""
function RegisterValues()::Vector{Float64}
    return get_float64_array(Lib.PVSystems_Get_RegisterValues, C_NULL_CTX)
end

"""Active PVSystem by index;  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.PVSystems_Get_idx(C_NULL_CTX)
end

"""Active PVSystem by index;  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.PVSystems_Set_idx(C_NULL_CTX, Value)
end

"""Rated kVA of the PVSystem (Getter)"""
function kVARated()::Float64
    return @checked Lib.PVSystems_Get_kVArated(C_NULL_CTX)
end

"""Rated kVA of the PVSystem (Setter)"""
function kVARated(Value::Float64)
    @checked Lib.PVSystems_Set_kVArated(C_NULL_CTX, Value)
end

"""Get kW output"""
function kW()::Float64
    return @checked Lib.PVSystems_Get_kW(C_NULL_CTX)
end

"""kvar value (Getter)"""
function kvar()::Float64
    return @checked Lib.PVSystems_Get_kvar(C_NULL_CTX)
end

"""kvar value (Setter)"""
function kvar(Value::Float64)
    @checked Lib.PVSystems_Set_kvar(C_NULL_CTX, Value)
end

"""Pmpp value (Getter)"""
function Pmpp()::Float64
    return @checked Lib.PVSystems_Get_Pmpp(C_NULL_CTX)
end

"""Pmpp value (Setter)"""
function Pmpp(Value::Float64)
    @checked Lib.PVSystems_Set_Pmpp(C_NULL_CTX, Value)
end

"""Name of the loadshape for a daily load profile. (Getter)"""
function Daily()::String
    return get_string(Lib.PVSystems_Get_daily(C_NULL_CTX))
end

"""Name of the loadshape for a daily load profile. (Setter)"""
function Daily(Value::String)
    @checked Lib.PVSystems_Set_daily(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of the loadshape for a duty cycle simulation. (Getter)"""
function Duty()::String
    return get_string(@checked Lib.PVSystems_Get_duty(C_NULL_CTX))
end

"""Name of the loadshape for a duty cycle simulation. (Setter)"""
function Duty(Value::String)
    @checked Lib.PVSystems_Set_duty(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of yearly duration loadshape (Getter)"""
function Yearly()::String
    return get_string(@checked Lib.PVSystems_Get_Yearly(C_NULL_CTX))
end

"""Name of yearly duration loadshape (Setter)"""
function Yearly(Value::String)
    @checked Lib.PVSystems_Set_Yearly(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of the temperature shape to use for daily simulations. (Getter)"""
function TDaily()::String
    return get_string(Lib.PVSystems_Get_Tdaily(C_NULL_CTX))
end

"""Name of the temperature shape to use for daily simulations. (Setter)"""
function TDaily(Value::String)
    @checked Lib.PVSystems_Set_Tdaily(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of the temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. (Getter)"""
function TDuty()::String
    return get_string(@checked Lib.PVSystems_Get_Tduty(C_NULL_CTX))
end

"""Name of the emperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. (Setter)"""
function TDuty(Value::String)
    @checked Lib.PVSystems_Set_Tduty(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of the temperature shape to use for yearly simulations. (Getter)"""
function TYearly()::String
    return get_string(@checked Lib.PVSystems_Get_Tyearly(C_NULL_CTX))
end

"""Name of the temperature shape to use for yearly simulations. (Setter)"""
function TYearly(Value::String)
    @checked Lib.PVSystems_Set_Tyearly(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Dispatch shape to use for yearly simulations. Must be previously defined
as a Loadshape object. If this is not specified, the Daily dispatch shape,
if any, is repeated during Yearly solution modes. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.
(Getter)"""
function yearly()::String
    return get_string(@checked Lib.PVSystems_Get_yearly(C_NULL_CTX))
end

"""Dispatch shape to use for yearly simulations. Must be previously defined
as a Loadshape object. If this is not specified, the Daily dispatch shape,
if any, is repeated during Yearly solution modes. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.
(Setter)"""
function yearly(Value::String)
    return @checked Lib.PVSystems_Set_yearly(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of the sensor monitoring this PVSystem element."""
function Sensor()::String
    return get_string(@checked Lib.PVSystems_Get_Sensor(C_NULL_CTX))
end

end
