module Fault
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using ..CircuitElement
using ..PDElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Fault"
const _cls_idx = 25

module _PropertyIndex
const Bus1 = Int32(1)
const Bus2 = Int32(2)
const Phases = Int32(3)
const R = Int32(4)
const pctStdDev = Int32(5)
const GMatrix = Int32(6)
const OnTime = Int32(7)
const Temporary = Int32(8)
const MinAmps = Int32(9)
const NormAmps = Int32(10)
const EmergAmps = Int32(11)
const FaultRate = Int32(12)
const pctPerm = Int32(13)
const Repair = Int32(14)
const BaseFreq = Int32(15)
const Enabled = Int32(16)
const Like = Int32(17)
end

struct FaultObj <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export FaultObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = FaultObj(ptr, dss)
const Obj = FaultObj

function Base.show(io::IO, obj::FaultObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of first bus. Examples:

bus1=busname
bus1=busname.1.2.3

Bus2 automatically defaults to busname.0.0.0 unless it was previously defined. 

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of first bus. Examples:

bus1=busname
bus1=busname.1.2.3

Bus2 automatically defaults to busname.0.0.0 unless it was previously defined. 

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Name of 2nd bus of the 2-terminal Fault object. Defaults to all phases connected to first bus, node 0, if not specified. (Shunt Wye Connection to ground reference)

That is, the Fault defaults to a ground fault unless otherwise specified.

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of 2nd bus of the 2-terminal Fault object. Defaults to all phases connected to first bus, node 0, if not specified. (Shunt Wye Connection to ground reference)

That is, the Fault defaults to a ground fault unless otherwise specified.

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Number of Phases.

Name: `Phases`
Default: 1

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases.

Name: `Phases`
Default: 1

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Resistance for each phase. Assumed to be Mean value if gaussian random mode.Max value if uniform mode.  A Fault is actually a series resistance that defaults to a wye connection to ground on the second terminal.  You may reconnect the 2nd terminal to achieve whatever connection.  Use the Gmatrix property to specify an arbitrary conductance matrix.

Name: `R`
Units: Ω
Default: 0.0001

(Getter)
"""
function R(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R)
end

"""
Resistance for each phase. Assumed to be Mean value if gaussian random mode.Max value if uniform mode.  A Fault is actually a series resistance that defaults to a wye connection to ground on the second terminal.  You may reconnect the 2nd terminal to achieve whatever connection.  Use the Gmatrix property to specify an arbitrary conductance matrix.

Name: `R`
Units: Ω
Default: 0.0001

(Setter)
"""
function R(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R, value, flags)
end

"""
Percent standard deviation in resistance to assume for Monte Carlo fault (MF) solution mode for GAUSSIAN distribution. Default is 0 (no variation from mean).

Name: `%StdDev`
Default: 0.0

(Getter)
"""
function pctStdDev(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctStdDev)
end

"""
Percent standard deviation in resistance to assume for Monte Carlo fault (MF) solution mode for GAUSSIAN distribution. Default is 0 (no variation from mean).

Name: `%StdDev`
Default: 0.0

(Setter)
"""
function pctStdDev(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctStdDev, value, flags)
end

"""
Use this to specify a nodal conductance (G) matrix to represent some arbitrary resistance network. Specify in lower triangle form as usual for DSS matrices.

Name: `GMatrix`

(Getter)
"""
function GMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.GMatrix; matrix=true)
end

"""
Use this to specify a nodal conductance (G) matrix to represent some arbitrary resistance network. Specify in lower triangle form as usual for DSS matrices.

Name: `GMatrix`

(Setter)
"""
function GMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.GMatrix, value, flags)
end
GMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = GMatrix(obj, value[:], flags)

"""
Time at which the fault is established for time varying simulations. Default is 0 s, on at the beginning of the simulation.

Name: `OnTime`
Units: s
Default: 0.0

(Getter)
"""
function OnTime(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.OnTime)
end

"""
Time at which the fault is established for time varying simulations. Default is 0 s, on at the beginning of the simulation.

Name: `OnTime`
Units: s
Default: 0.0

(Setter)
"""
function OnTime(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.OnTime, value, flags)
end

"""
Designate whether the fault is temporary.  For Time-varying simulations, the fault will be removed if the current through the fault drops below the MINAMPS criteria.

Name: `Temporary`
Default: False

(Getter)
"""
function Temporary(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Temporary)
end

"""
Designate whether the fault is temporary.  For Time-varying simulations, the fault will be removed if the current through the fault drops below the MINAMPS criteria.

Name: `Temporary`
Default: False

(Setter)
"""
function Temporary(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Temporary, value, flags)
end

"""
Minimum current that can sustain a temporary fault.

Name: `MinAmps`
Units: A
Default: 5.0

(Getter)
"""
function MinAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MinAmps)
end

"""
Minimum current that can sustain a temporary fault.

Name: `MinAmps`
Units: A
Default: 5.0

(Setter)
"""
function MinAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MinAmps, value, flags)
end

"""
Normal rated current.

Name: `NormAmps`

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal rated current.

Name: `NormAmps`

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Maximum or emergency current rating.

Name: `EmergAmps`

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Maximum or emergency current rating.

Name: `EmergAmps`

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Fault.faultrate

Name: `FaultRate`
Default: 0.0

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
Fault.faultrate

Name: `FaultRate`
Default: 0.0

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
Default: 0.0

(Getter)
"""
function Repair(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Repair)
end

"""
Hours to repair.

Name: `Repair`
Default: 0.0

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

end # module Fault
export Fault
