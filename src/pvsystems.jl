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
    return get_string_array(Lib.PVSystems_Get_AllNames)
end

"""Number of PVSystems"""
function Count()::Int
    return @checked Lib.PVSystems_Get_Count()
end

"""Set first PVSystem active; returns 0 if none."""
function First()::Int
    return @checked Lib.PVSystems_Get_First()
end

"""Present value of the Irradiance property in W/sq-m (Getter)"""
function Irradiance()::Float64
    return @checked Lib.PVSystems_Get_Irradiance()
end

"""Present value of the Irradiance property in W/sq-m (Setter)"""
function Irradiance(Value::Float64)
    @checked Lib.PVSystems_Set_Irradiance(Value)
end

"""Returns the current irradiance value for the active PVSystem. Use it to know what's the current irradiance value for the PV during a simulation."""
function IrradianceNow()::Float64
    return @checked Lib.PVSystems_Get_IrradianceNow()
end

"""Name of the active PVSystem (Getter)"""
function Name()::String
    return get_string(@checked Lib.PVSystems_Get_Name())
end

"""Name of the active PVSystem (Setter)"""
function Name(Value::String)
    @checked Lib.PVSystems_Set_Name(Cstring(pointer(Value)))
end

"""Sets next PVSystem active; returns 0 if no more."""
function Next()::Int
    return @checked Lib.PVSystems_Get_Next()
end

"""Power factor (Getter)"""
function pf()::Float64
    return @checked Lib.PVSystems_Get_PF()
end

"""Power factor (Setter)"""
function pf(Value::Float64)
    @checked Lib.PVSystems_Set_PF(Value)
end

"""Array of PVSYSTEM energy meter register names"""
function RegisterNames()::Vector{String}
    return get_string_array(Lib.PVSystems_Get_RegisterNames)
end

"""Array of doubles containing values in PVSystem registers."""
function RegisterValues()::Vector{Float64}
    return get_float64_array(Lib.PVSystems_Get_RegisterValues)
end

"""Active PVSystem by index;  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.PVSystems_Get_idx()
end

"""Active PVSystem by index;  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.PVSystems_Set_idx(Value)
end

"""Rated kVA of the PVSystem (Getter)"""
function kVARated()::Float64
    return @checked Lib.PVSystems_Get_kVArated()
end

"""Rated kVA of the PVSystem (Setter)"""
function kVARated(Value::Float64)
    @checked Lib.PVSystems_Set_kVArated(Value)
end

"""Get kW output"""
function kW()::Float64
    return @checked Lib.PVSystems_Get_kW()
end

"""kvar value (Getter)"""
function kvar()::Float64
    return @checked Lib.PVSystems_Get_kvar()
end

"""kvar value (Setter)"""
function kvar(Value::Float64)
    @checked Lib.PVSystems_Set_kvar(Value)
end

"""Pmpp value (Getter)"""
function Pmpp()::Float64
    return @checked Lib.PVSystems_Get_Pmpp()
end

"""Pmpp value (Setter)"""
function Pmpp(Value::Float64)
    @checked Lib.PVSystems_Set_Pmpp(Value)
end

"""Name of the loadshape for a daily load profile. (Getter)"""
function Daily()::String
    return get_string(Lib.PVSystems_Get_daily())
end

"""Name of the loadshape for a daily load profile. (Setter)"""
function Daily(Value::String)
    @checked Lib.PVSystems_Set_daily(Cstring(pointer(Value)))
end

"""Name of the loadshape for a duty cycle simulation. (Getter)"""
function Duty()::String
    return get_string(@checked Lib.PVSystems_Get_duty())
end

"""Name of the loadshape for a duty cycle simulation. (Setter)"""
function Duty(Value::String)
    @checked Lib.PVSystems_Set_duty(Cstring(pointer(Value)))
end

"""Name of yearly duration loadshape (Getter)"""
function Yearly()::String
    return get_string(@checked Lib.PVSystems_Get_Yearly())
end

"""Name of yearly duration loadshape (Setter)"""
function Yearly(Value::String)
    @checked Lib.PVSystems_Set_Yearly(Cstring(pointer(Value)))
end

"""Name of the temperature shape to use for daily simulations. (Getter)"""
function TDaily()::String
    return get_string(Lib.PVSystems_Get_Tdaily())
end

"""Name of the temperature shape to use for daily simulations. (Setter)"""
function TDaily(Value::String)
    @checked Lib.PVSystems_Set_Tdaily(Cstring(pointer(Value)))
end

"""Name of the temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. (Getter)"""
function TDuty()::String
    return get_string(@checked Lib.PVSystems_Get_Tduty())
end

"""Name of the emperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. (Setter)"""
function TDuty(Value::String)
    @checked Lib.PVSystems_Set_Tduty(Cstring(pointer(Value)))
end

"""Name of the temperature shape to use for yearly simulations. (Getter)"""
function TYearly()::String
    return get_string(@checked Lib.PVSystems_Get_Tyearly())
end

"""Name of the temperature shape to use for yearly simulations. (Setter)"""
function TYearly(Value::String)
    @checked Lib.PVSystems_Set_Tyearly(Cstring(pointer(Value)))
end

end
