"""
The PDElements interface allows accessing some common properties and 
methods shared across power delivery elements in the DSS engine.

Users can iterate on all PD elements directly through this interface, 
or enable a PD element through a dedicated interface (e.g. use `Lines.Name`, `Transformers.First/Next`)
and access the properties here.

If you are new to OpenDSS/AltDSS and this classic interface, please read the following document
for an overview of the "active element" paradigm used by COM and the classic APIs:
    
https://dss-extensions.org/classic_api.html#the-active-paradigm
"""
module PDElements

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""
Array of names of all PDElement objects.

**(API Extension)**
"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.PDElements_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active PDElement object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.PDElements_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a PDElement object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.PDElements_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of PDElement Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first PDElement to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next PDElement to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the current active PDElement index (1-based)

**(API Extension)**

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate PDElement by index (1-based)

**(API Extension)**

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.PDElements_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Accumulated failure rate for this branch on downline

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/AccumulatedL.html
"""
function AccumulatedL(dss::DSSContext)::Float64
    return @checked Lib.PDElements_Get_AccumulatedL(dss.ctx)
end
AccumulatedL() = AccumulatedL(DSS_DEFAULT_CTX)

"""
Get/Set Number of failures per year.
For LINE elements: Number of failures per unit length per year.

(Getter)
"""
function FaultRate(dss::DSSContext)::Float64
    return @checked Lib.PDElements_Get_FaultRate(dss.ctx)
end
FaultRate() = FaultRate(DSS_DEFAULT_CTX)

"""
Get/Set Number of failures per year.
For LINE elements: Number of failures per unit length per year.

(Setter)
"""
function FaultRate(dss::DSSContext, Value::Float64)
    @checked Lib.PDElements_Set_FaultRate(dss.ctx, Value)
end
FaultRate(Value::Float64) = FaultRate(DSS_DEFAULT_CTX, Value)

"""
Number of the terminal of active PD element that is on the "from"
side. This is set after the meter zone is determined.

*Requires an energy meter with an updated zone.*
"""
function FromTerminal(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_FromTerminal(dss.ctx)
end
FromTerminal() = FromTerminal(DSS_DEFAULT_CTX)

"""
Boolean indicating of PD element should be treated as a shunt
element rather than a series element. Applies to Capacitor and Reactor
elements in particular.
"""
function IsShunt(dss::DSSContext)::Bool
    return @checked(Lib.PDElements_Get_IsShunt(dss.ctx)) != 0
end
IsShunt() = IsShunt(DSS_DEFAULT_CTX)

"""
Failure rate for this branch. Faults per year including length of line.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/Lambda1.html
"""
function Lambda(dss::DSSContext)::Float64
    return @checked Lib.PDElements_Get_Lambda(dss.ctx)
end
Lambda() = Lambda(DSS_DEFAULT_CTX)

"""
Number of customers, this branch

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/Numcustomers.html
"""
function NumCustomers(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_Numcustomers(dss.ctx)
end
NumCustomers() = NumCustomers(DSS_DEFAULT_CTX)

"""
Sets the parent PD element to be the active circuit element.
Returns 0 if no more elements upline.

*Requires an energy meter with an updated zone.*
"""
function ParentPDElement(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_ParentPDElement(dss.ctx)
end
ParentPDElement() = ParentPDElement(DSS_DEFAULT_CTX)

"""
Average repair time for this element in hours

Original COM help: https://opendss.epri.com/RepairTime.html

(Getter)
"""
function RepairTime(dss::DSSContext)::Float64
    return @checked Lib.PDElements_Get_RepairTime(dss.ctx)
end
RepairTime() = RepairTime(DSS_DEFAULT_CTX)

"""
Average repair time for this element in hours

Original COM help: https://opendss.epri.com/RepairTime.html

(Setter)
"""
function RepairTime(dss::DSSContext, Value::Float64)
    @checked Lib.PDElements_Set_RepairTime(dss.ctx, Value)
end
RepairTime(Value::Float64) = RepairTime(DSS_DEFAULT_CTX, Value)

"""
Integer ID of the feeder section that this PDElement branch is part of

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/SectionID1.html
"""
function SectionID(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_SectionID(dss.ctx)
end
SectionID() = SectionID(DSS_DEFAULT_CTX)

"""
Total miles of line from this element to the end of the zone. For recloser siting algorithm.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/TotalMiles1.html
"""
function TotalMiles(dss::DSSContext)::Float64
    return @checked Lib.PDElements_Get_TotalMiles(dss.ctx)
end
TotalMiles() = TotalMiles(DSS_DEFAULT_CTX)

"""
Total number of customers from this branch to the end of the zone

*Requires a circuit with an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/TotalCustomers1.html
"""
function TotalCustomers(dss::DSSContext)::Int
    return @checked Lib.PDElements_Get_Totalcustomers(dss.ctx)
end
TotalCustomers() = TotalCustomers(DSS_DEFAULT_CTX)

"""
Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.

Original COM help: https://opendss.epri.com/pctPermanent.html

(Getter)
"""
function PctPermanent(dss::DSSContext)::Float64
    return @checked Lib.PDElements_Get_pctPermanent(dss.ctx)
end
PctPermanent() = PctPermanent(DSS_DEFAULT_CTX)

"""
Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.

