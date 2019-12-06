module Error

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Description of error for last operation"""
function Description()::String
    return get_string(Lib.Error_Get_Description())
end

"""Error Number"""
function Number()::Int
    return Lib.Error_Get_Number()
end

end
