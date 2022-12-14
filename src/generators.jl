module Generators

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of names of all Generator objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Generators_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of Generator Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets first Generator to be active.  Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Indicates whether the generator is forced ON regardles of other dispatch criteria."""
function ForcedON(dss::DSSContext)::Bool
    return @checked(Lib.Generators_Get_ForcedON(dss.ctx)) != 0
end
ForcedON() = ForcedON(DSS_DEFAULT_CTX)

"""Indicates whether the generator is forced ON regardles of other dispatch criteria."""
function ForcedON(dss::DSSContext, Value::Bool)
    @checked Lib.Generators_Set_ForcedON(dss.ctx, Value ? 1 : 0)
end
ForcedON(Value::Bool) = ForcedON(DSS_DEFAULT_CTX, Value)

"""Generator Model"""
function Model(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_Model(dss.ctx)
end
Model() = Model(DSS_DEFAULT_CTX)

"""Generator Model"""
function Model(dss::DSSContext, Value::Int)
    @checked Lib.Generators_Set_Model(dss.ctx, Value)
end
Model(Value::Int) = Model(DSS_DEFAULT_CTX, Value)

"""Sets a generator active by name."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Generators_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a generator active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Generators_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets next Generator to be active.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Power factor (pos. = producing vars). Updates kvar based on present kW value."""
function PF(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_PF(dss.ctx)
end
PF() = PF(DSS_DEFAULT_CTX)

"""Power factor (pos. = producing vars). Updates kvar based on present kW value."""
function PF(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_PF(dss.ctx, Value)
end
PF(Value::Float64) = PF(DSS_DEFAULT_CTX, Value)

"""Number of phases"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""Number of phases"""
function Phases(dss::DSSContext, Value::Int)
    @checked Lib.Generators_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""Array of Names of all generator energy meter registers"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Generators_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""Array of valus in generator energy meter registers."""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Generators_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

"""Vmaxpu for generator model"""
function Vmaxpu(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_Vmaxpu(dss.ctx)
end
Vmaxpu() = Vmaxpu(DSS_DEFAULT_CTX)

"""Vmaxpu for generator model"""
function Vmaxpu(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_Vmaxpu(dss.ctx, Value)
end
Vmaxpu(Value::Float64) = Vmaxpu(DSS_DEFAULT_CTX, Value)

"""Vminpu for Generator model"""
function Vminpu(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_Vminpu(dss.ctx)
end
Vminpu() = Vminpu(DSS_DEFAULT_CTX)

"""Vminpu for Generator model"""
function Vminpu(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_Vminpu(dss.ctx, Value)
end
Vminpu(Value::Float64) = Vminpu(DSS_DEFAULT_CTX, Value)

"""Active Generator by index into generators list.  1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Active Generator by index into generators list.  1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Generators_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Voltage base for the active generator, kV (Getter)"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""Voltage base for the active generator, kV (Setter)"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""kVA rating of the generator (Getter)"""
function kVARated(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_kVArated(dss.ctx)
end
kVARated() = kVARated(DSS_DEFAULT_CTX)

"""kVA rating of the generator (Setter)"""
function kVARated(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_kVArated(dss.ctx, Value)
end
kVARated(Value::Float64) = kVARated(DSS_DEFAULT_CTX, Value)

"""kW output for the active generator. kvar is updated for current power factor. (Getter)"""
function kW(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_kW(dss.ctx)
end
kW() = kW(DSS_DEFAULT_CTX)

"""kW output for the active generator. kvar is updated for current power factor. (Setter)"""
function kW(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_kW(dss.ctx, Value)
end
kW(Value::Float64) = kW(DSS_DEFAULT_CTX, Value)

"""kvar output for the active generator. Updates power factor based on present kW value. (Getter)"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""kvar output for the active generator. Updates power factor based on present kW value. (Setter)"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""
Name of the loadshape for the daily generation profile. (Getter)

(API Extension)
"""
function daily(dss::DSSContext)::String
    return get_string(@checked Lib.Generators_Get_daily(dss.ctx))
end
daily() = daily(DSS_DEFAULT_CTX)

"""
Name of the loadshape for the daily generation profile. (Setter)

(API Extension)
"""
function daily(dss::DSSContext, Value::String)
    @checked Lib.Generators_Set_daily(dss.ctx, Cstring(pointer(Value)))
end
daily(Value::String) = daily(DSS_DEFAULT_CTX, Value)

"""
Name of the loadshape for a duty cycle simulation. (Getter)

(API Extension)
"""
function duty(dss::DSSContext)::String
    return get_string(@checked Lib.Generators_Get_duty(dss.ctx))
end
duty() = duty(DSS_DEFAULT_CTX)

"""
Name of the loadshape for a duty cycle simulation. (Setter)

(API Extension)
"""
function duty(dss::DSSContext, Value::String)
    @checked Lib.Generators_Set_duty(dss.ctx, Cstring(pointer(Value)))
end
duty(Value::String) = duty(DSS_DEFAULT_CTX, Value)

"""
Name of yearly loadshape (Getter)

(API Extension)
"""
function Yearly(dss::DSSContext)::String
    return get_string(@checked Lib.Generators_Get_Yearly(dss.ctx))
end
Yearly() = Yearly(DSS_DEFAULT_CTX)

"""
Name of yearly loadshape (Setter)

(API Extension)
"""
function Yearly(dss::DSSContext, Value::String)
    @checked Lib.Generators_Set_Yearly(dss.ctx, Cstring(pointer(Value)))
end
Yearly(Value::String) = Yearly(DSS_DEFAULT_CTX, Value)

"""
Response to dispatch multipliers Fixed=1 (dispatch multipliers do not apply), Variable=0 (follows curves). (Getter)

Related enumeration: GeneratorStatus

(API Extension)
"""
function Status(dss::DSSContext)::Lib.GeneratorStatus
    return @checked Lib.Generators_Get_Status(dss.ctx)
end
Status() = Status(DSS_DEFAULT_CTX)

"""
Response to dispatch multipliers Fixed=1 (dispatch multipliers do not apply), Variable=0 (follows curves). (Setter)

Related enumeration: GeneratorStatus

(API Extension)
"""
function Status(dss::DSSContext, Value::Union{Lib.GeneratorStatus,Int})
    @checked Lib.Generators_Set_Status(dss.ctx, Value)
end
Status(Value::Union{Lib.GeneratorStatus,Int}) = Status(DSS_DEFAULT_CTX, Value)

"""
Generator connection. True/1 if delta connection, False/0 if wye. (Getter)

(API Extension)
"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(Lib.Generators_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""
Generator connection. True/1 if delta connection, False/0 if wye. (Setter)

(API Extension)
"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked Lib.Generators_Set_IsDelta(dss.ctx, Value)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""
kVA rating of electrical machine. Applied to machine or inverter definition for Dynamics mode solutions. (Getter)

(API Extension)
"""
function kva(dss::DSSContext)::Float64
    return @checked Lib.Generators_Get_kva(dss.ctx)
end
kva() = kva(DSS_DEFAULT_CTX)

"""
kVA rating of electrical machine. Applied to machine or inverter definition for Dynamics mode solutions. (Setter)

(API Extension)
"""
function kva(dss::DSSContext, Value::Float64)
    @checked Lib.Generators_Set_kva(dss.ctx, Value)
end
kva(Value::Float64) = kva(DSS_DEFAULT_CTX, Value)

"""
An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class. (Getter)

(API Extension)
"""
function Class(dss::DSSContext)::Int
    return @checked Lib.Generators_Get_Class_(dss.ctx)
end
Class() = Class(DSS_DEFAULT_CTX)

"""
An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class. (Setter)

(API Extension)
"""
function Class(dss::DSSContext, Value::Int)
    @checked Lib.Generators_Set_Class_(dss.ctx, Value)
end
Class(Value::Int) = Class(DSS_DEFAULT_CTX, Value)

"""
Bus to which the Generator is connected. May include specific node specification. (Getter)

(API Extension)
"""
function Bus1(dss::DSSContext)::String
    return get_string(@checked Lib.Generators_Get_Bus1(dss.ctx))
end
Bus1() = Bus1(DSS_DEFAULT_CTX)

"""
Bus to which the Generator is connected. May include specific node specification. (Setter)

(API Extension)
"""
function Bus1(dss::DSSContext, Value::String)
    @checked Lib.Generators_Set_Bus1(dss.ctx, Cstring(pointer(Value)))
end
Bus1(Value::String) = Bus1(DSS_DEFAULT_CTX, Value)

end