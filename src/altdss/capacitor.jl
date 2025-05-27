module Capacitor
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection
import Base: convert
using ..Common
using ..CircuitElement
using ..PDElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Capacitor"
const _cls_idx = 22

module _PropertyIndex
const Bus1 = Int32(1)
const Bus2 = Int32(2)
const Phases = Int32(3)
const kvar = Int32(4)
const kV = Int32(5)
const Conn = Int32(6)
const CMatrix = Int32(7)
const Cuf = Int32(8)
const R = Int32(9)
const XL = Int32(10)
const Harm = Int32(11)
const NumSteps = Int32(12)
const States = Int32(13)
const NormAmps = Int32(14)
const EmergAmps = Int32(15)
const FaultRate = Int32(16)
const pctPerm = Int32(17)
const Repair = Int32(18)
const BaseFreq = Int32(19)
const Enabled = Int32(20)
const Like = Int32(21)
end

struct CapacitorObj <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export CapacitorObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = CapacitorObj(ptr, dss)
const Obj = CapacitorObj

function Base.show(io::IO, obj::CapacitorObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of first bus of 2-terminal capacitor. Examples:
bus1=busname
bus1=busname.1.2.3

If only one bus specified, Bus2 will default to this bus, Node 0, and the capacitor will be a Yg shunt bank.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of first bus of 2-terminal capacitor. Examples:
bus1=busname
bus1=busname.1.2.3

If only one bus specified, Bus2 will default to this bus, Node 0, and the capacitor will be a Yg shunt bank.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 explicitly specified. 

Not necessary to specify for delta (LL) connection.

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 explicitly specified. 

Not necessary to specify for delta (LL) connection.

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Number of phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Total kvar, if one step, or ARRAY of kvar ratings for each step.  Evenly divided among phases. See rules for NUMSTEPS.

Name: `kvar`
Units: kvar
Default: [1200.0]

(Getter)
"""
function kvar(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.kvar)
end

"""
Total kvar, if one step, or ARRAY of kvar ratings for each step.  Evenly divided among phases. See rules for NUMSTEPS.

Name: `kvar`
Units: kvar
Default: [1200.0]

(Setter)
"""
function kvar(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.kvar, value, flags)
end

"""
For 2, 3-phase, kV phase-phase. Otherwise specify actual can rating.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
For 2, 3-phase, kV phase-phase. Otherwise specify actual can rating.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Nodal cap. matrix, lower triangle, of the following form:

cmatrix="c11 | -c21 c22 | -c31 -c32 c33"

All steps are assumed the same if this property is used.

Name: `CMatrix`
Units: μF

(Getter)
"""
function CMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.CMatrix; matrix=true)
end

"""
Nodal cap. matrix, lower triangle, of the following form:

cmatrix="c11 | -c21 c22 | -c31 -c32 c33"

All steps are assumed the same if this property is used.

Name: `CMatrix`
Units: μF

(Setter)
"""
function CMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.CMatrix, value, flags)
end
CMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = CMatrix(obj, value[:], flags)

"""
ARRAY of Capacitance, each phase, for each step.
See Rules for NumSteps.

Name: `Cuf`
Units: μF

(Getter)
"""
function Cuf(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Cuf)
end

"""
ARRAY of Capacitance, each phase, for each step.
See Rules for NumSteps.

Name: `Cuf`
Units: μF

(Setter)
"""
function Cuf(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Cuf, value, flags)
end

"""
ARRAY of series resistance in each phase (line), ohms.

Name: `R`
Default: [0.0]

(Getter)
"""
function R(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.R)
end

"""
ARRAY of series resistance in each phase (line), ohms.

Name: `R`
Default: [0.0]

(Setter)
"""
function R(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.R, value, flags)
end

"""
ARRAY of series inductive reactance(s) in each phase (line) for filter, ohms at base frequency. Use this OR "h" property to define filter.

Name: `XL`
Default: [0.0]

(Getter)
"""
function XL(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.XL)
end

"""
ARRAY of series inductive reactance(s) in each phase (line) for filter, ohms at base frequency. Use this OR "h" property to define filter.

Name: `XL`
Default: [0.0]

(Setter)
"""
function XL(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XL, value, flags)
end

"""
ARRAY of harmonics to which each step is tuned. Zero is interpreted as meaning zero reactance (no filter). Default is zero.

Name: `Harm`
Default: [0.0]

(Getter)
"""
function Harm(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Harm)
end

"""
ARRAY of harmonics to which each step is tuned. Zero is interpreted as meaning zero reactance (no filter). Default is zero.

Name: `Harm`
Default: [0.0]

(Setter)
"""
function Harm(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Harm, value, flags)
end

"""
Number of steps in this capacitor bank. Forces reallocation of the capacitance, reactor, and states array.  Rules: If this property was previously =1, the value in the kvar property is divided equally among the steps. The kvar property does not need to be reset if that is accurate.  If the Cuf or Cmatrix property was used previously, all steps are set to the value of the first step. The states property is set to all steps on. All filter steps are set to the same harmonic. If this property was previously >1, the arrays are reallocated, but no values are altered. You must SUBSEQUENTLY assign all array properties.

Name: `NumSteps`

(Getter)
"""
function NumSteps(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NumSteps)
end

"""
Number of steps in this capacitor bank. Forces reallocation of the capacitance, reactor, and states array.  Rules: If this property was previously =1, the value in the kvar property is divided equally among the steps. The kvar property does not need to be reset if that is accurate.  If the Cuf or Cmatrix property was used previously, all steps are set to the value of the first step. The states property is set to all steps on. All filter steps are set to the same harmonic. If this property was previously >1, the arrays are reallocated, but no values are altered. You must SUBSEQUENTLY assign all array properties.

Name: `NumSteps`

(Setter)
"""
function NumSteps(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NumSteps, value, flags)
end


"""
ARRAY of integers {1|0} states representing the state of each step (on|off). Defaults to 1 when reallocated (on). Capcontrol will modify this array as it turns steps on or off.

Name: `States`
Default: [1]

(Getter)
"""
function States(obj::Obj)::Vector{Int32}
    obj_get_int32s(obj, _PropertyIndex.States)
end

"""
ARRAY of integers {1|0} states representing the state of each step (on|off). Defaults to 1 when reallocated (on). Capcontrol will modify this array as it turns steps on or off.

Name: `States`
Default: [1]

(Setter)
"""
function States(obj::Obj, value::Vector{Int32}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.States, value, flags)
end

"""
Normal rated current. Defaults to 180% of per-phase rated current.

Name: `NormAmps`
Default: 75.00460594123444

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal rated current. Defaults to 180% of per-phase rated current.

Name: `NormAmps`
Default: 75.00460594123444

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Maximum or emerg current. Defaults to 180% of per-phase rated current.

Name: `EmergAmps`
Default: 100.00614125497927

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Maximum or emerg current. Defaults to 180% of per-phase rated current.

Name: `EmergAmps`
Default: 100.00614125497927

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Capacitor.faultrate

Name: `FaultRate`
Default: 0.0005

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
Capacitor.faultrate

Name: `FaultRate`
Default: 0.0005

(Setter)
"""
function FaultRate(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FaultRate, value, flags)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 100.0

(Getter)
"""
function pctPerm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPerm)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 100.0