Original COM help: https://opendss.epri.com/pctPermanent.html

(Setter)
"""
function PctPermanent(dss::DSSContext, Value::Float64)
    @checked Lib.PDElements_Set_pctPermanent(dss.ctx, Value)
end
PctPermanent(Value::Float64) = PctPermanent(DSS_DEFAULT_CTX, Value)

"""
Array of doubles with the maximum current across the conductors, for each PD
element.

By default, only the *first terminal* is used for the maximum current, matching
the behavior of the "export capacity" command. Pass `AllNodes=True` to
force the analysis to all terminals.

See also:
https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/

**(API Extension)**
"""
function AllMaxCurrents(dss::DSSContext, AllNodes::Bool=false)::Vector{Float64}
    return get_float64_array(Lib.PDElements_Get_AllMaxCurrents, dss.ctx, AllNodes)
end
AllMaxCurrents(AllNodes::Bool=false) = AllMaxCurrents(DSS_DEFAULT_CTX, AllNodes)

"""
Array of doubles with the maximum current across the conductors as a percentage
of the Normal Ampere Rating, for each PD element.

By default, only the *first terminal* is used for the maximum current, matching
the behavior of the "export capacity" command. Pass `AllNodes=True` to
force the analysis to all terminals.

See also:
https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/

**(API Extension)**
"""
function AllPctNorm(dss::DSSContext, AllNodes::Bool=false)::Vector{Float64}
    return get_float64_array(Lib.PDElements_Get_AllPctNorm, dss.ctx, AllNodes)
end
AllPctNorm(AllNodes::Bool=false) = AllPctNorm(DSS_DEFAULT_CTX, AllNodes)

"""
Array of doubles with the maximum current across the conductors as a percentage
of the Emergency Ampere Rating, for each PD element.

By default, only the *first terminal* is used for the maximum current, matching
the behavior of the "export capacity" command. Pass `AllNodes=True` to
force the analysis to all terminals.

See also:
https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/

**(API Extension)**
"""
function AllPctEmerg(dss::DSSContext, AllNodes::Bool=false)::Vector{Float64}
    return get_float64_array(Lib.PDElements_Get_AllPctEmerg, dss.ctx, AllNodes)
end
AllPctEmerg(AllNodes::Bool=false) = AllPctEmerg(DSS_DEFAULT_CTX, AllNodes)

"""
Complex array of currents for all conductors, all terminals, for each PD element.

**(API Extension)**
"""
function AllCurrentsAllCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.PDElements_Get_AllCurrents, dss.ctx)
end
AllCurrents() = AllCurrents(DSS_DEFAULT_CTX)

"""
Complex array (magnitude and angle format) of currents for all conductors, all terminals, for each PD element.

**(API Extension)**
"""
function AllCurrentsMagAng(dss::DSSContext)::Vector{Float64}
    return get_complex64_array(Lib.PDElements_Get_AllCurrentsMagAng, dss.ctx)
end
AllCurrentsMagAng() = AllCurrentsMagAng(DSS_DEFAULT_CTX)

"""
Complex double array of Sequence Currents for all conductors of all terminals, for each PD elements.

**(API Extension)**
"""
function AllCplxSeqCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.PDElements_Get_AllCplxSeqCurrents, dss.ctx)
end
AllCplxSeqCurrents() = AllCplxSeqCurrents(DSS_DEFAULT_CTX)

"""
Double array of the symmetrical component currents (magnitudes only) into each 3-phase terminal, for each PD element.

**(API Extension)**
"""
function AllSeqCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_float64_array(Lib.PDElements_Get_AllSeqCurrents, dss.ctx)
end
AllSeqCurrents() = AllSeqCurrents(DSS_DEFAULT_CTX)

"""
Complex array of powers into each conductor of each terminal, for each PD element.

**(API Extension)**
"""
function AllPowers(dss::DSSContext)::Vector{ComplexF64}
    return get_float64_array(Lib.PDElements_Get_AllPowers, dss.ctx)
end
AllPowers() = AllPowers(DSS_DEFAULT_CTX)

"""
Complex array of sequence powers into each 3-phase terminal, for each PD element

**(API Extension)**
"""
function AllSeqPowers(dss::DSSContext)::Vector{ComplexF64}
    return get_float64_array(Lib.PDElements_Get_AllSeqPowers, dss.ctx)
end
AllSeqPowers() = AllSeqPowers(DSS_DEFAULT_CTX)

"""
Integer array listing the number of phases of all PD elements

**(API Extension)**
"""
function AllNumPhases(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.PDElements_Get_AllNumPhases, dss.ctx)
end
AllNumPhases() = AllNumPhases(DSS_DEFAULT_CTX)

"""
Integer array listing the number of conductors of all PD elements

**(API Extension)**
"""
function AllNumConductors(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.PDElements_Get_AllNumConductors, dss.ctx)
end
AllNumConductors() = AllNumConductors(DSS_DEFAULT_CTX)

"""
Integer array listing the number of terminals of all PD elements

**(API Extension)**
"""
function AllNumTerminals(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.PDElements_Get_AllNumTerminals, dss.ctx)
end
AllNumTerminals() = AllNumTerminals(DSS_DEFAULT_CTX)

end
