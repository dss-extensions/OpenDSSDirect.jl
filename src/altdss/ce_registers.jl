"""
List of names of the energy meter registers for this element.

See also the enums `EnergyMeterRegisters` and `GeneratorRegisters`.
"""
function RegisterNames(obj::Obj)::Vector{String}
    return obj_get_strs_func(obj, obj.dss.capi.Alt_CE_Get_RegisterNames)
end

"""
Array of values in this element's energy meter registers.

Original COM help: https://opendss.epri.com/RegisterValues.html
"""
function RegisterValues(obj::Obj)::Vector{Float64}
    return obj_get_float64s_func(obj, obj.dss.capi.Alt_CE_Get_RegisterValues)
end

"""
Convenience function: returns a dict of the element's energy meter register names mapping to their current values.
"""
function RegistersDict(obj::Obj)::Dict{String,Float64}
    return Dict(zip(RegisterNames(obj), RegisterValues(obj)))
end
