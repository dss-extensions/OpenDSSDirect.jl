module Generators

using ..lib
using ..utils

"""(read-only) Array of names of all Generator objects."""
function AllNames()
    return get_string_array(lib.Generators_Get_AllNames)
end

"""(read-only) Number of Generator Objects in Active Circuit"""
function Count()
    return lib.Generators_Get_Count()
end

"""(read-only) Sets first Generator to be active.  Returns 0 if none."""
function First()
    return lib.Generators_Get_First()
end

"""Indicates whether the generator is forced ON regardles of other dispatch criteria."""
function ForcedON()
    return lib.Generators_Get_ForcedON() != 0
end

"""Indicates whether the generator is forced ON regardles of other dispatch criteria."""
function ForcedON(Value)
    lib.Generators_Set_ForcedON(Value)
end

"""Generator Model"""
function Model()
    return lib.Generators_Get_Model()
end

"""Generator Model"""
function Model(Value)
    lib.Generators_Set_Model(Value)
end

"""Sets a generator active by name."""
function Name()
    return get_string(lib.Generators_Get_Name())
end

"""Sets a generator active by name."""
function Name(Value)
    lib.Generators_Set_Name(Cstring(pointer(Value)))
end

"""(read-only) Sets next Generator to be active.  Returns 0 if no more."""
function Next()
    return lib.Generators_Get_Next()
end

"""Power factor (pos. = producing vars). Updates kvar based on present kW value."""
function PF()
    return lib.Generators_Get_PF()
end

"""Power factor (pos. = producing vars). Updates kvar based on present kW value."""
function PF(Value)
    lib.Generators_Set_PF(Value)
end

"""Number of phases"""
function Phases()
    return lib.Generators_Get_Phases()
end

"""Number of phases"""
function Phases(Value)
    lib.Generators_Set_Phases(Value)
end

"""(read-only) Array of Names of all generator energy meter registers"""
function RegisterNames()
    return get_string_array(lib.Generators_Get_RegisterNames)
end

"""(read-only) Array of valus in generator energy meter registers."""
function RegisterValues()
    return get_float64_array(lib.Generators_Get_RegisterValues)
end

"""Vmaxpu for generator model"""
function Vmaxpu()
    return lib.Generators_Get_Vmaxpu()
end

"""Vmaxpu for generator model"""
function Vmaxpu(Value)
    lib.Generators_Set_Vmaxpu(Value)
end

"""Vminpu for Generator model"""
function Vminpu()
    return lib.Generators_Get_Vminpu()
end

"""Vminpu for Generator model"""
function Vminpu(Value)
    lib.Generators_Set_Vminpu(Value)
end

"""Get/Set active Generator by index into generators list.  1..Count"""
function Idx()
    return lib.Generators_Get_idx()
end

"""Get/Set active Generator by index into generators list.  1..Count"""
function Idx(Value)
    lib.Generators_Set_idx(Value)
end

"""Voltage base for the active generator, kV"""
function kV()
    return lib.Generators_Get_kV()
end

"""Voltage base for the active generator, kV"""
function kV(Value)
    lib.Generators_Set_kV(Value)
end

"""kVA rating of the generator"""
function kVARated()
    return lib.Generators_Get_kVArated()
end

"""kVA rating of the generator"""
function kVARated(Value)
    lib.Generators_Set_kVArated(Value)
end

"""kW output for the active generator. kvar is updated for current power factor."""
function kW()
    return lib.Generators_Get_kW()
end

"""kW output for the active generator. kvar is updated for current power factor."""
function kW(Value)
    lib.Generators_Set_kW(Value)
end

"""kvar output for the active generator. Updates power factor based on present kW value."""
function kvar()
    return lib.Generators_Get_kvar()
end

"""kvar output for the active generator. Updates power factor based on present kW value."""
function kvar(Value)
    lib.Generators_Set_kvar(Value)
end

end

