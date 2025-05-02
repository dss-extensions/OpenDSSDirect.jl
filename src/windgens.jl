module WindGens

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all WindGen objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.WindGens_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active WindGen object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.WindGens_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a WindGen object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.WindGens_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of WindGen Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first WindGen to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next WindGen to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active WindGen (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate WindGen by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
KVA rating of the electrical machine in the WindGen.

(Getter)
"""
function kVA(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_kVA(dss.ctx)
end
kVA() = kVA(DSS_DEFAULT_CTX)

"""
KVA rating of the electrical machine in the WindGen.

(Setter)
"""
function kVA(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_kVA(dss.ctx, Value)
end
kVA(Value::Float64) = kVA(DSS_DEFAULT_CTX, Value)

"""
Name of the loadshape for a duty cycle simulation.

**(API Extension)**

(Getter)
"""
function duty(dss::DSSContext)::Float64
    return get_string(@checked Lib.WindGens_Get_duty(dss.ctx))
end
duty() = duty(DSS_DEFAULT_CTX)

"""
Name of the loadshape for a duty cycle simulation.

**(API Extension)**

(Setter)
"""
function duty(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_duty(dss.ctx, Cstring(pointer(Value)))
end
duty(Value::Float64) = duty(DSS_DEFAULT_CTX, Value)

"""
Air density in kg/m3

(Getter)
"""
function pd(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_pd(dss.ctx)
end
pd() = pd(DSS_DEFAULT_CTX)

"""
Air density in kg/m3

(Setter)
"""
function pd(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_pd(dss.ctx, Value)
end
pd(Value::Float64) = pd(DSS_DEFAULT_CTX, Value)

"""
Cut-out speed for the wind generator

(Getter)
"""
function VCutOut(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_VCutOut(dss.ctx)
end
VCutOut() = VCutOut(DSS_DEFAULT_CTX)

"""
Cut-out speed for the wind generator

(Setter)
"""
function VCutOut(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_VCutOut(dss.ctx, Value)
end
VCutOut(Value::Float64) = VCutOut(DSS_DEFAULT_CTX, Value)

"""
Wind speed in m/s

(Getter)
"""
function WindSpeed(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_WindSpeed(dss.ctx)
end
WindSpeed() = WindSpeed(DSS_DEFAULT_CTX)

"""
Wind speed in m/s

(Setter)
"""
function WindSpeed(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_WindSpeed(dss.ctx, Value)
end
WindSpeed(Value::Float64) = WindSpeed(DSS_DEFAULT_CTX, Value)

"""
Base kvar for the active WindGen.

(Getter)
"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""
Base kvar for the active WindGen.

(Setter)
"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""
Bus to which the WindGen is connected. May include specific node specification.

**(API Extension)**

(Getter)
"""
function Bus1(dss::DSSContext)::String
    return get_string(@checked Lib.WindGens_Get_Bus1(dss.ctx))
end
Bus1() = Bus1(DSS_DEFAULT_CTX)

"""
Bus to which the WindGen is connected. May include specific node specification.

**(API Extension)**

(Setter)
"""
function Bus1(dss::DSSContext, Value::String)
    @checked Lib.WindGens_Set_Bus1(dss.ctx, Cstring(pointer(Value)))
end
Bus1(Value::String) = Bus1(DSS_DEFAULT_CTX, Value)

"""
Steady state output reactive power.

(Getter)
"""
function QSS(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_QSS(dss.ctx)
end
QSS() = QSS(DSS_DEFAULT_CTX)

"""
Steady state output reactive power.

(Setter)
"""
function QSS(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_QSS(dss.ctx, Value)
end
QSS(Value::Float64) = QSS(DSS_DEFAULT_CTX, Value)

"""
Tip speed ratio

(Getter)
"""
function Lamda(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_Lamda(dss.ctx)
end
Lamda() = Lamda(DSS_DEFAULT_CTX)

"""
Tip speed ratio

(Setter)
"""
function Lamda(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_Lamda(dss.ctx, Value)
end
Lamda(Value::Float64) = Lamda(DSS_DEFAULT_CTX, Value)

"""
Nominal rated (1.0 per unit) voltage for the active WindGen, in kV.

(Getter)
"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""
Nominal rated (1.0 per unit) voltage for the active WindGen, in kV.

(Setter)
"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""
Total base kW for the active WindGen.

(Getter)
"""
function kW(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_kW(dss.ctx)
end
kW() = kW(DSS_DEFAULT_CTX)

"""
Total base kW for the active WindGen.

(Setter)
"""
function kW(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_kW(dss.ctx, Value)
end
kW(Value::Float64) = kW(DSS_DEFAULT_CTX, Value)

"""
Per unit Thevenin equivalent resistance (R).

(Getter)
"""
function RThev(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_RThev(dss.ctx)
end
RThev() = RThev(DSS_DEFAULT_CTX)

"""
Per unit Thevenin equivalent resistance (R).

(Setter)
"""
function RThev(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_RThev(dss.ctx, Value)
end
RThev(Value::Float64) = RThev(DSS_DEFAULT_CTX, Value)

"""
Cut-in speed for the wind generator

(Getter)
"""
function VCutIn(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_VCutIn(dss.ctx)
end
VCutIn() = VCutIn(DSS_DEFAULT_CTX)

"""
Cut-in speed for the wind generator

(Setter)
"""
function VCutIn(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_VCutIn(dss.ctx, Value)
end
VCutIn(Value::Float64) = VCutIn(DSS_DEFAULT_CTX, Value)

"""
Steady state voltage magnitude.

(Getter)
"""
function Vss(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_Vss(dss.ctx)
end
Vss() = Vss(DSS_DEFAULT_CTX)

"""
Steady state voltage magnitude.

(Setter)
"""
function Vss(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_Vss(dss.ctx, Value)
end
Vss(Value::Float64) = Vss(DSS_DEFAULT_CTX, Value)

"""
Steady state output real power.

(Getter)
"""
function PSS(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_PSS(dss.ctx)
end
PSS() = PSS(DSS_DEFAULT_CTX)

"""
Steady state output real power.

(Setter)
"""
function PSS(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_PSS(dss.ctx, Value)
end
PSS(Value::Float64) = PSS(DSS_DEFAULT_CTX, Value)

"""
Per unit Thevenin equivalent reactance (X).

(Getter)
"""
function XThev(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_XThev(dss.ctx)
end
XThev() = XThev(DSS_DEFAULT_CTX)

"""
Per unit Thevenin equivalent reactance (X).

(Setter)
"""
function XThev(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_XThev(dss.ctx, Value)
end
XThev(Value::Float64) = XThev(DSS_DEFAULT_CTX, Value)

"""
Number of WTG in aggregation

(Getter)
"""
function N_WTG(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_N_WTG(dss.ctx)
end
N_WTG() = N_WTG(DSS_DEFAULT_CTX)

"""
Number of WTG in aggregation

(Setter)
"""
function N_WTG(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_N_WTG(dss.ctx, Value)
end
N_WTG(Value::Int) = N_WTG(DSS_DEFAULT_CTX, Value)

"""
Gearbox ratio

(Getter)
"""
function Ag(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_Ag(dss.ctx)
end
Ag() = Ag(DSS_DEFAULT_CTX)

"""
Gearbox ratio

(Setter)
"""
function Ag(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_Ag(dss.ctx, Value)
end
Ag(Value::Float64) = Ag(DSS_DEFAULT_CTX, Value)

"""
WindGen connection. True/1 if delta connection, False/0 if wye.

**(API Extension)**

(Getter)
"""
function IsDelta(dss::DSSContext)::Bool
    return (@checked Lib.WindGens_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""
WindGen connection. True/1 if delta connection, False/0 if wye.

**(API Extension)**

(Setter)
"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked Lib.WindGens_Set_IsDelta(dss.ctx, Value)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""
Name of yearly loadshape

**(API Extension)**

(Getter)
"""
function Yearly(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_Yearly(dss.ctx)
end
Yearly() = Yearly(DSS_DEFAULT_CTX)

"""
Name of yearly loadshape

**(API Extension)**

(Setter)
"""
function Yearly(dss::DSSContext, Value::Float64)
    return @checked Lib.WindGens_Set_Yearly(dss.ctx, Value)
end
Yearly(Value::Float64) = Yearly(DSS_DEFAULT_CTX, Value)

"""
Number of phases

**(API Extension)**

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of phases

**(API Extension)**

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
An arbitrary integer number representing the class of WindGen so that WindGen values may be segregated by class.

**(API Extension)**

(Getter)
"""
function Class(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_Class_(dss.ctx)
end
Class() = Class(DSS_DEFAULT_CTX)

"""
An arbitrary integer number representing the class of WindGen so that WindGen values may be segregated by class.

**(API Extension)**

(Setter)
"""
function Class(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_Class_(dss.ctx, Value)
end
Class(Value::Int) = Class(DSS_DEFAULT_CTX, Value)

"""
WindGen power factor. Power factor (pos. = producing vars).

(Getter)
"""
function PF(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_PF(dss.ctx)
end
PF() = PF(DSS_DEFAULT_CTX)

"""
WindGen power factor. Power factor (pos. = producing vars).

(Setter)
"""
function PF(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_PF(dss.ctx, Value)
end
PF(Value::Float64) = PF(DSS_DEFAULT_CTX, Value)

"""
Non-zero values enable reactive power and voltage control in the dynamic model.

(Getter)
"""
function QFlag(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_QFlag(dss.ctx)
end
QFlag() = QFlag(DSS_DEFAULT_CTX)

"""
Non-zero values enable reactive power and voltage control in the dynamic model.

(Setter)
"""
function QFlag(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_QFlag(dss.ctx, Value)
end
QFlag(Value::Int) = QFlag(DSS_DEFAULT_CTX, Value)

"""
Name of the loadshape for daily wind speed

**(API Extension)**

(Getter)
"""
function daily(dss::DSSContext)::String
    return get_string(@checked Lib.WindGens_Get_daily(dss.ctx))
end
daily() = daily(DSS_DEFAULT_CTX)

"""
Name of the loadshape for daily wind speed

**(API Extension)**

(Setter)
"""
function daily(dss::DSSContext, Value::String)
    @checked Lib.WindGens_Set_daily(dss.ctx, Cstring(pointer(Value)))
end
daily(Value::String) = daily(DSS_DEFAULT_CTX, Value)

"""
Turbine performance coefficient.

(Getter)
"""
function Cp(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_Cp(dss.ctx)
end
Cp() = Cp(DSS_DEFAULT_CTX)

"""
Turbine performance coefficient.

(Setter)
"""
function Cp(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_Cp(dss.ctx, Value)
end
Cp(Value::Float64) = Cp(DSS_DEFAULT_CTX, Value)

"""
Q control mode (0:Q, 1:PF, 2:VV).

(Getter)
"""
function QMode(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_QMode(dss.ctx)
end
QMode() = QMode(DSS_DEFAULT_CTX)

"""
Q control mode (0:Q, 1:PF, 2:VV).

(Setter)
"""
function QMode(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_QMode(dss.ctx, Value)
end
QMode(Value::Int) = QMode(DSS_DEFAULT_CTX, Value)

"""
Number of pole pairs of the induction generator

(Getter)
"""
function NPoles(dss::DSSContext)::Int
    return @checked Lib.WindGens_Get_NPoles(dss.ctx)
end
NPoles() = NPoles(DSS_DEFAULT_CTX)

"""
Number of pole pairs of the induction generator

(Setter)
"""
function NPoles(dss::DSSContext, Value::Int)
    @checked Lib.WindGens_Set_NPoles(dss.ctx, Value)
end
NPoles(Value::Int) = NPoles(DSS_DEFAULT_CTX, Value)

"""
Rotor radius in meters

(Getter)
"""
function Rad(dss::DSSContext)::Float64
    return @checked Lib.WindGens_Get_Rad(dss.ctx)
end
Rad() = Rad(DSS_DEFAULT_CTX)

"""
Rotor radius in meters

(Setter)
"""
function Rad(dss::DSSContext, Value::Float64)
    @checked Lib.WindGens_Set_Rad(dss.ctx, Value)
end
Rad(Value::Float64) = Rad(DSS_DEFAULT_CTX, Value)

"""
Array of WindGen energy meter register names

See also the enum `GeneratorRegisters`.
"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.WindGens_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""Array of values in WindGen registers."""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.WindGens_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

end