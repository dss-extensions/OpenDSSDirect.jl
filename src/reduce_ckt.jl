module ReduceCkt

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Name of EnergyMeter to use for reduction

Original COM help: https://opendss.epri.com/EnergyMeter1.html

(Getter)
"""
function EnergyMeter(dss::DSSContext)::String
    return get_string(@checked Lib.ReduceCkt_Get_EnergyMeter(dss.ctx))
end
EnergyMeter() = EnergyMeter(DSS_DEFAULT_CTX)

"""
Name of EnergyMeter to use for reduction

Original COM help: https://opendss.epri.com/EnergyMeter1.html

(Setter)
"""
function EnergyMeter(dss::DSSContext, Value::String)
    @checked Lib.ReduceCkt_Set_EnergyMeter(dss.ctx, Cstring(pointer(Value)))
end
EnergyMeter(Value::String) = EnergyMeter(DSS_DEFAULT_CTX, Value)

"""
Keep load flag for Reduction options that remove branches

Original COM help: https://opendss.epri.com/KeepLoad.html

(Getter)
"""
function KeepLoad(dss::DSSContext)::Bool
    return (@checked Lib.ReduceCkt_Get_KeepLoad(dss.ctx)) != 0
end
KeepLoad() = KeepLoad(DSS_DEFAULT_CTX)

"""
Keep load flag for Reduction options that remove branches

Original COM help: https://opendss.epri.com/KeepLoad.html

(Setter)
"""
function KeepLoad(dss::DSSContext, Value::Bool)
    @checked Lib.ReduceCkt_Set_KeepLoad(dss.ctx, Value)
end
KeepLoad(Value::Bool) = KeepLoad(DSS_DEFAULT_CTX, Value)

"""
Edit String for RemoveBranches functions

Original COM help: https://opendss.epri.com/EditString.html

(Getter)
"""
function EditString(dss::DSSContext)::String
    return get_string(@checked Lib.ReduceCkt_Get_EditString(dss.ctx))
end
EditString() = EditString(DSS_DEFAULT_CTX)

"""
Edit String for RemoveBranches functions

Original COM help: https://opendss.epri.com/EditString.html

(Setter)
"""
function EditString(dss::DSSContext, Value::String)
    @checked Lib.ReduceCkt_Set_EditString(dss.ctx, Cstring(pointer(Value)))
end
EditString(Value::String) = EditString(DSS_DEFAULT_CTX, Value)

"""
Zmag (ohms) for Reduce Option for Z of short lines

Original COM help: https://opendss.epri.com/Zmag.html

(Getter)
"""
function Zmag(dss::DSSContext)::Float64
    return @checked Lib.ReduceCkt_Get_Zmag(dss.ctx)
end
Zmag() = Zmag(DSS_DEFAULT_CTX)

"""
Zmag (ohms) for Reduce Option for Z of short lines

Original COM help: https://opendss.epri.com/Zmag.html

(Setter)
"""
function Zmag(dss::DSSContext, Value::Float64)
    @checked Lib.ReduceCkt_Set_Zmag(dss.ctx, Value)
end
Zmag(Value::Float64) = Zmag(DSS_DEFAULT_CTX, Value)

"""
Start element for Remove Branch function

Original COM help: https://opendss.epri.com/StartPDElement.html

(Getter)
"""
function StartPDElement(dss::DSSContext)::String
    return get_string(@checked Lib.ReduceCkt_Get_StartPDElement(dss.ctx))
end
StartPDElement() = StartPDElement(DSS_DEFAULT_CTX)

"""
Start element for Remove Branch function

Original COM help: https://opendss.epri.com/StartPDElement.html

(Setter)
"""
function StartPDElement(dss::DSSContext, Value::String)
    @checked Lib.ReduceCkt_Set_StartPDElement(dss.ctx, Cstring(pointer(Value)))
end
StartPDElement(Value::String) = StartPDElement(DSS_DEFAULT_CTX, Value)

"""
Remove all 1-phase laterals in the active EnergyMeter's zone.

Loads and other shunt elements are moved to the parent 3-phase bus.
"""
function Do1phLaterals(dss::DSSContext)
    @checked Lib.ReduceCkt_Do1phLaterals(dss.ctx)
end
Do1phLaterals() = Do1phLaterals(DSS_DEFAULT_CTX)

"""Merge all parallel lines found in the circuit to facilitate its reduction."""
function DoParallelLines(dss::DSSContext)
    @checked Lib.ReduceCkt_DoParallelLines(dss.ctx)
end
DoParallelLines() = DoParallelLines(DSS_DEFAULT_CTX)

"""
Save present (reduced) circuit
Filename is listed in the Text Result interface
"""
function SaveCircuit(dss::DSSContext, CktName::String)
    @checked Lib.ReduceCkt_SaveCircuit(dss.ctx, CktName)
end
SaveCircuit(CktName::String) = SaveCircuit(DSS_DEFAULT_CTX, CktName)

"""
Remove (disable) all branches down-line from the active PDElement.

Circuit must have an EnergyMeter on this branch.
If KeepLoad=Y (default), a new Load element is defined and kW, kvar are set to present power flow solution for the first element eliminated.
The EditString is applied to each new Load element defined.
"""
function DoBranchRemove(dss::DSSContext)
    @checked Lib.ReduceCkt_DoBranchRemove(dss.ctx)
end
DoBranchRemove() = DoBranchRemove(DSS_DEFAULT_CTX)

"""
Break (disable) all the loops found in the active circuit.

Disables one of the Line objects at the head of a loop to force the circuit to be radial.
"""
function DoLoopBreak(dss::DSSContext)
    @checked Lib.ReduceCkt_DoLoopBreak(dss.ctx)
end
DoLoopBreak() = DoLoopBreak(DSS_DEFAULT_CTX)

"""
Reduce Dangling Algorithm; branches with nothing connected

Original COM help: https://opendss.epri.com/DoDangling.html
"""
function DoDangling(dss::DSSContext)
    @checked Lib.ReduceCkt_DoDangling(dss.ctx)
end
DoDangling() = DoDangling(DSS_DEFAULT_CTX)

"""Merge Line objects in which the IsSwitch property is true with the down-line Line object."""
function DoSwitches(dss::DSSContext)
    @checked Lib.ReduceCkt_DoSwitches(dss.ctx)
end
DoSwitches() = DoSwitches(DSS_DEFAULT_CTX)

"""
Do Default Reduction algorithm

Original COM help: https://opendss.epri.com/DoDefault.html
"""
function DoDefault(dss::DSSContext)
    @checked Lib.ReduceCkt_DoDefault(dss.ctx)
end
DoDefault() = DoDefault(DSS_DEFAULT_CTX)

"""
Do ShortLines algorithm: Set Zmag first if you don't want the default

Original COM help: https://opendss.epri.com/DoShortLines.html
"""
function DoShortLines(dss::DSSContext)
    @checked Lib.ReduceCkt_DoShortLines(dss.ctx)
end
DoShortLines() = DoShortLines(DSS_DEFAULT_CTX)

end