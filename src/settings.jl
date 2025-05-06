module Settings

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Designates whether to allow duplicate names of objects

False by default.

**NOTE**: for DSS-Extensions, we are considering removing this option in a future
release since it has performance impacts even when not used.

(Getter)
"""
function AllowDuplicates(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Settings_Get_AllowDuplicates, dss.ctx)) != 0
end
AllowDuplicates() = AllowDuplicates(DSS_DEFAULT_CTX)

"""
Designates whether to allow duplicate names of objects

False by default.

**NOTE**: for DSS-Extensions, we are considering removing this option in a future
release since it has performance impacts even when not used.

(Setter)
"""
function AllowDuplicates(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Settings_Set_AllowDuplicates, dss.ctx, Value ? 1 : 0)
end
AllowDuplicates(Value::Bool) = AllowDuplicates(DSS_DEFAULT_CTX, Value)

"""
List of Buses or (File=xxxx) syntax for the AutoAdd solution mode.

Original COM help: https://opendss.epri.com/AutoBusList.html

(Getter)
"""
function AutoBusList(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Settings_Get_AutoBusList, dss.ctx))
end
AutoBusList() = AutoBusList(DSS_DEFAULT_CTX)

"""
List of Buses or (File=xxxx) syntax for the AutoAdd solution mode.

Original COM help: https://opendss.epri.com/AutoBusList.html

(Setter)
"""
function AutoBusList(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Settings_Set_AutoBusList, dss.ctx, Value)
end
AutoBusList(Value::String) = AutoBusList(DSS_DEFAULT_CTX, Value)

"""
Indicate if the circuit model is positive sequence.

Original COM help: https://opendss.epri.com/CktModel.html

(Getter)
"""
function CktModel(dss::DSSContext)::Lib.CktModels
    return @checked dss_ccall(dss.capi.Settings_Get_CktModel, dss.ctx)
end
CktModel() = CktModel(DSS_DEFAULT_CTX)

"""
Indicate if the circuit model is positive sequence.

Original COM help: https://opendss.epri.com/CktModel.html

(Setter)
"""
function CktModel(dss::DSSContext, Value::Union{Int,Lib.CktModels})
    Value = convert(Lib.CktModels, Value)
    @checked dss_ccall(dss.capi.Settings_Set_CktModel, dss.ctx, Value)
end
CktModel(Value::Union{Int,Lib.CktModels}) = CktModel(DSS_DEFAULT_CTX, Value)

"""
Denotes whether to trace the control actions to a file.

Original COM help: https://opendss.epri.com/ControlTrace.html

(Getter)
"""
function ControlTrace(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Settings_Get_ControlTrace, dss.ctx)) != 0
end
ControlTrace() = ControlTrace(DSS_DEFAULT_CTX)

"""
Denotes whether to trace the control actions to a file.

Original COM help: https://opendss.epri.com/ControlTrace.html

(Setter)
"""
function ControlTrace(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Settings_Set_ControlTrace, dss.ctx, Value ? 1 : 0)
end
ControlTrace(Value::Bool) = ControlTrace(DSS_DEFAULT_CTX, Value)

"""
Per Unit maximum voltage for Emergency conditions.

Original COM help: https://opendss.epri.com/EmergVmaxpu.html

(Getter)
"""
function EmergVmaxpu(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_EmergVmaxpu, dss.ctx)
end
EmergVmaxpu() = EmergVmaxpu(DSS_DEFAULT_CTX)

"""
Per Unit maximum voltage for Emergency conditions.

Original COM help: https://opendss.epri.com/EmergVmaxpu.html

(Setter)
"""
function EmergVmaxpu(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_EmergVmaxpu, dss.ctx, Value)
end
EmergVmaxpu(Value::Float64) = EmergVmaxpu(DSS_DEFAULT_CTX, Value)

"""
Per Unit minimum voltage for Emergency conditions.

Original COM help: https://opendss.epri.com/EmergVminpu.html

(Getter)
"""
function EmergVminpu(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_EmergVminpu, dss.ctx)
end
EmergVminpu() = EmergVminpu(DSS_DEFAULT_CTX)

"""
Per Unit minimum voltage for Emergency conditions.

Original COM help: https://opendss.epri.com/EmergVminpu.html

(Setter)
"""
function EmergVminpu(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_EmergVminpu, dss.ctx, Value)
end
EmergVminpu(Value::Float64) = EmergVminpu(DSS_DEFAULT_CTX, Value)

"""
Integer array defining which energy meter registers to use for computing losses

