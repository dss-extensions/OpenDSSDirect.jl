module ReduceCkt

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Name of Energymeter to use for reduction (Getter)"""
function EnergyMeter()::String
    return get_string(@checked Lib.ReduceCkt_Get_EnergyMeter())
end

"""Name of Energymeter to use for reduction (Setter)"""
function EnergyMeter(Value::String)
    return @checked Lib.ReduceCkt_Set_EnergyMeter(Cstring(pointer(Value)))
end

"""Keep load flag (T/F) for Reduction options that remove branches (Getter)"""
function KeepLoad()::Bool
    return (@checked Lib.ReduceCkt_Get_KeepLoad()) != 0
end

"""Keep load flag (T/F) for Reduction options that remove branches (Setter)"""
function KeepLoad(Value::Bool)
    return @checked Lib.ReduceCkt_Set_KeepLoad(Value)
end

"""Edit String for RemoveBranches functions (Getter)"""
function EditString()::String
    return get_string(@checked Lib.ReduceCkt_Get_EditString())
end

"""Edit String for RemoveBranches functions (Setter)"""
function EditString(Value::String)
    return @checked Lib.ReduceCkt_Set_EditString(Cstring(pointer(Value)))
end

"""Zmag (ohms) for Reduce Option for Z of short lines (Getter)"""
function Zmag()::Float64
    return @checked Lib.ReduceCkt_Get_Zmag()
end

"""Zmag (ohms) for Reduce Option for Z of short lines (Setter)"""
function Zmag(Value::Float64)
    return @checked Lib.ReduceCkt_Set_Zmag(Value)
end

"""Start element for Remove Branch function (Getter)"""
function StartPDElement()::String
    return get_string(@checked Lib.ReduceCkt_Get_StartPDElement())
end

"""Start element for Remove Branch function (Setter)"""
function StartPDElement(Value::String)
    return @checked Lib.ReduceCkt_Set_StartPDElement(Cstring(pointer(Value)))
end

"""Do1phLaterals"""
function Do1phLaterals()
    @checked Lib.ReduceCkt_Do1phLaterals()
end

"""DoParallelLines"""
function DoParallelLines()
    @checked Lib.ReduceCkt_DoParallelLines()
end

"""Save present (reduced) circuit
Filename is listed in the Text Result interface"""
function SaveCircuit(CktName::String)
    @checked Lib.ReduceCkt_SaveCircuit(CktName)
end

"""DoBranchRemove"""
function DoBranchRemove()
    @checked Lib.ReduceCkt_DoBranchRemove()
end

"""DoLoopBreak"""
function DoLoopBreak()
    @checked Lib.ReduceCkt_DoLoopBreak()
end

"""Reduce Dangling Algorithm; branches with nothing connected"""
function DoDangling()
    @checked Lib.ReduceCkt_DoDangling()
end

"""DoSwitches"""
function DoSwitches()
    @checked Lib.ReduceCkt_DoSwitches()
end

"""Do Default Reduction algorithm"""
function DoDefault()
    @checked Lib.ReduceCkt_DoDefault()
end

"""Do ShortLines algorithm: Set Zmag first if you don't want the default"""
function DoShortLines()
    @checked Lib.ReduceCkt_DoShortLines()
end

end