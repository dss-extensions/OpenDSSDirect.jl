module Reactor
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection
using ..XYcurve: XYcurveObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PDElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Reactor"
const _cls_idx = 23

module _PropertyIndex
const Bus1 = Int32(1)
const Bus2 = Int32(2)
const Phases = Int32(3)
const kvar = Int32(4)
const kV = Int32(5)
const Conn = Int32(6)
const RMatrix = Int32(7)
const XMatrix = Int32(8)
const Parallel = Int32(9)
const R = Int32(10)
const X = Int32(11)
const Rp = Int32(12)
const Z1 = Int32(13)
const Z2 = Int32(14)
const Z0 = Int32(15)
const Z = Int32(16)
const RCurve = Int32(17)
const LCurve = Int32(18)
const LmH = Int32(19)
const NormAmps = Int32(20)
const EmergAmps = Int32(21)
const FaultRate = Int32(22)
const pctPerm = Int32(23)
const Repair = Int32(24)
const BaseFreq = Int32(25)
const Enabled = Int32(26)
const Like = Int32(27)
end

struct ReactorObj <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export ReactorObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = ReactorObj(ptr, dss)
const Obj = ReactorObj

function Base.show(io::IO, obj::ReactorObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of first bus. Examples:
bus1=busname
bus1=busname.1.2.3

Bus2 property will default to this bus, node 0, unless previously specified. Only Bus1 need be specified for a Yg shunt reactor.

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

Bus2 property will default to this bus, node 0, unless previously specified. Only Bus1 need be specified for a Yg shunt reactor.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.

Not necessary to specify for delta (LL) connection

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.

Not necessary to specify for delta (LL) connection

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
Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately

Name: `kvar`
Units: kvar
Default: 100.0

(Getter)
"""
function kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvar)
end

"""
Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately

Name: `kvar`
Units: kvar
Default: 100.0

(Setter)
"""
function kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvar, value, flags)
end

"""
For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN. If Delta, then only one terminal.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN. If Delta, then only one terminal.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN. If Delta, then only one terminal.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN. If Delta, then only one terminal.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
={wye | delta |LN |LL}  Default is wye, which is equivalent to LN. If Delta, then only one terminal.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Resistance matrix, lower triangle, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.

Name: `RMatrix`

(Getter)
"""
function RMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.RMatrix; matrix=true)
end

"""
Resistance matrix, lower triangle, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.

Name: `RMatrix`

(Setter)
"""
function RMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RMatrix, value, flags)
end
RMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = RMatrix(obj, value[:], flags)

"""
Reactance matrix, lower triangle, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.

Name: `XMatrix`

(Getter)
"""
function XMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.XMatrix; matrix=true)
end

"""
Reactance matrix, lower triangle, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X.

Name: `XMatrix`

(Setter)
"""
function XMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XMatrix, value, flags)
end
XMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = XMatrix(obj, value[:], flags)

"""
Indicates whether Rmatrix and Xmatrix are to be considered in parallel. Default is series. For other models, specify R and Rp.

Name: `Parallel`
Default: False

(Getter)
"""
function Parallel(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Parallel)
end

"""
Indicates whether Rmatrix and Xmatrix are to be considered in parallel. Default is series. For other models, specify R and Rp.

Name: `Parallel`
Default: False

(Setter)
"""
function Parallel(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Parallel, value, flags)
end

"""
Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z.

Name: `R`
Units: Ω

(Getter)
"""
function R(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R)
end

"""
Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z.

Name: `R`
Units: Ω

(Setter)
"""
function R(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R, value, flags)
end

"""
Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties.

Name: `X`
Units: Ω

(Getter)
"""
function X(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X)
end

"""
Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties.

Name: `X`
Units: Ω

(Setter)
"""
function X(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X, value, flags)
end

"""
Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified.

Name: `Rp`
Units: Ω

(Getter)
"""
function Rp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Rp)
end

"""
Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified.

Name: `Rp`
Units: Ω

(Setter)
"""
function Rp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Rp, value, flags)
end

"""
Positive-sequence impedance, ohms, as a 2-element array representing a complex number. Example: 

Z1=[1, 2]  ! represents 1 + j2 

If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR. Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.

Side Effect: Sets Z2 and Z0 to same values unless they were previously defined.

Name: `Z1`
Units: Ω
Default: [0.0, 0.0]

(Getter)
"""
function Z1(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.Z1)
end

"""
Positive-sequence impedance, ohms, as a 2-element array representing a complex number. Example: 

Z1=[1, 2]  ! represents 1 + j2 

If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR. Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.

Side Effect: Sets Z2 and Z0 to same values unless they were previously defined.

Name: `Z1`
Units: Ω
Default: [0.0, 0.0]

(Setter)
"""
function Z1(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.Z1, value, flags)
end

"""
Negative-sequence impedance, ohms, as a 2-element array representing a complex number. Example: 

Z2=[1, 2]  ! represents 1 + j2 

Used to define the impedance matrix of the REACTOR if Z1 is also specified. 

Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.

Name: `Z2`
Units: Ω
Default: [0.0, 0.0]

(Getter)
"""
function Z2(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.Z2)
end

"""
Negative-sequence impedance, ohms, as a 2-element array representing a complex number. Example: 

Z2=[1, 2]  ! represents 1 + j2 

Used to define the impedance matrix of the REACTOR if Z1 is also specified. 

Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.

Name: `Z2`
Units: Ω
Default: [0.0, 0.0]

(Setter)
"""
function Z2(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.Z2, value, flags)
end

"""
Zer0-sequence impedance, ohms, as a 2-element array representing a complex number. Example: 

Z0=[3, 4]  ! represents 3 + j4 

Used to define the impedance matrix of the REACTOR if Z1 is also specified. 

Note: Z0 defaults to Z1 if it is not specifically defined. 

Name: `Z0`
Units: Ω
Default: [0.0, 0.0]

(Getter)
"""
function Z0(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.Z0)
end

"""
Zer0-sequence impedance, ohms, as a 2-element array representing a complex number. Example: 

Z0=[3, 4]  ! represents 3 + j4 

Used to define the impedance matrix of the REACTOR if Z1 is also specified. 

Note: Z0 defaults to Z1 if it is not specifically defined. 

Name: `Z0`
Units: Ω
Default: [0.0, 0.0]

(Setter)
"""
function Z0(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.Z0, value, flags)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.

Name: `RCurve`

(Getter)
"""
function RCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.RCurve)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.

