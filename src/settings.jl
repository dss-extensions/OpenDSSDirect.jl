module Settings

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""{True | False*} Designates whether to allow duplicate names of objects (Getter)"""
function AllowDuplicates()::Bool
    return @checked(Lib.Settings_Get_AllowDuplicates()) != 0
end

"""{True | False*} Designates whether to allow duplicate names of objects (Setter)"""
function AllowDuplicates(Value::Bool)
    @checked Lib.Settings_Set_AllowDuplicates(Value ? 1 : 0)
end

"""List of Buses or (File=xxxx) syntax for the AutoAdd solution mode. (Getter)"""
function AutoBusList()::String
    return get_string(@checked Lib.Settings_Get_AutoBusList())
end

"""List of Buses or (File=xxxx) syntax for the AutoAdd solution mode. (Setter)"""
function AutoBusList(Value::String)
    @checked Lib.Settings_Set_AutoBusList(Value)
end

"""{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence. (Getter)"""
function CktModel()::Lib.CktModels
    return @checked Lib.Settings_Get_CktModel()
end

"""{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence. (Setter)"""
function CktModel(Value::Union{Int,Lib.CktModels})
    Value = convert(Lib.CktModels, Value)
    @checked Lib.Settings_Set_CktModel(Value)
end

"""{True | False*} Denotes whether to trace the control actions to a file. (Getter)"""
function ControlTrace()::Bool
    return @checked(Lib.Settings_Get_ControlTrace()) != 0
end

"""{True | False*} Denotes whether to trace the control actions to a file. (Setter)"""
function ControlTrace(Value::Bool)
    @checked Lib.Settings_Set_ControlTrace(Value ? 1 : 0)
end

"""Per Unit maximum voltage for Emergency conditions. (Getter)"""
function EmergVmaxpu()::Float64
    return @checked Lib.Settings_Get_EmergVmaxpu()
end

"""Per Unit maximum voltage for Emergency conditions. (Setter)"""
function EmergVmaxpu(Value::Float64)
    @checked Lib.Settings_Set_EmergVmaxpu(Value)
end

"""Per Unit minimum voltage for Emergency conditions. (Getter)"""
function EmergVminpu()::Float64
    return @checked Lib.Settings_Get_EmergVminpu()
end

"""Per Unit minimum voltage for Emergency conditions. (Setter)"""
function EmergVminpu(Value::Float64)
    @checked Lib.Settings_Set_EmergVminpu(Value)
end

"""Integer array defining which energy meter registers to use for computing losses (Getter)"""
function LossRegs()::Vector{Int}
    return get_int32_array(Lib.Settings_Get_LossRegs)
end

"""Integer array defining which energy meter registers to use for computing losses (Setter)"""
function LossRegs(Value::Vector{Int})
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked Lib.Settings_Set_LossRegs(ValuePtr, ValueCount)
end

"""Weighting factor applied to Loss register values. (Getter)"""
function LossWeight()::Float64
    return @checked Lib.Settings_Get_LossWeight()
end

"""Weighting factor applied to Loss register values. (Setter)"""
function LossWeight(Value::Float64)
    @checked Lib.Settings_Set_LossWeight(Value)
end

"""Per Unit maximum voltage for Normal conditions. (Getter)"""
function NormVmaxpu()::Float64
    return @checked Lib.Settings_Get_NormVmaxpu()
end

"""Per Unit maximum voltage for Normal conditions. (Setter)"""
function NormVmaxpu(Value::Float64)
    @checked Lib.Settings_Set_NormVmaxpu(Value)
end

"""Per Unit minimum voltage for Normal conditions. (Getter)"""
function NormVminpu()::Float64
    return @checked Lib.Settings_Get_NormVminpu()
end

"""Per Unit minimum voltage for Normal conditions. (Setter)"""
function NormVminpu(Value::Float64)
    @checked Lib.Settings_Set_NormVminpu(Value)
end

"""Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc. (Getter)"""
function PriceCurve()::String
    return get_string(@checked Lib.Settings_Get_PriceCurve())
end

"""Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc. (Setter)"""
function PriceCurve(Value::String)
    @checked Lib.Settings_Set_PriceCurve(Value)
end

"""Price Signal for the Circuit (Getter)"""
function PriceSignal()::Float64
    return @checked Lib.Settings_Get_PriceSignal()
end

"""Price Signal for the Circuit (Setter)"""
function PriceSignal(Value::Float64)
    @checked Lib.Settings_Set_PriceSignal(Value)
end

"""{True | False *} Gets value of trapezoidal integration flag in energy meters. (Getter)"""
function Trapezoidal()::Bool
    return @checked(Lib.Settings_Get_Trapezoidal()) != 0
end

"""{True | False *} Gets value of trapezoidal integration flag in energy meters. (Setter)"""
function Trapezoidal(Value::Bool)
    @checked Lib.Settings_Set_Trapezoidal(Value ? 1 : 0)
end

"""Array of Integers defining energy meter registers to use for computing UE (Getter)"""
function UERegs()::Vector{Int}
    return get_int32_array(Lib.Settings_Get_UEregs)
end

"""Array of Integers defining energy meter registers to use for computing UE (Setter)"""
function UERegs(Value::Vector{Int})
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked Lib.Settings_Set_UEregs(ValuePtr, ValueCount)
end

"""Weighting factor applied to UE register values. (Getter)"""
function UEWeight()::Float64
    return @checked Lib.Settings_Get_UEweight()
end

"""Weighting factor applied to UE register values. (Setter)"""
function UEWeight(Value::Float64)
    @checked Lib.Settings_Set_UEweight(Value)
end

"""Array of doubles defining the legal voltage bases in kV L-L (Getter)"""
function VoltageBases()::Vector{Float64}
    return get_float64_array(Lib.Settings_Get_VoltageBases)
end

"""Array of doubles defining the legal voltage bases in kV L-L (Setter)"""
function VoltageBases(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Settings_Set_VoltageBases(ValuePtr, ValueCount)
end

"""{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs. (Getter)"""
function ZoneLock()::Bool
    return @checked(Lib.Settings_Get_ZoneLock()) != 0
end

"""{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs. (Setter)"""
function ZoneLock(Value::Bool)
    @checked Lib.Settings_Set_ZoneLock(Value ? 1 : 0)
end

"""Sets all load allocation factors for all loads defined by XFKVA property to this value (Setter)"""
function AllocationFactors(Value::Float64)
    @checked Lib.Settings_Set_AllocationFactors(Value)
end

"""
Get/Set the state of terminal checking in all load elements. (Getter)

This controls whether the terminals are checked when updating the currents in Load component. Defaults to true.
If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to false to save some time.

(API Extension)
"""
function LoadsTerminalCheck()::Bool
    return @checked(Lib.Settings_Get_LoadsTerminalCheck()) != 0
end

"""
Get/Set the state of terminal checking in all load elements. (Setter)

This controls whether the terminals are checked when updating the currents in Load component. Defaults to true.
If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to false to save some time.

(API Extension)
"""
function LoadsTerminalCheck(Value::Bool)
    @checked Lib.Settings_Set_LoadsTerminalCheck(Value ? 1 : 0)
end

end