(Setter)
"""
function pctPerm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPerm, value, flags)
end

"""
Hours to repair.

Name: `Repair`
Default: 3.0

(Getter)
"""
function Repair(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Repair)
end

"""
Hours to repair.

Name: `Repair`
Default: 3.0

(Setter)
"""
function Repair(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Repair, value, flags)
end

"""
Base Frequency for ratings.

Name: `BaseFreq`
Units: Hz

(Getter)
"""
function BaseFreq(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BaseFreq)
end

"""
Base Frequency for ratings.

Name: `BaseFreq`
Units: Hz

(Setter)
"""
function BaseFreq(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.BaseFreq, value, flags)
end

"""
Indicates whether this element is enabled.

Name: `Enabled`
Default: True

(Getter)
"""
function Enabled(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Enabled)
end

"""
Indicates whether this element is enabled.

Name: `Enabled`
Default: True

(Setter)
"""
function Enabled(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Enabled, value, flags)
end

"""
Make like another object, e.g.:

New Capacitor.C2 like=c1  ...

**Deprecated:** `Like` has been deprecated since at least 2021, see https://sourceforge.net/p/electricdss/discussion/861977/thread/8b59d21eb6/#b57c/f668

Name: `Like`
"""
function Like(obj::Obj, value::String)
    obj_set_str(obj, _PropertyIndex.Like, value)
end

end # module Capacitor
export Capacitor
