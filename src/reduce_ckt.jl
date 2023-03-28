module ReduceCkt

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Name of Energymeter to use for reduction (Getter)"""
function EnergyMeter(dss::DSSContext)::String
    return get_string(@checked Lib.ReduceCkt_Get_EnergyMeter(dss.ctx))
end
EnergyMeter() = EnergyMeter(DSS_DEFAULT_CTX)

"""Name of Energymeter to use for reduction (Setter)"""
function EnergyMeter(dss::DSSContext, Value::String)
    return @checked Lib.ReduceCkt_Set_EnergyMeter(dss.ctx, Cstring(pointer(Value)))
end
EnergyMeter(Value::String) = EnergyMeter(DSS_DEFAULT_CTX, Value)

"""Keep load flag (T/F) for Reduction options that remove branches (Getter)"""
function KeepLoad(dss::DSSContext)::Bool
    return (@checked Lib.ReduceCkt_Get_KeepLoad(dss.ctx)) != 0
end
KeepLoad() = KeepLoad(DSS_DEFAULT_CTX)

"""Keep load flag (T/F) for Reduction options that remove branches (Setter)"""
function KeepLoad(dss::DSSContext, Value::Bool)
    return @checked Lib.ReduceCkt_Set_KeepLoad(dss.ctx, Value)
end
KeepLoad(Value::Bool) = KeepLoad(DSS_DEFAULT_CTX, Value)

"""Edit String for RemoveBranches functions (Getter)"""
function EditString(dss::DSSContext)::String
    return get_string(@checked Lib.ReduceCkt_Get_EditString(dss.ctx))
end
EditString() = EditString(DSS_DEFAULT_CTX)

"""Edit String for RemoveBranches functions (Setter)"""
function EditString(dss::DSSContext, Value::String)
    return @checked Lib.ReduceCkt_Set_EditString(dss.ctx, Cstring(pointer(Value)))
end
EditString(Value::String) = EditString(DSS_DEFAULT_CTX, Value)

"""Zmag (ohms) for Reduce Option for Z of short lines (Getter)"""
function Zmag(dss::DSSContext)::Float64
    return @checked Lib.ReduceCkt_Get_Zmag(dss.ctx)
end
Zmag() = Zmag(DSS_DEFAULT_CTX)

"""Zmag (ohms) for Reduce Option for Z of short lines (Setter)"""
function Zmag(dss::DSSContext, Value::Float64)
    return @checked Lib.ReduceCkt_Set_Zmag(dss.ctx, Value)
end
Zmag(Value::Float64) = Zmag(DSS_DEFAULT_CTX, Value)

"""Start element for Remove Branch function (Getter)"""
function StartPDElement(dss::DSSContext)::String
    return get_string(@checked Lib.ReduceCkt_Get_StartPDElement(dss.ctx))
end
StartPDElement() = StartPDElement(DSS_DEFAULT_CTX)

"""Start element for Remove Branch function (Setter)"""
function StartPDElement(dss::DSSContext, Value::String)
    return @checked Lib.ReduceCkt_Set_StartPDElement(dss.ctx, Cstring(pointer(Value)))
end
StartPDElement(Value::String) = StartPDElement(DSS_DEFAULT_CTX, Value)

"""Do1phLaterals"""
function Do1phLaterals(dss::DSSContext)
    @checked Lib.ReduceCkt_Do1phLaterals(dss.ctx)
end
Do1phLaterals() = Do1phLaterals(DSS_DEFAULT_CTX)

"""DoParallelLines"""
function DoParallelLines(dss::DSSContext)
    @checked Lib.ReduceCkt_DoParallelLines(dss.ctx)
end
DoParallelLines() = DoParallelLines(DSS_DEFAULT_CTX)

"""Save present (reduced) circuit
Filename is listed in the Text Result interface"""
function SaveCircuit(dss::DSSContext, CktName::String)
    @checked Lib.ReduceCkt_SaveCircuit(dss.ctx, CktName)
end
SaveCircuit(CktName::String) = SaveCircuit(DSS_DEFAULT_CTX, CktName)

"""DoBranchRemove"""
function DoBranchRemove(dss::DSSContext)
    @checked Lib.ReduceCkt_DoBranchRemove(dss.ctx)
end
DoBranchRemove() = DoBranchRemove(DSS_DEFAULT_CTX)

"""DoLoopBreak"""
function DoLoopBreak(dss::DSSContext)
    @checked Lib.ReduceCkt_DoLoopBreak(dss.ctx)
end
DoLoopBreak() = DoLoopBreak(DSS_DEFAULT_CTX)

"""Reduce Dangling Algorithm; branches with nothing connected"""
function DoDangling(dss::DSSContext)
    @checked Lib.ReduceCkt_DoDangling(dss.ctx)
end
DoDangling() = DoDangling(DSS_DEFAULT_CTX)

"""DoSwitches"""
function DoSwitches(dss::DSSContext)
    @checked Lib.ReduceCkt_DoSwitches(dss.ctx)
end
DoSwitches() = DoSwitches(DSS_DEFAULT_CTX)

"""Do Default Reduction algorithm"""
function DoDefault(dss::DSSContext)
    @checked Lib.ReduceCkt_DoDefault(dss.ctx)
end
DoDefault() = DoDefault(DSS_DEFAULT_CTX)

"""Do ShortLines algorithm: Set Zmag first if you don't want the default"""
function DoShortLines(dss::DSSContext)
    @checked Lib.ReduceCkt_DoShortLines(dss.ctx)
end
DoShortLines() = DoShortLines(DSS_DEFAULT_CTX)

end