Original COM help: https://opendss.epri.com/LossRegs.html

(Getter)
"""
function LossRegs(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.Settings_Get_LossRegs, dss)
end
LossRegs() = LossRegs(DSS_DEFAULT_CTX)

"""
Integer array defining which energy meter registers to use for computing losses

Original COM help: https://opendss.epri.com/LossRegs.html

(Setter)
"""
function LossRegs(dss::DSSContext, Value::Vector{Int})
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked dss_ccall(dss.capi.Settings_Set_LossRegs, dss.ctx, ValuePtr, ValueCount)
end
LossRegs(Value::Vector{Int}) = LossRegs(DSS_DEFAULT_CTX, Value)

"""
Weighting factor applied to Loss register values.

Original COM help: https://opendss.epri.com/LossWeight.html

(Getter)
"""
function LossWeight(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_LossWeight, dss.ctx)
end
LossWeight() = LossWeight(DSS_DEFAULT_CTX)

"""
Weighting factor applied to Loss register values.

Original COM help: https://opendss.epri.com/LossWeight.html

(Setter)
"""
function LossWeight(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_LossWeight, dss.ctx, Value)
end
LossWeight(Value::Float64) = LossWeight(DSS_DEFAULT_CTX, Value)

"""
Per Unit maximum voltage for Normal conditions.

Original COM help: https://opendss.epri.com/NormVmaxpu.html

(Getter)
"""
function NormVmaxpu(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_NormVmaxpu, dss.ctx)
end
NormVmaxpu() = NormVmaxpu(DSS_DEFAULT_CTX)

"""
Per Unit maximum voltage for Normal conditions.

Original COM help: https://opendss.epri.com/NormVmaxpu.html

(Setter)
"""
function NormVmaxpu(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_NormVmaxpu, dss.ctx, Value)
end
NormVmaxpu(Value::Float64) = NormVmaxpu(DSS_DEFAULT_CTX, Value)

"""
Per Unit minimum voltage for Normal conditions.

Original COM help: https://opendss.epri.com/NormVminpu.html

(Getter)
"""
function NormVminpu(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_NormVminpu, dss.ctx)
end
NormVminpu() = NormVminpu(DSS_DEFAULT_CTX)

"""
Per Unit minimum voltage for Normal conditions.

Original COM help: https://opendss.epri.com/NormVminpu.html

(Setter)
"""
function NormVminpu(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_NormVminpu, dss.ctx, Value)
end
NormVminpu(Value::Float64) = NormVminpu(DSS_DEFAULT_CTX, Value)

"""
Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.

Original COM help: https://opendss.epri.com/PriceCurve.html

(Getter)
"""
function PriceCurve(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Settings_Get_PriceCurve, dss.ctx))
end
PriceCurve() = PriceCurve(DSS_DEFAULT_CTX)

"""
Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc.

Original COM help: https://opendss.epri.com/PriceCurve.html

(Setter)
"""
function PriceCurve(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Settings_Set_PriceCurve, dss.ctx, Value)
end
PriceCurve(Value::String) = PriceCurve(DSS_DEFAULT_CTX, Value)

"""
Price Signal for the Circuit

Original COM help: https://opendss.epri.com/PriceSignal.html

(Getter)
"""
function PriceSignal(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_PriceSignal, dss.ctx)
end
PriceSignal() = PriceSignal(DSS_DEFAULT_CTX)

"""
Price Signal for the Circuit

Original COM help: https://opendss.epri.com/PriceSignal.html

(Setter)
"""
function PriceSignal(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_PriceSignal, dss.ctx, Value)
end
PriceSignal(Value::Float64) = PriceSignal(DSS_DEFAULT_CTX, Value)

"""
Gets value of trapezoidal integration flag in energy meters. Defaults to `False`.

Original COM help: https://opendss.epri.com/Trapezoidal.html

(Getter)
"""
function Trapezoidal(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Settings_Get_Trapezoidal, dss.ctx)) != 0
end
Trapezoidal() = Trapezoidal(DSS_DEFAULT_CTX)

"""
Gets value of trapezoidal integration flag in energy meters. Defaults to `False`.

Original COM help: https://opendss.epri.com/Trapezoidal.html

(Setter)
"""
function Trapezoidal(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Settings_Set_Trapezoidal, dss.ctx, Value ? 1 : 0)
end
Trapezoidal(Value::Bool) = Trapezoidal(DSS_DEFAULT_CTX, Value)

"""
Array of Integers defining energy meter registers to use for computing UE

Original COM help: https://opendss.epri.com/UEregs.html

