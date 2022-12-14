
module Progress

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close progress"""
function Close()
    @checked Lib.DSSProgress_Close(C_NULL_CTX)
end

"""Show progress"""
function Show()
    @checked Lib.DSSProgress_Show(C_NULL_CTX)
end

"""Caption to appear on the bottom of the DSS Progress form."""
function Caption(Value::String)
    @checked Lib.DSSProgress_Set_Caption(C_NULL_CTX, Value)
end

"""Percent progress to indicate [0..100]"""
function PctProgress(Value::Int)
    @checked Lib.DSSProgress_Set_PctProgress(C_NULL_CTX, Value)
end

end
