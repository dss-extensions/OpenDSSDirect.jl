module Progress

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Close progress form

Typically used with EPRI's OpenDSS, on Windows. Otherwise, it could be a no-op.
"""
function Close(dss::DSSContext)
    @checked dss_ccall(dss.capi.DSSProgress_Close, dss.ctx)
end
Close() = Close(DSS_DEFAULT_CTX)

"""
Show progress form

Typically used with EPRI's OpenDSS, on Windows. Otherwise, it could be a no-op.
"""
function Show(dss::DSSContext)
    @checked dss_ccall(dss.capi.DSSProgress_Show, dss.ctx)
end
Show() = Show(DSS_DEFAULT_CTX)

"""
Set the caption to appear on the bottom of the DSS Progress form.

Typically used with EPRI's OpenDSS, on Windows. Otherwise, it could be a no-op.

Original COM help: <https://opendss.epri.com/Caption.html>
"""
function Caption(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.DSSProgress_Set_Caption, dss.ctx, Value)
end
Caption(Value::String) = Caption(DSS_DEFAULT_CTX, Value)

"""
Set the percent progress to indicate [0..100] on the progress form.

Typically used with EPRI's OpenDSS, on Windows. Otherwise, it could be a no-op.

Original COM help: <https://opendss.epri.com/PctProgress.html>
"""
function PctProgress(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.DSSProgress_Set_PctProgress, dss.ctx, Value)
end
PctProgress(Value::Int) = PctProgress(DSS_DEFAULT_CTX, Value)

end
