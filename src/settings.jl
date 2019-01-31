module Settings

    using ..Lib
    using ..Utils

    """{True | False*} Designates whether to allow duplicate names of objects"""
    function AllowDuplicates()::Bool
        return Lib.Settings_Get_AllowDuplicates() != 0
    end

    """{True | False*} Designates whether to allow duplicate names of objects"""
    function AllowDuplicates(Value::Bool)
        Lib.Settings_Set_AllowDuplicates(Value ? 1 : 0)
    end

    """List of Buses or (File=xxxx) syntax for the AutoAdd solution mode."""
    function AutoBusList()::String
        return get_string(Lib.Settings_Get_AutoBusList())
    end

    """List of Buses or (File=xxxx) syntax for the AutoAdd solution mode."""
    function AutoBusList(Value::String)
        Lib.Settings_Set_AutoBusList(Value)
    end

    """{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence."""
    function CktModel()::Int
        return Lib.Settings_Get_CktModel()
    end

    """{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence."""
    function CktModel(Value::Int)
        Lib.Settings_Set_CktModel(Value)
    end

    """{True | False*} Denotes whether to trace the control actions to a file."""
    function ControlTrace()::Bool
        return Lib.Settings_Get_ControlTrace() != 0
    end

    """{True | False*} Denotes whether to trace the control actions to a file."""
    function ControlTrace(Value::Bool)
        Lib.Settings_Set_ControlTrace(Value ? 1 : 0)
    end

    """Per Unit maximum voltage for Emergency conditions."""
    function EmergVmaxpu()::Float64
        return Lib.Settings_Get_EmergVmaxpu()
    end

    """Per Unit maximum voltage for Emergency conditions."""
    function EmergVmaxpu(Value::Float64)
        Lib.Settings_Set_EmergVmaxpu(Value)
    end

    """Per Unit minimum voltage for Emergency conditions."""
    function EmergVminpu()::Float64
        return Lib.Settings_Get_EmergVminpu()
    end

    """Per Unit minimum voltage for Emergency conditions."""
    function EmergVminpu(Value::Float64)
        Lib.Settings_Set_EmergVminpu(Value)
    end

    """Integer array defining which energy meter registers to use for computing losses"""
    function LossRegs()::Vector{Int}
        return get_int32_array(Lib.Settings_Get_LossRegs)
    end

    """Integer array defining which energy meter registers to use for computing losses"""
    function LossRegs(Value::Vector{Int})
        @error "Not implemented yet. Please contact the developers."
        # TODO: prepare_int32_array
        Value, ValuePtr, ValueCount = prepare_int32_array(Value)
        Lib.Settings_Set_LossRegs(ValuePtr, ValueCount)
    end

    """Weighting factor applied to Loss register values."""
    function LossWeight()::Float64
        return Lib.Settings_Get_LossWeight()
    end

    """Weighting factor applied to Loss register values."""
    function LossWeight(Value::Float64)
        Lib.Settings_Set_LossWeight(Value)
    end

    """Per Unit maximum voltage for Normal conditions."""
    function NormVmaxpu()::Float64
        return Lib.Settings_Get_NormVmaxpu()
    end

    """Per Unit maximum voltage for Normal conditions."""
    function NormVmaxpu(Value::Float64)
        Lib.Settings_Set_NormVmaxpu(Value)
    end

    """Per Unit minimum voltage for Normal conditions."""
    function NormVminpu()::Float64
        return Lib.Settings_Get_NormVminpu()
    end

    """Per Unit minimum voltage for Normal conditions."""
    function NormVminpu(Value::Float64)
        Lib.Settings_Set_NormVminpu(Value)
    end

    """Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc."""
    function PriceCurve()::String
        return get_string(Lib.Settings_Get_PriceCurve())
    end

    """Name of LoadShape object that serves as the source of price signal data for yearly simulations, etc."""
    function PriceCurve(Value::String)
        Lib.Settings_Set_PriceCurve(Value)
    end

    """Price Signal for the Circuit"""
    function PriceSignal()::Float64
        return Lib.Settings_Get_PriceSignal()
    end

    """Price Signal for the Circuit"""
    function PriceSignal(Value::Float64)
        Lib.Settings_Set_PriceSignal(Value)
    end

    """{True | False *} Gets value of trapezoidal integration flag in energy meters."""
    function Trapezoidal()::Bool
        return Lib.Settings_Get_Trapezoidal() != 0
    end

    """{True | False *} Gets value of trapezoidal integration flag in energy meters."""
    function Trapezoidal(Value::Bool)
        Lib.Settings_Set_Trapezoidal(Value ? 1 : 0)
    end

    """Array of Integers defining energy meter registers to use for computing UE"""
    function UERegs()::Vector{Int}
        return get_int32_array(Lib.Settings_Get_UEregs)
    end

    """Array of Integers defining energy meter registers to use for computing UE"""
    function UERegs(Value::Vector{Int})
        @error "Not implemented yet. Please contact the developers."
        # TODO: prepare_int32_array
        Value, ValuePtr, ValueCount = prepare_int32_array(Value)
        Lib.Settings_Set_UEregs(ValuePtr, ValueCount)
    end

    """Weighting factor applied to UE register values."""
    function UEWeight()::Float64
        return Lib.Settings_Get_UEweight()
    end

    """Weighting factor applied to UE register values."""
    function UEWeight(Value::Float64)
        Lib.Settings_Set_UEweight(Value)
    end

    """Array of doubles defining the legal voltage bases in kV L-L"""
    function VoltageBases()::Vector{Float64}
        return get_float64_array(Lib.Settings_Get_VoltageBases)
    end

    """Array of doubles defining the legal voltage bases in kV L-L"""
    function VoltageBases(Value::Vector{Float64})
        @error "Not implemented yet. Please contact the developers."
        # TODO: prepare_float64_array
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Settings_Set_VoltageBases(ValuePtr, ValueCount)
    end

    """{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs."""
    function ZoneLock()::Bool
        return Lib.Settings_Get_ZoneLock() != 0
    end

    """{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs."""
    function ZoneLock(Value::Bool)
        Lib.Settings_Set_ZoneLock(Value ? 1 : 0)
    end

    """(write-only) Sets all load allocation factors for all loads defined by XFKVA property to this value."""
    function AllocationFactors(Value::Float64)
        Lib.Settings_Set_AllocationFactors(Value)
    end

end

