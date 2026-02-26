"""
The PCElement module contains shared functions for all PC (power conversion) elements.
Its functions are reexported in the dedicated modules for the concrete types 
(e.g. `Load`, `Generator`, `PVSystem` reexport these functions).
"""
module PCElement
using ..Common

"""
"""
function VariableNames(obj::AbstractPCElement)::Vector{String}
    obj_get_strs(obj, obj.dss.capi.Alt_PCE_Get_VariableNames)
end

"""
"""
function VariableValues(obj::AbstractPCElement)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_PCE_Get_VariableValues)
end

"""
"""
function VariablesDict(obj::AbstractPCElement)::Dict{String, Float64}
    return Dict(zip(VariableNames(obj), VariableValues(obj)))
end

"""
"""
function GetVariableValue(obj::AbstractPCElement, var_idx::Int)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PCE_Get_VariableValue, var_idx)
end

"""
"""
function GetVariableValue(obj::AbstractPCElement, var_name::String)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PCE_Get_VariableSValue, var_name)
end

"""
"""
function SetVariableValue(obj::AbstractPCElement, var_idx::Int, value::Float64)
    obj_generic_call(obj.dss.capi.Alt_PCE_Set_VariableValue, var_idx, value)
end

"""
"""
function SetVariableValue(obj::AbstractPCElement, var_name::String, value::Float64)
    obj_generic_call(obj.dss.capi.Alt_PCE_Set_VariableSValue, var_name, value)
end

"""
Energy Meter this element is assigned to.

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/EnergyMeter.html
"""
function EnergyMeter(obj::AbstractPCElement)::DSSObj
    return obj_get_obj(obj.dss.capi.Alt_PCE_Get_EnergyMeter, obj)
end

"""
Name of the Energy Meter this element is assigned to.

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/EnergyMeter.html
"""
function EnergyMeterName(obj::AbstractPCElement)::String
    obj_get_str(obj, obj.dss.capi.Alt_PCE_Get_EnergyMeterName)
end

include("pc_element_exports.jl")

end # module PCElement
export PCElement