(Getter)
"""
function UERegs(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.Settings_Get_UEregs, dss)
end
UERegs() = UERegs(DSS_DEFAULT_CTX)

"""
Array of Integers defining energy meter registers to use for computing UE

Original COM help: https://opendss.epri.com/UEregs.html

(Setter)
"""
function UERegs(dss::DSSContext, Value::Vector{Int})
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    @checked dss_ccall(dss.capi.Settings_Set_UEregs, dss.ctx, ValuePtr, ValueCount)
end
UERegs(Value::Vector{Int}) = UERegs(DSS_DEFAULT_CTX, Value)

"""
Weighting factor applied to UE register values.

Original COM help: https://opendss.epri.com/UEweight.html

(Getter)
"""
function UEWeight(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Settings_Get_UEweight, dss.ctx)
end
UEWeight() = UEWeight(DSS_DEFAULT_CTX)

"""
Weighting factor applied to UE register values.

Original COM help: https://opendss.epri.com/UEweight.html

(Setter)
"""
function UEWeight(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_UEweight, dss.ctx, Value)
end
UEWeight(Value::Float64) = UEWeight(DSS_DEFAULT_CTX, Value)

"""
Array of doubles defining the legal voltage bases in kV L-L

Original COM help: https://opendss.epri.com/VoltageBases.html

(Getter)
"""
function VoltageBases(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Settings_Get_VoltageBases, dss)
end
VoltageBases() = VoltageBases(DSS_DEFAULT_CTX)

"""
Array of doubles defining the legal voltage bases in kV L-L

Original COM help: https://opendss.epri.com/VoltageBases.html

(Setter)
"""
function VoltageBases(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Settings_Set_VoltageBases, dss.ctx, ValuePtr, ValueCount)
end
VoltageBases(Value::Vector{Float64}) = VoltageBases(DSS_DEFAULT_CTX, Value)

"""
Locks Zones on energy meters to prevent rebuilding if a circuit change occurs.

Original COM help: https://opendss.epri.com/ZoneLock.html

(Getter)
"""
function ZoneLock(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Settings_Get_ZoneLock, dss.ctx)) != 0
end
ZoneLock() = ZoneLock(DSS_DEFAULT_CTX)

"""
Locks Zones on energy meters to prevent rebuilding if a circuit change occurs.

Original COM help: https://opendss.epri.com/ZoneLock.html

(Setter)
"""
function ZoneLock(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Settings_Set_ZoneLock, dss.ctx, Value ? 1 : 0)
end
ZoneLock(Value::Bool) = ZoneLock(DSS_DEFAULT_CTX, Value)

"""Sets all load allocation factors for all loads defined by XFKVA property to this value."""
function AllocationFactors(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Settings_Set_AllocationFactors, dss.ctx, Value)
end
AllocationFactors(Value::Float64) = AllocationFactors(DSS_DEFAULT_CTX, Value)

"""
Controls whether the terminals are checked when updating the currents in Load component. Defaults to True.
If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to False to save some time.

**(API Extension)**

(Getter)
"""
function LoadsTerminalCheck(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Settings_Get_LoadsTerminalCheck, dss.ctx)) != 0
end
LoadsTerminalCheck() = LoadsTerminalCheck(DSS_DEFAULT_CTX)

"""
Controls whether the terminals are checked when updating the currents in Load component. Defaults to True.
If the loads are guaranteed to have their terminals closed throughout the simulation, this can be set to False to save some time.

**(API Extension)**

(Setter)
"""
function LoadsTerminalCheck(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Settings_Set_LoadsTerminalCheck, dss.ctx, Value ? 1 : 0)
end
LoadsTerminalCheck(Value::Bool) = LoadsTerminalCheck(DSS_DEFAULT_CTX, Value)

"""
Controls whether `First`/`Next` iteration includes or skips disabled circuit elements.
The default behavior from OpenDSS is to skip those. The user can still activate the element by name or index.

The default value for IterateDisabled is 0, keeping the original behavior.
Set it to 1 (or `True`) to include disabled elements.
Other numeric values are reserved for other potential behaviors.

**(API Extension)**

(Getter)
"""
function IterateDisabled(dss::DSSContext)::Bool
    return (@checked dss_ccall(dss.capi.Settings_Get_IterateDisabled, dss.ctx)) != 0
end
IterateDisabled() = IterateDisabled(DSS_DEFAULT_CTX)

"""
Controls whether `First`/`Next` iteration includes or skips disabled circuit elements.
The default behavior from OpenDSS is to skip those. The user can still activate the element by name or index.

