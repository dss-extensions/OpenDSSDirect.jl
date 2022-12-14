
module Progress

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close progress"""
function Close(dss::DSSContext)
    @checked Lib.DSSProgress_Close(dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""Show progress"""
function Show(dss::DSSContext)
    @checked Lib.DSSProgress_Show(dss.ctx)
end
Show() = Show(DSS_DEFAULT_CTX)

"""Caption to appear on the bottom of the DSS Progress form."""
function Caption(dss::DSSContext, Value::String)
    @checked Lib.DSSProgress_Set_Caption(dss.ctx, Value)
end
Caption(Value::String) = Caption(DSS_DEFAULT_CTX, Value)

"""Percent progress to indicate [0..100]"""
function PctProgress(dss::DSSContext, Value::Int)
    @checked Lib.DSSProgress_Set_PctProgress(dss.ctx, Value)
end
PctProgress(Value::Int) = PctProgress(DSS_DEFAULT_CTX, Value)

end
