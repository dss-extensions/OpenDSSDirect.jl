module Generators

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of names of all Generator objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.Generators_Get_AllNames)
end

"""Number of Generator Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.Generators_Get_Count()
end

"""Sets first Generator to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.Generators_Get_First()
end

"""Indicates whether the generator is forced ON regardles of other dispatch criteria."""
function ForcedON()::Bool
    return @checked(Lib.Generators_Get_ForcedON()) != 0
end

"""Indicates whether the generator is forced ON regardles of other dispatch criteria."""
function ForcedON(Value::Bool)
    @checked Lib.Generators_Set_ForcedON(Value ? 1 : 0)
end

"""Generator Model"""
function Model()::Int
    return @checked Lib.Generators_Get_Model()
end

"""Generator Model"""
function Model(Value::Int)
    @checked Lib.Generators_Set_Model(Value)
end

"""Sets a generator active by name."""
function Name()::String
    return get_string(@checked Lib.Generators_Get_Name())
end

"""Sets a generator active by name."""
function Name(Value::String)
    @checked Lib.Generators_Set_Name(Cstring(pointer(Value)))
end

"""Sets next Generator to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Generators_Get_Next()
end

"""Power factor (pos. = producing vars). Updates kvar based on present kW value."""
function PF()::Float64
    return @checked Lib.Generators_Get_PF()
end

"""Power factor (pos. = producing vars). Updates kvar based on present kW value."""
function PF(Value::Float64)
    @checked Lib.Generators_Set_PF(Value)
end

"""Number of phases"""
function Phases()::Int
    return @checked Lib.Generators_Get_Phases()
end

"""Number of phases"""
function Phases(Value::Int)
    @checked Lib.Generators_Set_Phases(Value)
end

"""Array of Names of all generator energy meter registers"""
function RegisterNames()::Vector{String}
    return get_string_array(Lib.Generators_Get_RegisterNames)
end

"""Array of valus in generator energy meter registers."""
function RegisterValues()::Vector{Float64}
    return get_float64_array(Lib.Generators_Get_RegisterValues)
end

"""Vmaxpu for generator model"""
function Vmaxpu()::Float64
    return @checked Lib.Generators_Get_Vmaxpu()
end

"""Vmaxpu for generator model"""
function Vmaxpu(Value::Float64)
    @checked Lib.Generators_Set_Vmaxpu(Value)
end

"""Vminpu for Generator model"""
function Vminpu()::Float64
    return @checked Lib.Generators_Get_Vminpu()
end

"""Vminpu for Generator model"""
function Vminpu(Value::Float64)
    @checked Lib.Generators_Set_Vminpu(Value)
end

"""Active Generator by index into generators list.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.Generators_Get_idx()
end

"""Active Generator by index into generators list.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.Generators_Set_idx(Value)
end

"""Voltage base for the active generator, kV (Getter)"""
function kV()::Float64
    return @checked Lib.Generators_Get_kV()
end

"""Voltage base for the active generator, kV (Setter)"""
function kV(Value::Float64)
    @checked Lib.Generators_Set_kV(Value)
end

"""kVA rating of the generator (Getter)"""
function kVARated()::Float64
    return @checked Lib.Generators_Get_kVArated()
end

"""kVA rating of the generator (Setter)"""
function kVARated(Value::Float64)
    @checked Lib.Generators_Set_kVArated(Value)
end

"""kW output for the active generator. kvar is updated for current power factor. (Getter)"""
function kW()::Float64
    return @checked Lib.Generators_Get_kW()
end

"""kW output for the active generator. kvar is updated for current power factor. (Setter)"""
function kW(Value::Float64)
    @checked Lib.Generators_Set_kW(Value)
end

"""kvar output for the active generator. Updates power factor based on present kW value. (Getter)"""
function kvar()::Float64
    return @checked Lib.Generators_Get_kvar()
end

"""kvar output for the active generator. Updates power factor based on present kW value. (Setter)"""
function kvar(Value::Float64)
    @checked Lib.Generators_Set_kvar(Value)
end

"""
Name of the loadshape for the daily generation profile. (Getter)

(API Extension)
"""
function daily()::String
    return get_string(@checked Lib.Generators_Get_daily())
end

"""
Name of the loadshape for the daily generation profile. (Setter)

(API Extension)
"""
function daily(Value::String)
    @checked Lib.Generators_Set_daily(Cstring(pointer(Value)))
end

"""
Name of the loadshape for a duty cycle simulation. (Getter)

(API Extension)
"""
function duty()::String
    return get_string(@checked Lib.Generators_Get_duty())
end

"""
Name of the loadshape for a duty cycle simulation. (Setter)

(API Extension)
"""
function duty(Value::String)
    @checked Lib.Generators_Set_duty(Cstring(pointer(Value)))
end

"""
Name of yearly loadshape (Getter)

(API Extension)
"""
function Yearly()::String
    return get_string(@checked Lib.Generators_Get_Yearly())
end

"""
Name of yearly loadshape (Setter)

(API Extension)
"""
function Yearly(Value::String)
    @checked Lib.Generators_Set_Yearly(Cstring(pointer(Value)))
end

"""
Response to dispatch multipliers Fixed=1 (dispatch multipliers do not apply), Variable=0 (follows curves). (Getter)

Related enumeration: GeneratorStatus

(API Extension)
"""
function Status()::Lib.GeneratorStatus
    return @checked Lib.Generators_Get_Status()
end

"""
Response to dispatch multipliers Fixed=1 (dispatch multipliers do not apply), Variable=0 (follows curves). (Setter)

Related enumeration: GeneratorStatus

(API Extension)
"""
function Status(Value::Union{Lib.GeneratorStatus, Int})
    @checked Lib.Generators_Set_Status(Value)
end

"""
Generator connection. True/1 if delta connection, False/0 if wye. (Getter)

(API Extension)
"""
function IsDelta()::Bool
    return @checked(Lib.Generators_Get_IsDelta()) != 0
end

"""
Generator connection. True/1 if delta connection, False/0 if wye. (Setter)

(API Extension)
"""
function IsDelta(Value::Bool)
    @checked Lib.Generators_Set_IsDelta(Value)
end

"""
kVA rating of electrical machine. Applied to machine or inverter definition for Dynamics mode solutions. (Getter)

(API Extension)
"""
function kva()::Float64
    return @checked Lib.Generators_Get_kva()
end

"""
kVA rating of electrical machine. Applied to machine or inverter definition for Dynamics mode solutions. (Setter)

(API Extension)
"""
function kva(Value::Float64)
    @checked Lib.Generators_Set_kva(Value)
end

"""
An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class. (Getter)

(API Extension)
"""
function Class()::Int
    return @checked Lib.Generators_Get_Class_()
end

"""
An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class. (Setter)

(API Extension)
"""
function Class(Value::Int)
    @checked Lib.Generators_Set_Class_(Value)
end

"""
Bus to which the Generator is connected. May include specific node specification. (Getter)

(API Extension)
"""
function Bus1()::String
    return get_string(@checked Lib.Generators_Get_Bus1())
end

"""
Bus to which the Generator is connected. May include specific node specification. (Setter)

(API Extension)
"""
function Bus1(Value::String)
    @checked Lib.Generators_Set_Bus1(Cstring(pointer(Value)))
end

end