The default value for IterateDisabled is 0, keeping the original behavior.
Set it to 1 (or `True`) to include disabled elements.
Other numeric values are reserved for other potential behaviors.

**(API Extension)**

(Setter)
"""
function IterateDisabled(dss::DSSContext, Value::Bool)
    return @checked dss_ccall(dss.capi.Settings_Set_IterateDisabled, dss.ctx, Value)
end
IterateDisabled(Value::Bool) = IterateDisabled(DSS_DEFAULT_CTX, Value)

"""
Regular expression pattern to skip files.

If a file name as provided in the input for the `Redirect` and `Compile` commands
matches the regular expression pattern, it is skipped (the file is not read nor
commands contained in the file are executed).

Set to an empty string to reset/disable the filter.

Case-insensitive.
See https://regex.sorokin.engineer/en/latest/regular_expressions.html for information on 
the expression syntax and options.

Even if the `clear` command is included in `Settings.SkipCommands()`, the `DSS.ClearAll()` method can 
still be called. It resets both skip settings, `SkipCommands()` and `SkipFileRegExp()`.

**(API Extension)**

(Getter)
"""
function SkipFileRegExp(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Settings_Get_SkipFileRegExp, dss.ctx))
end
SkipFileRegExp() = SkipFileRegExp(DSS_DEFAULT_CTX)

"""
Regular expression pattern to skip files.

If a file name as provided in the input for the `Redirect` and `Compile` commands
matches the regular expression pattern, it is skipped (the file is not read nor
commands contained in the file are executed).

Set to an empty string to reset/disable the filter.

Case-insensitive.
See https://regex.sorokin.engineer/en/latest/regular_expressions.html for information on 
the expression syntax and options.

Even if the `clear` command is included in `Settings.SkipCommands()`, the `DSS.ClearAll()` method can 
still be called. It resets both skip settings, `SkipCommands()` and `SkipFileRegExp()`.

**(API Extension)**

(Setter)
"""
function SkipFileRegExp(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Settings_Set_SkipFileRegExp, dss.ctx, Value)
end
SkipFileRegExp(Value::Float64) = SkipFileRegExp(DSS_DEFAULT_CTX, Value)

"""
Switch the property names according to the target style.

Use this method for compatibility with code that doesn't consider that
OpenDSS is case insensitive. Check the enumeration for more: `DSSPropertyNameStyle`

**(API Extension)**
"""
function SetPropertyNameStyle(dss::DSSContext, Value::Union{Int,Lib.DSSPropertyNameStyle})
    Value = convert(Lib.DSSPropertyNameStyle, Value)
    dss_ccall(dss.capi.Settings_SetPropertyNameStyle, Value)
end
SetPropertyNameStyle(Value::Union{Int,Lib.DSSPropertyNameStyle}) = SetPropertyNameStyle(DSS_DEFAULT_CTX, Value)

"""
List of commands to skip

List of strings representing the command names to skip when processing DSS text commands or files.

If the `clear` command is included in `Settings.SkipCommands`, the `DSS.ClearAll()` method can 
still be called and it will reset both skip settings, `SkipCommands` and `SkipFileRegExp`.

**(API Extension)**

(Getter)
"""
function SkipCommands(dss::DSSContext)::Vector{String}
    int_commands = get_int32_array(dss.capi.Settings_Get_SkipCommands, dss)
    return [Executive.Command(dss, i) for i in int_commands]
end
SkipCommands() = SkipCommands(DSS_DEFAULT_CTX)

"""
List of commands to skip

List of strings representing the command names to skip when processing DSS text commands or files.

If the `clear` command is included in `Settings.SkipCommands`, the `DSS.ClearAll()` method can 
still be called and it will reset both skip settings, `SkipCommands` and `SkipFileRegExp`.

**(API Extension)**

(Setter)
"""
function SkipCommands(dss::DSSContext, Value::Vector{String})
    # Map the strings to integer indices; let the KeyError raise if invalid commands are passed
    str_commands = Dict(lowercase(Executive.Command(dss, i)) => i for i in 1:Executive.NumCommands(dss))
    int_commands = [str_commands[lowercase(s)] for s in str_commands]
    value, value_ptr, value_cnt = prepare_int32_array(int_commands)
    @checked dss_ccall(dss.capi.Settings_Set_SkipCommands, dss.ctx, value_ptr, value_cnt)
end
SkipCommands(Value::Vector{String}) = SkipCommands(DSS_DEFAULT_CTX, Value)

end
