"""
The PDElement module contains shared functions for all PD (power delivery) elements.
Its functions are reexported in the dedicated modules for the concrete types 
(e.g. `Line`, `Transformer`, `Reactor` reexport these functions).
"""
module PDElement
using ..Common

"""
Energy Meter this element is assigned to.

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/EnergyMeter.html
"""
function EnergyMeter(obj::AbstractPDElement)::Union{AbstractCircuitElement, Nothing}
    obj_get_obj(obj, obj.dss.capi.Alt_PDE_Get_EnergyMeter, Common._wrap_dss_obj)
end

"""
Name of the Energy Meter this element is assigned to.

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/EnergyMeter.html
"""
function EnergyMeterName(obj::AbstractPDElement)::String
    obj_get_str(obj, obj.dss.capi.Alt_PDE_Get_EnergyMeterName)
end

"""
Indicates if this PD element should be treated as a shunt element rather than a series element. 

Applies to Capacitor, Reactor, Fault and GICTransformer elements.
"""
function IsShunt(obj::AbstractPDElement)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_PDE_Get_IsShunt)
end

"""
Accumulated failure rate for this branch on downline.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/AccumulatedL.html
"""
function AccumulatedL(obj::AbstractPDElement)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PDE_Get_AccumulatedL)
end

"""
Failure rate for this branch. Faults per year including length of line.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/Lambda1.html
"""
function Lambda(obj::AbstractPDElement)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PDE_Get_Lambda)
end

"""
Number of customers, this branch.

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/Numcustomers.html
"""
function NumCustomers(obj::AbstractPDElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_PDE_Get_NumCustomers)
end

"""
Parent PD element of this element, if any. 

*Requires an energy meter with an updated zone.*
"""
function ParentPDElement(obj::AbstractPDElement)::Union{AbstractPDElement, Nothing}
    obj_get_obj(obj, Alt_PDE_Get_ParentPDElement)
end

"""
Total number of customers from this branch to the end of the zone

*Requires a circuit with an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/TotalCustomers1.html
"""
function TotalCustomers(obj::AbstractPDElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_PDE_Get_TotalCustomers)
end

"""
Number of the terminal of this PD element that is on the "from" side. 

*Requires an energy meter with an updated zone.*
"""
function FromTerminal(obj::AbstractPDElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_PDE_Get_FromTerminal)
end

"""
Total miles of line from this element to the end of the zone. For recloser siting algorithm.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/TotalMiles1.html
"""
function TotalMiles(obj::AbstractPDElement)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PDE_Get_TotalMiles)
end

"""
Total kilometers of line from this element to the end of the zone. For recloser siting algorithm.

*Requires a previous call to `RelCalc` command*
"""
function TotalKilometers(obj::AbstractPDElement)::Float64
     obj_get_float64(obj, obj.dss.capi.Alt_PDE_Get_TotalMiles) * 1.609344
end

"""
Integer ID of the feeder section that this PDElement branch is part of.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/SectionID1.html
"""
function SectionID(obj::AbstractPDElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_PDE_Get_SectionID)
end

"""
Maximum current across the conductors as a percentage of the **normal** ampere rating.

By default, only the nodes from the *first terminal* is used for the maximum current, matching
the behavior of the "export capacity" command. Pass `allNodes=True` to 
force the analysis to all terminals.

See also: 
https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/
"""
function pctNormal(obj::AbstractPDElement, allNodes::Bool=false)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PDE_Get_pctNorm, allNodes)
end

"""
Maximum current across the conductors as a percentage of the **emergency** ampere rating.

By default, only the nodes from the *first terminal* is used for the maximum current, matching
the behavior of the "export capacity" command. Pass `allNodes=True` to 
force the analysis to all terminals.

See also: 
https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/
"""
function pctEmergency(obj::AbstractPDElement, allNodes::Bool=false)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_PDE_Get_pctEmerg, allNodes)
end

include("pd_element_exports.jl")

end # module PDElement
export PDElement
