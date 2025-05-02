module PVsystems

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all PVSystem objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.PVSystems_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active PVSystem object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a PVSystem object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of PVSystem Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first PVSystem to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next PVSystem to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active PVSystem (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.PVSystems_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate PVSystem by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.PVSystems_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Get/set the present value of the Irradiance property in kW/m²

Original COM help: https://opendss.epri.com/Irradiance.html

(Getter)
"""
function Irradiance(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_Irradiance(dss.ctx)
end
Irradiance() = Irradiance(DSS_DEFAULT_CTX)

"""
Get/set the present value of the Irradiance property in kW/m²

Original COM help: https://opendss.epri.com/Irradiance.html

(Setter)
"""
function Irradiance(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_Irradiance(dss.ctx, Value)
end
Irradiance(Value::Float64) = Irradiance(DSS_DEFAULT_CTX, Value)

"""
Returns the current irradiance value for the active PVSystem. Use it to
know what's the current irradiance value for the PV during a simulation.

Original COM help: https://opendss.epri.com/IrradianceNow.html
"""
function IrradianceNow(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_IrradianceNow(dss.ctx)
end
IrradianceNow() = IrradianceNow(DSS_DEFAULT_CTX)

"""
Get/set the power factor for the active PVSystem

Original COM help: https://opendss.epri.com/PF2.html

(Getter)
"""
function pf(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_PF(dss.ctx)
end
pf() = pf(DSS_DEFAULT_CTX)

"""
Get/set the power factor for the active PVSystem

Original COM help: https://opendss.epri.com/PF2.html

(Setter)
"""
function pf(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_PF(dss.ctx, Value)
end
pf(Value::Float64) = pf(DSS_DEFAULT_CTX, Value)

"""
Array of PVSystem energy meter register names

See also the enum `GeneratorRegisters`.

Original COM help: https://opendss.epri.com/RegisterNames2.html
"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.PVSystems_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""
Array of doubles containing values in PVSystem registers.

Original COM help: https://opendss.epri.com/RegisterValues2.html
"""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.PVSystems_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

"""
Get/set Rated kVA of the PVSystem

Original COM help: https://opendss.epri.com/kVArated1.html

(Getter)
"""
function kVARated(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_kVArated(dss.ctx)
end
kVARated() = kVARated(DSS_DEFAULT_CTX)

"""
Get/set Rated kVA of the PVSystem

Original COM help: https://opendss.epri.com/kVArated1.html

(Setter)
"""
function kVARated(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_kVArated(dss.ctx, Value)
end
kVARated(Value::Float64) = kVARated(DSS_DEFAULT_CTX, Value)

"""
Get kW output

Original COM help: https://opendss.epri.com/kW2.html
"""
function kW(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_kW(dss.ctx)
end
kW() = kW(DSS_DEFAULT_CTX)

"""
Get/set kvar output value

Original COM help: https://opendss.epri.com/kvar2.html

(Getter)
"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""
Get/set kvar output value

Original COM help: https://opendss.epri.com/kvar2.html

(Setter)
"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""
Gets/sets the rated max power of the PV array for 1.0 kW/m² irradiance
and a user-selected array temperature of the active PVSystem.

Original COM help: https://opendss.epri.com/Pmpp.html

(Getter)
"""
function Pmpp(dss::DSSContext)::Float64
    return @checked Lib.PVSystems_Get_Pmpp(dss.ctx)
end
Pmpp() = Pmpp(DSS_DEFAULT_CTX)

"""
Gets/sets the rated max power of the PV array for 1.0 kW/m² irradiance
and a user-selected array temperature of the active PVSystem.

Original COM help: https://opendss.epri.com/Pmpp.html

(Setter)
"""
function Pmpp(dss::DSSContext, Value::Float64)
    @checked Lib.PVSystems_Set_Pmpp(dss.ctx, Value)
end
Pmpp(Value::Float64) = Pmpp(DSS_DEFAULT_CTX, Value)

"""
Name of the dispatch shape to use for daily simulations. Must be previously
defined as a Loadshape object of 24 hrs, typically. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.

**(API Extension)**

(Getter)
"""
function Daily(dss::DSSContext)::String
    return get_string(Lib.PVSystems_Get_daily(dss.ctx))
end
Daily() = Daily(DSS_DEFAULT_CTX)

"""
Name of the dispatch shape to use for daily simulations. Must be previously
defined as a Loadshape object of 24 hrs, typically. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.

**(API Extension)**

(Setter)
"""
function Daily(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_daily(dss.ctx, Cstring(pointer(Value)))
end
Daily(Value::String) = Daily(DSS_DEFAULT_CTX, Value)

"""
Name of the load shape to use for duty cycle dispatch simulations such as
for solar ramp rate studies. Must be previously defined as a Loadshape
object. Typically would have time intervals of 1-5 seconds.

**(API Extension)**

(Getter)
"""
function Duty(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_duty(dss.ctx))
end
Duty() = Duty(DSS_DEFAULT_CTX)

"""
Name of the load shape to use for duty cycle dispatch simulations such as
for solar ramp rate studies. Must be previously defined as a Loadshape
object. Typically would have time intervals of 1-5 seconds.

**(API Extension)**

(Setter)
"""
function Duty(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_duty(dss.ctx, Cstring(pointer(Value)))
end
Duty(Value::String) = Duty(DSS_DEFAULT_CTX, Value)

"""
Dispatch shape to use for yearly simulations. Must be previously defined
as a Loadshape object. If this is not specified, the Daily dispatch shape,
if any, is repeated during Yearly solution modes. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.

**(API Extension)**

(Getter)
"""
function Yearly(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_yearly(dss.ctx))
end
Yearly() = Yearly(DSS_DEFAULT_CTX)

"""
Dispatch shape to use for yearly simulations. Must be previously defined
as a Loadshape object. If this is not specified, the Daily dispatch shape,
if any, is repeated during Yearly solution modes. In the default dispatch
mode, the PVSystem element uses this loadshape to trigger State changes.

**(API Extension)**

(Setter)
"""
function Yearly(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_yearly(dss.ctx, Cstring(pointer(Value)))
end
Yearly(Value::String) = Yearly(DSS_DEFAULT_CTX, Value)

"""
Temperature shape to use for daily simulations. Must be previously defined
as a TShape object of 24 hrs, typically. The PVSystem element uses this
TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree
with the Pmpp vs T curve.

**(API Extension)**

(Getter)
"""
function TDaily(dss::DSSContext)::String
    return get_string(Lib.PVSystems_Get_Tdaily(dss.ctx))
end
TDaily() = TDaily(DSS_DEFAULT_CTX)

"""
Temperature shape to use for daily simulations. Must be previously defined
as a TShape object of 24 hrs, typically. The PVSystem element uses this
TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree
with the Pmpp vs T curve.

**(API Extension)**

(Setter)
"""
function TDaily(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Tdaily(dss.ctx, Cstring(pointer(Value)))
end
TDaily(Value::String) = TDaily(DSS_DEFAULT_CTX, Value)

"""
Temperature shape to use for duty cycle dispatch simulations such as for
solar ramp rate studies. Must be previously defined as a TShape object.
Typically would have time intervals of 1-5 seconds. Designate the number
of points to solve using the Set Number=xxxx command. If there are fewer
points in the actual shape, the shape is assumed to repeat. The PVSystem
model uses this TShape to determine the Pmpp from the Pmpp vs T curve.
Units must agree with the Pmpp vs T curve.

**(API Extension)**

(Getter)
"""
function TDuty(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Tduty(dss.ctx))
end
TDuty() = TDuty(DSS_DEFAULT_CTX)

"""
Temperature shape to use for duty cycle dispatch simulations such as for
solar ramp rate studies. Must be previously defined as a TShape object.
Typically would have time intervals of 1-5 seconds. Designate the number
of points to solve using the Set Number=xxxx command. If there are fewer
points in the actual shape, the shape is assumed to repeat. The PVSystem
model uses this TShape to determine the Pmpp from the Pmpp vs T curve.
Units must agree with the Pmpp vs T curve.

**(API Extension)**

(Setter)
"""
function TDuty(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Tduty(dss.ctx, Cstring(pointer(Value)))
end
TDuty(Value::String) = TDuty(DSS_DEFAULT_CTX, Value)

"""
Temperature shape to use for yearly simulations. Must be previously defined
as a TShape object. If this is not specified, the Daily dispatch shape, if
any, is repeated during Yearly solution modes. The PVSystem element uses
this TShape to determine the Pmpp from the Pmpp vs T curve. Units must
agree with the Pmpp vs T curve.

**(API Extension)**

(Getter)
"""
function TYearly(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Tyearly(dss.ctx))
end
TYearly() = TYearly(DSS_DEFAULT_CTX)

"""
Temperature shape to use for yearly simulations. Must be previously defined
as a TShape object. If this is not specified, the Daily dispatch shape, if
any, is repeated during Yearly solution modes. The PVSystem element uses
this TShape to determine the Pmpp from the Pmpp vs T curve. Units must
agree with the Pmpp vs T curve.

**(API Extension)**

(Setter)
"""
function TYearly(dss::DSSContext, Value::String)
    @checked Lib.PVSystems_Set_Tyearly(dss.ctx, Cstring(pointer(Value)))
end
TYearly(Value::String) = TYearly(DSS_DEFAULT_CTX, Value)

"""
Name of the sensor monitoring this element.

Original COM help: https://opendss.epri.com/Sensor1.html
"""
function Sensor(dss::DSSContext)::String
    return get_string(@checked Lib.PVSystems_Get_Sensor(dss.ctx))
end
Sensor() = Sensor(DSS_DEFAULT_CTX)

end
