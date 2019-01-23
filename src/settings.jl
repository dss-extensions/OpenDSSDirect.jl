module Settings

using ..lib
using ..utils

"""{True | False*} Designates whether to allow duplicate names of objects"""
function AllowDuplicates()
    return lib.Settings_Get_AllowDuplicates() != 0
end

"""{True | False*} Designates whether to allow duplicate names of objects"""
function AllowDuplicates(Value)
    lib.Settings_Set_AllowDuplicates(Value)
end

"""List of Buses or (File=xxxx) syntax for the AutoAdd solution mode."""
function AutoBusList()
    return get_string(lib.Settings_Get_AutoBusList())
end

"""List of Buses or (File=xxxx) syntax for the AutoAdd solution mode."""
function AutoBusList(Value::String)
    lib.Settings_Set_AutoBusList(Value)
end

"""{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence."""
function CktModel()
    return lib.Settings_Get_CktModel()
end

"""{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence."""
function CktModel(Value)
    lib.Settings_Set_CktModel(Value)
end

"""{True | False*} Denotes whether to trace the control actions to a file."""
function ControlTrace()
    return lib.Settings_Get_ControlTrace() != 0
end

"""{True | False*} Denotes whether to trace the control actions to a file."""
function ControlTrace(Value)
    lib.Settings_Set_ControlTrace(Value)
end

"""Per Unit maximum voltage for Emergency conditions."""
function EmergVmaxpu()
    return lib.Settings_Get_EmergVmaxpu()
end

"""Per Unit maximum voltage for Emergency conditions."""
function EmergVmaxpu(Value)
    lib.Settings_Set_EmergVmaxpu(Value)
end

"""Per Unit minimum voltage for Emergency conditions."""
function EmergVminpu()
    return lib.Settings_Get_EmergVminpu()
end

"""Per Unit minimum voltage for Emergency conditions."""
function EmergVminpu(Value)
    lib.Settings_Set_EmergVminpu(Value)
end

"""Integer array defining which energy meter registers to use for computing losses"""
function LossRegs()
    return get_int32_array(lib.Settings_Get_LossRegs)
end

"""Integer array defining which energy meter registers to use for computing losses"""
function LossRegs(Value)
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    lib.Settings_Set_LossRegs(ValuePtr, ValueCount)
end

"""Weighting factor applied to Loss register values."""
function LossWeight()
    return lib.Settings_Get_LossWeight()
end

"""Weighting factor applied to Loss register values."""
function LossWeight(Value)
    lib.Settings_Set_LossWeight(Value)
end

"""Per Unit maximum voltage for Normal conditions."""
function NormVmaxpu()
    return lib.Settings_Get_NormVmaxpu()
end

"""Per Unit maximum voltage for Normal conditions."""
function NormVmaxpu(Value)
    lib.Settings_Set_NormVmaxpu(Value)
end

"""Per Unit minimum voltage for Normal conditions."""
function NormVminpu()
    return lib.Settings_Get_NormVminpu()
end

"""Per Unit minimum voltage for Normal conditions."""
function NormVminpu(Value)
    lib.Settings_Set_NormVminpu(Value)
end

"""Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc."""
function PriceCurve()
    return get_string(lib.Settings_Get_PriceCurve())
end

"""Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc."""
function PriceCurve(Value::String)
    lib.Settings_Set_PriceCurve(Value)
end

"""Price Signal for the Circuit"""
function PriceSignal()
    return lib.Settings_Get_PriceSignal()
end

"""Price Signal for the Circuit"""
function PriceSignal(Value)
    lib.Settings_Set_PriceSignal(Value)
end

"""{True | False *} Gets value of trapezoidal integration flag in energy meters."""
function Trapezoidal()
    return lib.Settings_Get_Trapezoidal() != 0
end

"""{True | False *} Gets value of trapezoidal integration flag in energy meters."""
function Trapezoidal(Value)
    lib.Settings_Set_Trapezoidal(Value)
end

"""Array of Integers defining energy meter registers to use for computing UE"""
function UERegs()
    return get_int32_array(lib.Settings_Get_UEregs)
end

"""Array of Integers defining energy meter registers to use for computing UE"""
function UERegs(Value)
    Value, ValuePtr, ValueCount = prepare_int32_array(Value)
    lib.Settings_Set_UEregs(ValuePtr, ValueCount)
end

"""Weighting factor applied to UE register values."""
function UEWeight()
    return lib.Settings_Get_UEweight()
end

"""Weighting factor applied to UE register values."""
function UEWeight(Value)
    lib.Settings_Set_UEweight(Value)
end

"""Array of doubles defining the legal voltage bases in kV L-L"""
function VoltageBases()
    return get_float64_array(lib.Settings_Get_VoltageBases)
end

"""Array of doubles defining the legal voltage bases in kV L-L"""
function VoltageBases(Value)
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    lib.Settings_Set_VoltageBases(ValuePtr, ValueCount)
end

"""{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs."""
function ZoneLock()
    return lib.Settings_Get_ZoneLock() != 0
end

"""{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs."""
function ZoneLock(Value)
    lib.Settings_Set_ZoneLock(Value)
end

"""(write-only) Sets all load allocation factors for all loads defined by XFKVA property to this value."""
function AllocationFactors(Value)
    lib.Settings_Set_AllocationFactors(Value)
end

end

