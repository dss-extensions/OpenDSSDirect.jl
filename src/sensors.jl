module Sensors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Sensors objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Sensors_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Sensors object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Sensors_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Sensors object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Sensors_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Sensors Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Sensors_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Sensors to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Sensors_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Sensors to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Sensors_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Sensors (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Sensors_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Sensors by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Sensors_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Reset"""
function Reset(dss::DSSContext)
    @checked dss_ccall(dss.capi.Sensors_Reset, dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""ResetAll"""
function ResetAll(dss::DSSContext)
    @checked dss_ccall(dss.capi.Sensors_ResetAll, dss.ctx)
end
ResetAll() = ResetAll(DSS_DEFAULT_CTX)

"""
Array of doubles for the line current measurements; don't use with kWS and kVARS.

Original COM help: https://opendss.epri.com/Currents2.html

(Getter)
"""
function Currents(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Sensors_Get_Currents, dss)
end
Currents() = Currents(DSS_DEFAULT_CTX)

"""
Array of doubles for the line current measurements; don't use with kWS and kVARS.

Original COM help: https://opendss.epri.com/Currents2.html

(Setter)
"""
function Currents(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Sensors_Set_Currents, dss.ctx, ValuePtr, ValueCount)
end
Currents(Value::Vector{Float64}) = Currents(DSS_DEFAULT_CTX, Value)

"""
True if measured voltages are line-line. Currents are always line currents.

Original COM help: https://opendss.epri.com/IsDelta2.html

(Getter)
"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Sensors_Get_IsDelta, dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""
True if measured voltages are line-line. Currents are always line currents.

Original COM help: https://opendss.epri.com/IsDelta2.html

(Setter)
"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Sensors_Set_IsDelta, dss.ctx, Value ? 1 : 0)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""
Full Name of the measured element

Original COM help: https://opendss.epri.com/MeteredElement1.html

(Getter)
"""
function MeteredElement(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Sensors_Get_MeteredElement, dss.ctx))
end
MeteredElement() = MeteredElement(DSS_DEFAULT_CTX)

"""
Full Name of the measured element

Original COM help: https://opendss.epri.com/MeteredElement1.html

(Setter)
"""
function MeteredElement(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Sensors_Set_MeteredElement, dss.ctx, Value)
end
MeteredElement(Value::String) = MeteredElement(DSS_DEFAULT_CTX, Value)

"""
Number of the measured terminal in the measured element.

Original COM help: https://opendss.epri.com/MeteredTerminal1.html

(Getter)
"""
function MeteredTerminal(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Sensors_Get_MeteredTerminal, dss.ctx)
end
MeteredTerminal() = MeteredTerminal(DSS_DEFAULT_CTX)

"""
Number of the measured terminal in the measured element.

Original COM help: https://opendss.epri.com/MeteredTerminal1.html

(Setter)
"""
function MeteredTerminal(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Sensors_Set_MeteredTerminal, dss.ctx, Value)
end
MeteredTerminal(Value::Int) = MeteredTerminal(DSS_DEFAULT_CTX, Value)

"""
Assumed percent error in the Sensor measurement. Default is 1.

Original COM help: https://opendss.epri.com/PctError.html

(Getter)
"""
function PctError(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Sensors_Get_PctError, dss.ctx)
end
PctError() = PctError(DSS_DEFAULT_CTX)

"""
Assumed percent error in the Sensor measurement. Default is 1.

Original COM help: https://opendss.epri.com/PctError.html

(Setter)
"""
function PctError(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Sensors_Set_PctError, dss.ctx, Value)
end
PctError(Value::Int) = PctError(DSS_DEFAULT_CTX, Value)

"""
True if voltage measurements are 1-3, 3-2, 2-1.

Original COM help: https://opendss.epri.com/ReverseDelta.html

(Getter)
"""
function ReverseDelta(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Sensors_Get_ReverseDelta, dss.ctx)) != 0
end
ReverseDelta() = ReverseDelta(DSS_DEFAULT_CTX)

"""
True if voltage measurements are 1-3, 3-2, 2-1.

Original COM help: https://opendss.epri.com/ReverseDelta.html

(Setter)
"""
function ReverseDelta(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Sensors_Set_ReverseDelta, dss.ctx, Value ? 1 : 0)
end
ReverseDelta(Value::Bool) = ReverseDelta(DSS_DEFAULT_CTX, Value)

"""
Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1.

Original COM help: https://opendss.epri.com/Weight.html

(Getter)
"""
function Weight(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Sensors_Get_Weight, dss.ctx)
end
Weight() = Weight(DSS_DEFAULT_CTX)

"""
Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1.

Original COM help: https://opendss.epri.com/Weight.html

(Setter)
"""
function Weight(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Sensors_Set_Weight, dss.ctx, Value)
end
Weight(Value::Float64) = Weight(DSS_DEFAULT_CTX, Value)

"""
Array of doubles for Q measurements.

(Getter)
"""
function kvar(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Sensors_Get_kVARS, dss)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""
Array of doubles for Q measurements. Overwrites Currents with a new estimate using kW.
    
(Setter)
"""
function kvar(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Sensors_Set_kVARS, dss.ctx, ValuePtr, ValueCount)
end
kvar(Value::Vector{Float64}) = kvar(DSS_DEFAULT_CTX, Value)

"""
Array of doubles for the LL or LN (depending on Delta connection) voltage measurements.

Original COM help: https://opendss.epri.com/kVS.html

(Getter)
"""
function kVS(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Sensors_Get_kVS, dss)
end
kVS() = kVS(DSS_DEFAULT_CTX)

"""
Array of doubles for the LL or LN (depending on Delta connection) voltage measurements.

Original COM help: https://opendss.epri.com/kVS.html

(Setter)
"""
function kVS(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Sensors_Set_kVS, dss.ctx, ValuePtr, ValueCount)
end
kVS(Value::Vector{Float64}) = kVS(DSS_DEFAULT_CTX, Value)

"""
Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors.

Original COM help: https://opendss.epri.com/kVBase1.html

(Getter)
"""
function kVBase(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Sensors_Get_kVbase, dss.ctx)
end
kVBase() = kVBase(DSS_DEFAULT_CTX)

"""
Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors.

Original COM help: https://opendss.epri.com/kVBase1.html

(Setter)
"""
function kVBase(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Sensors_Set_kVbase, dss.ctx, Value)
end
kVBase(Value::Float64) = kVBase(DSS_DEFAULT_CTX, Value)

"""
Array of doubles for P measurements.
    
(Getter)
"""
function kW(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Sensors_Get_kWS, dss)
end
kW() = kW(DSS_DEFAULT_CTX)

"""
Array of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. 
    
(Setter)
"""
function kW(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Sensors_Set_kWS, dss.ctx, ValuePtr, ValueCount)
end
kW(Value::Vector{Float64}) = kW(DSS_DEFAULT_CTX, Value)


"""
Array of doubles for the allocation factors for each phase.

Original COM help: https://opendss.epri.com/AllocationFactor1.html
"""
function AllocationFactor(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Sensors_Get_AllocationFactor, dss)
end
AllocationFactor() = AllocationFactor(DSS_DEFAULT_CTX)

end
