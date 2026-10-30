"""
All Winding currents (ph1, wdg1, wdg2,... ph2, wdg1, wdg2 ...)

WARNING: If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24
"""
function WindingCurrents(obj::Obj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Transformer_Get_WdgCurrents)
end

"""
Complex array of voltages for a target winding

WARNING: If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24
"""
function WindingVoltages(obj::Obj, winding::Int)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Transformer_Get_WdgVoltages, winding)
end

"""
Complex array with the losses by type (total losses, load losses, no-load losses), in VA
"""
function LossesByType(obj::Obj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Transformer_Get_LossesByType)
end
