"""
If this loadshape is using float64/double precision internal data, use this function
to convert to float32/single precision. If the data is not owned by the loadshape,
this operation is not allowed.
"""
function UseFloat32(obj::Obj)
    obj_generic_call(obj, obj.dss.capi.Alt_LoadShape_UseFloat32)
end

"""
If this loadshape is using float32/single precision internal data, use this function
to convert to float64/double precision. If the data is not owned by the loadshape,
this operation is not allowed.
"""
function UseFloat64(obj::Obj)
    obj_generic_call(obj, obj.dss.capi.Alt_LoadShape_UseFloat64)
end
