module LineCode
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: LengthUnit, LineType as LineTypeEnum
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "LineCode"
const _cls_idx = 1

module _PropertyIndex
const NPhases = Int32(1)
const R1 = Int32(2)
const X1 = Int32(3)
const R0 = Int32(4)
const X0 = Int32(5)
const C1 = Int32(6)
const C0 = Int32(7)
const Units = Int32(8)
const RMatrix = Int32(9)
const XMatrix = Int32(10)
const CMatrix = Int32(11)
const BaseFreq = Int32(12)
const NormAmps = Int32(13)
const EmergAmps = Int32(14)
const FaultRate = Int32(15)
const PctPerm = Int32(16)
const Repair = Int32(17)
const Kron = Int32(18)
const Rg = Int32(19)
const Xg = Int32(20)
const rho = Int32(21)
const Neutral = Int32(22)
const B1 = Int32(23)
const B0 = Int32(24)
const Seasons = Int32(25)
const Ratings = Int32(26)
const LineType = Int32(27)
const Like = Int32(28)
end

struct LineCodeObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export LineCodeObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = LineCodeObj(ptr, dss)
const Obj = LineCodeObj

function Base.show(io::IO, obj::LineCodeObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of phases in the line this line code data represents.  Setting this property reinitializes the line code.  Impedance matrix is reset for default symmetrical component.

Name: `NPhases`
Default: 3

(Getter)
"""
function NPhases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPhases)
end

"""
Number of phases in the line this line code data represents.  Setting this property reinitializes the line code.  Impedance matrix is reset for default symmetrical component.

Name: `NPhases`
Default: 3

(Setter)
"""
function NPhases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPhases, value, flags)
end

"""
Positive-sequence Resistance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also Rmatrix.

Name: `R1`
Units: Ω/[length_unit]
Default: 0.058

(Getter)
"""
function R1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R1)
end

"""
Positive-sequence Resistance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also Rmatrix.

Name: `R1`
Units: Ω/[length_unit]
Default: 0.058

(Setter)
"""
function R1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R1, value, flags)
end

"""
Positive-sequence Reactance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also Xmatrix

Name: `X1`
Units: Ω/[length_unit]
Default: 0.1206

(Getter)
"""
function X1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X1)
end

"""
Positive-sequence Reactance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also Xmatrix

Name: `X1`
Units: Ω/[length_unit]
Default: 0.1206

(Setter)
"""
function X1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X1, value, flags)
end

"""
Zero-sequence Resistance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.

Name: `R0`
Units: Ω/[length_unit]
Default: 0.1784

(Getter)
"""
function R0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R0)
end

"""
Zero-sequence Resistance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.

Name: `R0`
Units: Ω/[length_unit]
Default: 0.1784

(Setter)
"""
function R0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R0, value, flags)
end

"""
Zero-sequence Reactance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.

Name: `X0`
Units: Ω/[length_unit]
Default: 0.4047

(Getter)
"""
function X0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X0)
end

"""
Zero-sequence Reactance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.

Name: `X0`
Units: Ω/[length_unit]
Default: 0.4047

(Setter)
"""
function X0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X0, value, flags)
end

"""
Positive-sequence capacitance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also Cmatrix and B1.

Name: `C1`
Units: nF/[length_unit]
Default: 3.3999999999999995

(Getter)
"""
function C1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.C1)
end

"""
Positive-sequence capacitance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also Cmatrix and B1.

Name: `C1`
Units: nF/[length_unit]
Default: 3.3999999999999995

(Setter)
"""
function C1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.C1, value, flags)
end

"""
Zero-sequence capacitance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also B0.

Name: `C0`
Units: nF/[length_unit]
Default: 1.5999999999999999

(Getter)
"""
function C0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.C0)
end

"""
Zero-sequence capacitance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition. See also B0.

Name: `C0`
Units: nF/[length_unit]
Default: 1.5999999999999999

(Setter)
"""
function C0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.C0, value, flags)
end

"""
One of (ohms per ...). Assumes units agree with length units given in Line object.

Name: `Units`
Default: none

(Getter)
"""
function Units(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.Units))
end

"""
One of (ohms per ...). Assumes units agree with length units given in Line object.

Name: `Units`
Default: none

(Setter)
"""
function Units(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Units, value, flags)
end

"""
One of (ohms per ...). Assumes units agree with length units given in Line object.

Name: `Units`
Default: none

(Setter)
"""
function Units(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Units, Int32(value), flags)
end

"""
One of (ohms per ...). Assumes units agree with length units given in Line object.

Name: `Units`
Default: none

(Getter)
"""
function Units_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Units)
end

"""
One of (ohms per ...). Assumes units agree with length units given in Line object.

Name: `Units`
Default: none

(Setter)
"""
function Units_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Units(obj, value, flags)
end

"""
Resistance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `RMatrix`
Units: Ω/[length_unit]
Default: [[0.09813333333333332, 0.04013333333333333, 0.04013333333333333], [0.04013333333333333, 0.09813333333333332, 0.04013333333333333], [0.04013333333333333, 0.04013333333333333, 0.09813333333333332]]

(Getter)
"""
function RMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.RMatrix; matrix=true)
end

"""
Resistance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `RMatrix`
Units: Ω/[length_unit]
Default: [[0.09813333333333332, 0.04013333333333333, 0.04013333333333333], [0.04013333333333333, 0.09813333333333332, 0.04013333333333333], [0.04013333333333333, 0.04013333333333333, 0.09813333333333332]]

(Setter)
"""
function RMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RMatrix, value, flags)
end
RMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = RMatrix(obj, value[:], flags)

"""
Reactance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `XMatrix`
Units: Ω/[length_unit]
Default: [[0.2153, 0.0947, 0.0947], [0.0947, 0.2153, 0.0947], [0.0947, 0.0947, 0.2153]]

(Getter)
"""
function XMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.XMatrix; matrix=true)
end

"""
Reactance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `XMatrix`
Units: Ω/[length_unit]
Default: [[0.2153, 0.0947, 0.0947], [0.0947, 0.2153, 0.0947], [0.0947, 0.0947, 0.2153]]

(Setter)
"""
function XMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XMatrix, value, flags)
end
XMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = XMatrix(obj, value[:], flags)

"""
Nodal Capacitance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the shunt capacitance of any line configuration.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `CMatrix`
Units: nF/[length_unit]
Default: [[2.8, -0.5999999999999999, -0.5999999999999999], [-0.5999999999999999, 2.8, -0.5999999999999999], [-0.5999999999999999, -0.5999999999999999, 2.8]]

(Getter)
"""
function CMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.CMatrix; matrix=true)
end

"""
Nodal Capacitance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the shunt capacitance of any line configuration.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `CMatrix`
Units: nF/[length_unit]
Default: [[2.8, -0.5999999999999999, -0.5999999999999999], [-0.5999999999999999, 2.8, -0.5999999999999999], [-0.5999999999999999, -0.5999999999999999, 2.8]]

(Setter)
"""
function CMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.CMatrix, value, flags)
end
CMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = CMatrix(obj, value[:], flags)

"""
Frequency at which impedances are specified.

Name: `BaseFreq`
Units: Hz

(Getter)
"""
function BaseFreq(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BaseFreq)
end

"""
Frequency at which impedances are specified.

Name: `BaseFreq`
Units: Hz

(Setter)
"""
function BaseFreq(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.BaseFreq, value, flags)
end

"""
Normal ampere limit on line.  This is the so-called Planning Limit. It may also be the value above which load will have to be dropped in a contingency.  Usually about 75% - 80% of the emergency (one-hour) rating.

Name: `NormAmps`
Default: 400.0

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal ampere limit on line.  This is the so-called Planning Limit. It may also be the value above which load will have to be dropped in a contingency.  Usually about 75% - 80% of the emergency (one-hour) rating.

Name: `NormAmps`
Default: 400.0

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Emergency ampere limit on line (usually one-hour rating).

Name: `EmergAmps`
Default: 600.0

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Emergency ampere limit on line (usually one-hour rating).

Name: `EmergAmps`
Default: 600.0

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Number of faults per unit length per year.

**Unused** (unused internally by the models, but can be used to transport data)
**Deprecated:** In LineCode objects, "FaultRate" is not used in the DSS engine since 2014. Be sure to fill the values in each Line individually since they are not propagated from the LineCode!

Name: `FaultRate`
Default: 0.1

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
Number of faults per unit length per year.

**Unused** (unused internally by the models, but can be used to transport data)
**Deprecated:** In LineCode objects, "FaultRate" is not used in the DSS engine since 2014. Be sure to fill the values in each Line individually since they are not propagated from the LineCode!

Name: `FaultRate`
Default: 0.1

(Setter)
"""
function FaultRate(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FaultRate, value, flags)
end

"""
Percentage of the faults that become permanent.

**Unused** (unused internally by the models, but can be used to transport data)
**Deprecated:** In LineCode objects, "PctPerm" is not used in the DSS engine since 2014. Be sure to fill the values in each Line individually since they are not propagated from the LineCode!

Name: `PctPerm`
Default: 20.0

(Getter)
"""
function PctPerm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PctPerm)
end

"""
Percentage of the faults that become permanent.

**Unused** (unused internally by the models, but can be used to transport data)
**Deprecated:** In LineCode objects, "PctPerm" is not used in the DSS engine since 2014. Be sure to fill the values in each Line individually since they are not propagated from the LineCode!

Name: `PctPerm`
Default: 20.0

(Setter)
"""
function PctPerm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PctPerm, value, flags)
end

"""
Hours to repair.

**Unused** (unused internally by the models, but can be used to transport data)
**Deprecated:** In LineCode objects, "Repair" is not used in the DSS engine since 2014. Be sure to fill the values in each Line individually since they are not propagated from the LineCode!

Name: `Repair`
Default: 3.0

(Getter)
"""
function Repair(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Repair)
end

"""
Hours to repair.

**Unused** (unused internally by the models, but can be used to transport data)
**Deprecated:** In LineCode objects, "Repair" is not used in the DSS engine since 2014. Be sure to fill the values in each Line individually since they are not propagated from the LineCode!

Name: `Repair`
Default: 3.0

(Setter)
"""
function Repair(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Repair, value, flags)
end

"""
Perform Kron reduction on the impedance matrix after it is formed, reducing order by 1. Eliminates the conductor designated by the "Neutral=" property. Do this after the R, X, and C matrices are defined. Ignored for symmetrical components. May be issued more than once to eliminate more than one conductor by resetting the Neutral property after the previous invoking of this property. Generally, you do not want to do a Kron reduction on the matrix if you intend to solve at a frequency other than the base frequency and exploit the Rg and Xg values.

Name: `Kron`
Default: False
"""
function Kron(obj::Obj, value::Bool=true, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Kron, value, flags)
end

"""
Carson earth return resistance per unit length used to compute impedance values at base frequency.  For making better frequency adjustments. Default is 0.01805 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Rg`
Units: Ω/[length_unit]
Default: 0.01805

(Getter)
"""
function Rg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Rg)
end

"""
Carson earth return resistance per unit length used to compute impedance values at base frequency.  For making better frequency adjustments. Default is 0.01805 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Rg`
Units: Ω/[length_unit]
Default: 0.01805

(Setter)
"""
function Rg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Rg, value, flags)
end

"""
Carson earth return reactance per unit length used to compute impedance values at base frequency.  For making better frequency adjustments. Default value is 0.155081 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Xg`
Units: Ω/[length_unit]
Default: 0.155081

(Getter)
"""
function Xg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Xg)
end

"""
Carson earth return reactance per unit length used to compute impedance values at base frequency.  For making better frequency adjustments. Default value is 0.155081 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Xg`
Units: Ω/[length_unit]
Default: 0.155081

(Setter)
"""
function Xg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Xg, value, flags)
end

"""
Earth resistivity used to compute earth correction factor.

Name: `rho`
Units: Ωm
Default: 100.0

(Getter)
"""
function rho(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.rho)
end

"""
Earth resistivity used to compute earth correction factor.

Name: `rho`
Units: Ωm
Default: 100.0

(Setter)
"""
function rho(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.rho, value, flags)
end

"""
Designates which conductor is the "neutral" conductor that will be eliminated by Kron reduction. Default is the last conductor (nphases value). After Kron reduction is set to 0. Subsequent issuing of Kron=Yes will not do anything until this property is set to a legal value. Applies only to LineCodes defined by R, X, and C matrix.

Name: `Neutral`
Default: 3

(Getter)
"""
function Neutral(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Neutral)
end

"""
Designates which conductor is the "neutral" conductor that will be eliminated by Kron reduction. Default is the last conductor (nphases value). After Kron reduction is set to 0. Subsequent issuing of Kron=Yes will not do anything until this property is set to a legal value. Applies only to LineCodes defined by R, X, and C matrix.

Name: `Neutral`
Default: 3

(Setter)
"""
function Neutral(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Neutral, value, flags)
end

"""
Alternate way to specify C1.

Name: `B1`
Units: μS/[length_unit]

(Getter)
"""
function B1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.B1)
end

"""
Alternate way to specify C1.

Name: `B1`
Units: μS/[length_unit]

(Setter)
"""
function B1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.B1, value, flags)
end

"""
Alternate way to specify C0.

Name: `B0`
Units: μS/[length_unit]

(Getter)
"""
function B0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.B0)
end

"""
Alternate way to specify C0.

Name: `B0`
Units: μS/[length_unit]

(Setter)
"""
function B0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.B0, value, flags)
end

"""
Defines the number of ratings to be defined for the wire, to be used only when defining seasonal ratings using the "Ratings" property.

Name: `Seasons`

(Getter)
"""
function Seasons(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Seasons)
end

"""
Defines the number of ratings to be defined for the wire, to be used only when defining seasonal ratings using the "Ratings" property.

Name: `Seasons`

(Setter)
"""
function Seasons(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Seasons, value, flags)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in lines.

Name: `Ratings`
Default: [400.0]

(Getter)
"""
function Ratings(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Ratings)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in lines.

Name: `Ratings`
Default: [400.0]

(Setter)
"""
function Ratings(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Ratings, value, flags)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Getter)
"""
function LineType(obj::Obj)::LineTypeEnum.T
    LineTypeEnum.T(obj_get_int32(obj, _PropertyIndex.LineType))
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Setter)
"""
function LineType(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LineType, value, flags)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Setter)
"""
function LineType(obj::Obj, value::Union{Int,LineTypeEnum.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.LineType, Int32(value), flags)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Getter)
"""
function LineType_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.LineType)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Setter)
"""
function LineType_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    LineType(obj, value, flags)
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

end # module LineCode
export LineCode
