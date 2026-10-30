module MeterSection

using ...Enums: OCPDevType as OCPDevTypeEnum
using ..EnergyMeter: EnergyMeterObj
using ...Load: LoadObj
using ...Common

struct MeterSectionObj
    idx::Int32
    meter::EnergyMeterObj
    dss::DSSContext
end

"""
Index of the meter section.
"""
function Index(obj::MeterSectionObj)::Int32
    return obj.idx
end

function AvgRepairTime(obj::MeterSectionObj)::Float64
    obj_get_float64(obj.meter, obj.dss.capi.Alt_MeterSection_AvgRepairTime, obj.idx)
end

function FaultRateXRepairHours(obj::MeterSectionObj)::Float64
    obj_get_float64(obj.meter, obj.dss.capi.Alt_MeterSection_FaultRateXRepairHours, obj.idx)
end

function NumBranches(obj::MeterSectionObj)::Int32
    obj_get_int32(obj.meter, obj.dss.capi.Alt_MeterSection_NumBranches, obj.idx)
end

function NumCustomers(obj::MeterSectionObj)::Int32
    obj_get_int32(obj.meter, obj.dss.capi.Alt_MeterSection_NumCustomers, obj.idx)
end

function OCPDeviceType(obj::MeterSectionObj)::OCPDevTypeEnum.T
    convert(OCPDevTypeEnum.T, obj_get_int32(obj.meter, obj.dss.capi.Alt_MeterSection_OCPDeviceType, obj.idx))
end

function SumBranchFaultRates(obj::MeterSectionObj)::Float64
    obj_get_float64(obj.meter, obj.dss.capi.Alt_MeterSection_SumBranchFaultRates, obj.idx)
end

function SequenceIndex(obj::MeterSectionObj)::Int32
    obj_get_int32(obj.meter, obj.dss.capi.Alt_MeterSection_SequenceIndex, obj.idx)
end

function TotalCustomers(obj::MeterSectionObj)::Int32
    obj_get_int32(obj.meter, obj.dss.capi.Alt_MeterSection_TotalCustomers, obj.idx)
end

function AsDict(obj::MeterSectionObj)::Dict
    return Dict(
        "Index" => Index(obj),
        "AvgRepairTime" => AvgRepairTime(obj),
        "FaultRateXRepairHours" => FaultRateXRepairHours(obj),
        "NumBranches" => NumBranches(obj),
        "NumCustomers" => NumCustomers(obj),
        "OCPDeviceType" => OCPDeviceType(obj),
        "SumBranchFaultRates" => SumBranchFaultRates(obj),
        "SequenceIndex" => SequenceIndex(obj),
        "TotalCustomers" => TotalCustomers(obj)
    )
end

end # module MeterSection
export MeterSection
using .MeterSection: MeterSectionObj

"""Accessor for all power converting elements (PCEs) within the area covered by this energy meter."""
function ZonePCEs(obj::Obj)::Vector{PCElement}
    #TODO: PCElementBatch(obj.dss.capi.Alt_Meter_Get_ZonePCEs, obj)
    obj_get_objs(obj, obj.dss.capi.Alt_Meter_Get_ZonePCEs, PCElement)
end
    
"""Accessor for all zone end elements for this meter."""
function EndElements(obj::Obj)::Vector{CircuitElement}
    #TODO: CircuitElementBatch(obj.dss.capi.Alt_Meter_Get_EndElements, obj)
    obj_get_objs(obj, obj.dss.capi.Alt_Meter_Get_EndElements, CircuitElement)
end

"""Accessor for all branches in the meter zone."""
function Branches(obj::Obj)::Vector{PDElement}
    #TODO: PDElementBatch(obj.dss.capi.Alt_Meter_Get_BranchesInZone, obj)
    obj_get_objs(obj, obj.dss.capi.Alt_Meter_Get_BranchesInZone, PDElement)
end

"""Accessor for all branches in the meter zone (internal SequenceList), in lexical order"""
function Sequence(obj::Obj)::Vector{CircuitElement}
    #TODO: CircuitElementBatch(obj.dss.capi.Alt_Meter_Get_SequenceList, obj)
    obj_get_objs(obj, obj.dss.capi.Alt_Meter_Get_SequenceList, CircuitElement)
end

"""Total Number of customers in this zone (downline from the EnergyMeter)"""
function TotalCustomers(obj::Obj)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_Meter_Get_TotalCustomers)
end

"""Number of zone end elements in the active meter zone."""
function NumEndElements(obj::Obj)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_Meter_Get_NumEndElements)
end

"""Number of feeder sections in this meter's zone"""
function NumSections(obj::Obj)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_Meter_Get_NumSections)
end

"""
Accessor for all loads in the meter zone (internal LoadList).
"""
# **NOTE**: this a snapshot of the loads; if the circuit is updated, 
# the batch is **not** updated automatically, i.e., you need to
# get a new batch from this function.
function Loads(obj::Obj)::Vector{LoadObj}
    #TODO: LoadBatch
    obj_get_objs(obj, obj.dss.capi.Alt_Meter_Get_Loads, LoadObj)
end

"""Calculate reliability indices"""
function DoReliabilityCalc(obj::Obj, assumeRestoration::Bool)
    obj_generic_call(obj, obj.dss.capi.Alt_Meter_DoReliabilityCalc, assumeRestoration)
end

"""
Magnitude of the real part of the Calculated Current (normally determined by solution) 
for the meter to force some behavior on Load Allocation

(Getter)
"""
function CalcCurrent(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Meter_Get_CalcCurrent)
end

"""
Magnitude of the real part of the Calculated Current (normally determined by solution) 
for the meter to force some behavior on Load Allocation

(Setter)
"""
function CalcCurrent(obj::Obj, value::Vector{Float64})
    obj_set_float64s(obj, obj.dss.capi.Alt_Meter_Set_CalcCurrent, value)
end

"""Phase allocation factors for this meter."""
function AllocFactors(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Meter_Get_AllocFactors)
end

"""Phase allocation factors for this meter."""
function AllocFactors(obj::Obj, value::Vector{Float64})
    obj_set_float64s(obj, obj.dss.capi.Alt_Meter_Set_AllocFactors, value)
end

"""Returns a wrapper for a single meter section"""
function Section(obj::Obj, idx::Int)::MeterSectionObj
    return MeterSectionObj(idx, obj, obj.dss)
end
