module Settings

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""{True | False*} Designates whether to allow duplicate names of objects (Getter)"""
function AllowDuplicates(dss::DSSContext)::Bool
    return @checked(Lib.Settings_Get_AllowDuplicates(dss.ctx)) != 0
end
AllowDuplicates() = AllowDuplicates(DSS_DEFAULT_CTX)

"""{True | False*} Designates whether to allow duplicate names of objects (Setter)"""
function AllowDuplicates(dss::DSSContext, Value::Bool)
    @checked Lib.Settings_Set_AllowDuplicates(dss.ctx, Value ? 1 : 0)
end
AllowDuplicates(Value::Bool) = AllowDuplicates(DSS_DEFAULT_CTX, Value)

"""List of Buses or (File=xxxx) syntax for the AutoAdd solution mode. (Getter)"""
function AutoBusList(dss::DSSContext)::String
    return get_string(@checked Lib.Settings_Get_AutoBusList(dss.ctx))
end
AutoBusList() = AutoBusList(DSS_DEFAULT_CTX)

"""List of Buses or (File=xxxx) syntax for the AutoAdd solution mode. (Setter)"""
function AutoBusList(dss::DSSContext, Value::String)
    @checked Lib.Settings_Set_AutoBusList(dss.ctx, Value)
end
AutoBusList(Value::String) = AutoBusList(DSS_DEFAULT_CTX, Value)

"""{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence. (Getter)"""
function CktModel(dss::DSSContext)::Lib.CktModels
    return @checked Lib.Settings_Get_CktModel(dss.ctx)
end
CktModel() = CktModel(DSS_DEFAULT_CTX)

"""{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence. (Setter)"""
function CktModel(dss::DSSContext, Value::Union{Int,Lib.CktModels})
    Value = convert(Lib.CktModels, Value)
    @checked Lib.Settings_Set_CktModel(dss.ctx, Value)
end
CktModel(Value::Union{Int,Lib.CktModels}) = CktModel(DSS_DEFAULT_CTX, Value)

"""{True | False*} Denotes whether to trace the control actions to a file. (Getter)"""
function ControlTrace(dss::DSSContext)::Bool
    return @checked(Lib.Settings_Get_ControlTrace(dss.ctx)) != 0
end
ControlTrace() = ControlTrace(DSS_DEFAULT_CTX)

"""{True | False*} Denotes whether to trace the control actions to a file. (Setter)"""
function ControlTrace(dss::DSSContext, Value::Bool)
    @checked Lib.Settings_Set_ControlTrace(dss.ctx, Value ? 1 : 0)
end
ControlTrace(Value::Bool) = ControlTrace(DSS_DEFAULT_CTX, Value)

"""Per Unit maximum voltage for Emergency conditions. (Getter)"""
function EmergVmaxpu(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_EmergVmaxpu(dss.ctx)
end
EmergVmaxpu() = EmergVmaxpu(DSS_DEFAULT_CTX)

"""Per Unit maximum voltage for Emergency conditions. (Setter)"""
function EmergVmaxpu(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_EmergVmaxpu(dss.ctx, Value)
end
EmergVmaxpu(Value::Float64) = EmergVmaxpu(DSS_DEFAULT_CTX, Value)

"""Per Unit minimum voltage for Emergency conditions. (Getter)"""
function EmergVminpu(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_EmergVminpu(dss.ctx)
end
EmergVminpu() = EmergVminpu(DSS_DEFAULT_CTX)

"""Per Unit minimum voltage for Emergency conditions. (Setter)"""
function EmergVminpu(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_EmergVminpu(dss.ctx, Value)
end
EmergVminpu(Value::Float64) = EmergVminpu(DSS_DEFAULT_CTX, Value)

"""Integer array defining which energy meter registers to use for computing losses (Getter)"""
function LossRegs(dss::DSSContext)::Vector{Int}
    return get_int32_array(Lib.Settings_Get_LossRegs, dss.ctx)
end
LossRegs() = LossRegs(DSS_DEFAULT_CTX)

"""Integer array defining which energy meter registers to use for computing losses (Setter)"""
function LossRegs(dss::DSSContext, Value::Vector{Int})
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked Lib.Settings_Set_LossRegs(dss.ctx, ValuePtr, ValueCount)
end
LossRegs(Value::Vector{Int}) = LossRegs(DSS_DEFAULT_CTX, Value)

"""Weighting factor applied to Loss register values. (Getter)"""
function LossWeight(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_LossWeight(dss.ctx)
end
LossWeight() = LossWeight(DSS_DEFAULT_CTX)

"""Weighting factor applied to Loss register values. (Setter)"""
function LossWeight(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_LossWeight(dss.ctx, Value)
end
LossWeight(Value::Float64) = LossWeight(DSS_DEFAULT_CTX, Value)

"""Per Unit maximum voltage for Normal conditions. (Getter)"""
function NormVmaxpu(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_NormVmaxpu(dss.ctx)
end
NormVmaxpu() = NormVmaxpu(DSS_DEFAULT_CTX)

"""Per Unit maximum voltage for Normal conditions. (Setter)"""
function NormVmaxpu(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_NormVmaxpu(dss.ctx, Value)
end
NormVmaxpu(Value::Float64) = NormVmaxpu(DSS_DEFAULT_CTX, Value)

"""Per Unit minimum voltage for Normal conditions. (Getter)"""
function NormVminpu(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_NormVminpu(dss.ctx)
end
NormVminpu() = NormVminpu(DSS_DEFAULT_CTX)

"""Per Unit minimum voltage for Normal conditions. (Setter)"""
function NormVminpu(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_NormVminpu(dss.ctx, Value)
end
NormVminpu(Value::Float64) = NormVminpu(DSS_DEFAULT_CTX, Value)

"""Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc. (Getter)"""
function PriceCurve(dss::DSSContext)::String
    return get_string(@checked Lib.Settings_Get_PriceCurve(dss.ctx))
end
PriceCurve() = PriceCurve(DSS_DEFAULT_CTX)

"""Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc. (Setter)"""
function PriceCurve(dss::DSSContext, Value::String)
    @checked Lib.Settings_Set_PriceCurve(dss.ctx, Value)
end
PriceCurve(Value::String) = PriceCurve(DSS_DEFAULT_CTX, Value)

"""Price Signal for the Circuit (Getter)"""
function PriceSignal(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_PriceSignal(dss.ctx)
end
PriceSignal() = PriceSignal(DSS_DEFAULT_CTX)

"""Price Signal for the Circuit (Setter)"""
function PriceSignal(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_PriceSignal(dss.ctx, Value)
end
PriceSignal(Value::Float64) = PriceSignal(DSS_DEFAULT_CTX, Value)

"""{True | False *} Gets value of trapezoidal integration flag in energy meters. (Getter)"""
function Trapezoidal(dss::DSSContext)::Bool
    return @checked(Lib.Settings_Get_Trapezoidal(dss.ctx)) != 0
end
Trapezoidal() = Trapezoidal(DSS_DEFAULT_CTX)

"""{True | False *} Gets value of trapezoidal integration flag in energy meters. (Setter)"""
function Trapezoidal(dss::DSSContext, Value::Bool)
    @checked Lib.Settings_Set_Trapezoidal(dss.ctx, Value ? 1 : 0)
end
Trapezoidal(Value::Bool) = Trapezoidal(DSS_DEFAULT_CTX, Value)

"""Array of Integers defining energy meter registers to use for computing UE (Getter)"""
function UERegs(dss::DSSContext)::Vector{Int}
    return get_int32_array(Lib.Settings_Get_UEregs, dss.ctx)
end
UERegs() = UERegs(DSS_DEFAULT_CTX)

"""Array of Integers defining energy meter registers to use for computing UE (Setter)"""
function UERegs(dss::DSSContext, Value::Vector{Int})
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked Lib.Settings_Set_UEregs(dss.ctx, ValuePtr, ValueCount)
end
UERegs(Value::Vector{Int}) = UERegs(DSS_DEFAULT_CTX, Value)

"""Weighting factor applied to UE register values. (Getter)"""
function UEWeight(dss::DSSContext)::Float64
    return @checked Lib.Settings_Get_UEweight(dss.ctx)
end
UEWeight() = UEWeight(DSS_DEFAULT_CTX)

"""Weighting factor applied to UE register values. (Setter)"""
function UEWeight(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_UEweight(dss.ctx, Value)
end
UEWeight(Value::Float64) = UEWeight(DSS_DEFAULT_CTX, Value)

"""Array of doubles defining the legal voltage bases in kV L-L (Getter)"""
function VoltageBases(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Settings_Get_VoltageBases, dss.ctx)
end
VoltageBases() = VoltageBases(DSS_DEFAULT_CTX)

"""Array of doubles defining the legal voltage bases in kV L-L (Setter)"""
function VoltageBases(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Settings_Set_VoltageBases(dss.ctx, ValuePtr, ValueCount)
end
VoltageBases(Value::Vector{Float64}) = VoltageBases(DSS_DEFAULT_CTX, Value)

"""{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs. (Getter)"""
function ZoneLock(dss::DSSContext)::Bool
    return @checked(Lib.Settings_Get_ZoneLock(dss.ctx)) != 0
end
ZoneLock() = ZoneLock(DSS_DEFAULT_CTX)

"""{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs. (Setter)"""
function ZoneLock(dss::DSSContext, Value::Bool)
    @checked Lib.Settings_Set_ZoneLock(dss.ctx, Value ? 1 : 0)
end
ZoneLock(Value::Bool) = ZoneLock(DSS_DEFAULT_CTX, Value)

"""Sets all load allocation factors for all loads defined by XFKVA property to this value (Setter)"""
function AllocationFactors(dss::DSSContext, Value::Float64)
    @checked Lib.Settings_Set_AllocationFactors(dss.ctx, Value)
end
AllocationFactors(Value::Float64) = AllocationFactors(DSS_DEFAULT_CTX, Value)

"""
Get/Set the state of terminal checking in all load elements. (Getter)

This controls whether the terminals are checked when updating the currents in Load component. Defaults to true.
If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to false to save some time.

(API Extension)
"""
function LoadsTerminalCheck(dss::DSSContext)::Bool
    return @checked(Lib.Settings_Get_LoadsTerminalCheck(dss.ctx)) != 0
end
LoadsTerminalCheck() = LoadsTerminalCheck(DSS_DEFAULT_CTX)

"""
Get/Set the state of terminal checking in all load elements. (Setter)

This controls whether the terminals are checked when updating the currents in Load component. Defaults to true.
If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to false to save some time.

(API Extension)
"""
function LoadsTerminalCheck(dss::DSSContext, Value::Bool)
    @checked Lib.Settings_Set_LoadsTerminalCheck(dss.ctx, Value ? 1 : 0)
end
LoadsTerminalCheck(Value::Bool) = LoadsTerminalCheck(DSS_DEFAULT_CTX, Value)

"""Controls whether `First`/`Next` iteration includes or skips disabled circuit elements.
The default behavior from OpenDSS is to skip those. The user can still activate the element by name or index.

The default value for IterateDisabled is 0, keeping the original behavior.
Set it to 1 (or `True`) to include disabled elements.
Other numeric values are reserved for other potential behaviors.

(Getter)
(API Extension)"""
function IterateDisabled(dss::DSSContext)::Bool
    return (@checked Lib.Settings_Get_IterateDisabled(dss.ctx)) != 0
end
IterateDisabled() = IterateDisabled(DSS_DEFAULT_CTX)

"""Controls whether `First`/`Next` iteration includes or skips disabled circuit elements.
The default behavior from OpenDSS is to skip those. The user can still activate the element by name or index.

The default value for IterateDisabled is 0, keeping the original behavior.
Set it to 1 (or `True`) to include disabled elements.
Other numeric values are reserved for other potential behaviors.

(Setter)
(API Extension) """
function IterateDisabled(dss::DSSContext, Value::Bool)
    return @checked Lib.Settings_Set_IterateDisabled(dss.ctx, Value)
end
IterateDisabled(Value::Bool) = IterateDisabled(DSS_DEFAULT_CTX, Value)

end