Name: `RCurve`

(Setter)
"""
function RCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.RCurve, value, flags)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.

Name: `RCurve`

(Getter)
"""
function RCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.RCurve, XYcurveObj)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.

Name: `RCurve`

(Setter)
"""
function RCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.RCurve, value, flags)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency.

Name: `RCurve`

(Setter)
"""
function RCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.RCurve, value, flags)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property.L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.

Name: `LCurve`

(Getter)
"""
function LCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.LCurve)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property.L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.

Name: `LCurve`

(Setter)
"""
function LCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LCurve, value, flags)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property.L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.

Name: `LCurve`

(Getter)
"""
function LCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.LCurve, XYcurveObj)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property.L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.

Name: `LCurve`

(Setter)
"""
function LCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.LCurve, value, flags)
end

"""
Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property.L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz.

Name: `LCurve`

(Setter)
"""
function LCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LCurve, value, flags)
end

"""
Inductance, mH. Alternate way to define the reactance, X, property.

Name: `LmH`
Units: mH

(Getter)
"""
function LmH(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.LmH)
end

"""
Inductance, mH. Alternate way to define the reactance, X, property.

Name: `LmH`
Units: mH

(Setter)
"""
function LmH(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.LmH, value, flags)
end

"""
Normal rated current. Defaults to per-phase rated current when reactor is specified with rated power and voltage.

Name: `NormAmps`
Units: A

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal rated current. Defaults to per-phase rated current when reactor is specified with rated power and voltage.

Name: `NormAmps`
Units: A

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Maximum or emerg current. Defaults to 135% of per-phase rated current when reactor is specified with rated power and voltage.

Name: `EmergAmps`
Units: A

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Maximum or emerg current. Defaults to 135% of per-phase rated current when reactor is specified with rated power and voltage.

Name: `EmergAmps`
Units: A

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Reactor.faultrate

Name: `FaultRate`
Default: 0.0005

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
Reactor.faultrate

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

end # module Reactor
export Reactor
