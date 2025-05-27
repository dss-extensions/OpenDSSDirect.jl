module Line
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: EarthModel as EarthModelEnum, LengthUnit, LineType as LineTypeEnum
using ..LineCode: LineCodeObj
using ..LineGeometry: LineGeometryObj
using ..LineSpacing: LineSpacingObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PDElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Line"
const _cls_idx = 15

module _PropertyIndex
const Bus1 = Int32(1)
const Bus2 = Int32(2)
const LineCode = Int32(3)
const Length = Int32(4)
const Phases = Int32(5)
const R1 = Int32(6)
const X1 = Int32(7)
const R0 = Int32(8)
const X0 = Int32(9)
const C1 = Int32(10)
const C0 = Int32(11)
const RMatrix = Int32(12)
const XMatrix = Int32(13)
const CMatrix = Int32(14)
const Switch = Int32(15)
const Rg = Int32(16)
const Xg = Int32(17)
const rho = Int32(18)
const Geometry = Int32(19)
const Units = Int32(20)
const Spacing = Int32(21)
const Wires = Int32(22)
const EarthModel = Int32(23)
const CNCables = Int32(24)
const TSCables = Int32(25)
const B1 = Int32(26)
const B0 = Int32(27)
const Seasons = Int32(28)
const Ratings = Int32(29)
const LineType = Int32(30)
const EpsRMedium = Int32(31)
const HeightOffset = Int32(32)
const HeightUnit = Int32(33)
const Conductors = Int32(34)
const NormAmps = Int32(35)
const EmergAmps = Int32(36)
const FaultRate = Int32(37)
const pctPerm = Int32(38)
const Repair = Int32(39)
const BaseFreq = Int32(40)
const Enabled = Int32(41)
const Like = Int32(42)
end

struct LineObj <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export LineObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = LineObj(ptr, dss)
const Obj = LineObj

function Base.show(io::IO, obj::LineObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of bus to which first terminal is connected.
Example:
bus1=busname   (assumes all terminals connected in normal phase order)
bus1=busname.3.1.2.0 (specify terminal to node connections explicitly)

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of bus to which first terminal is connected.
Example:
bus1=busname   (assumes all terminals connected in normal phase order)
bus1=busname.3.1.2.0 (specify terminal to node connections explicitly)

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Name of bus to which 2nd terminal is connected.

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of bus to which 2nd terminal is connected.

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Name of linecode object describing line impedances.
If you use a line code, you do not need to specify the impedances here. The line code must have been PREVIOUSLY defined. The values specified last will prevail over those specified earlier (left-to-right sequence of properties).  You can subsequently change the number of phases if symmetrical component quantities are specified.If no line code or impedance data are specified, the line object defaults to 336 MCM ACSR on 4 ft spacing.

Name: `LineCode`

(Getter)
"""
function LineCode_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.LineCode)
end

"""
Name of linecode object describing line impedances.
If you use a line code, you do not need to specify the impedances here. The line code must have been PREVIOUSLY defined. The values specified last will prevail over those specified earlier (left-to-right sequence of properties).  You can subsequently change the number of phases if symmetrical component quantities are specified.If no line code or impedance data are specified, the line object defaults to 336 MCM ACSR on 4 ft spacing.

Name: `LineCode`

(Setter)
"""
function LineCode_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LineCode, value, flags)
end

"""
Name of linecode object describing line impedances.
If you use a line code, you do not need to specify the impedances here. The line code must have been PREVIOUSLY defined. The values specified last will prevail over those specified earlier (left-to-right sequence of properties).  You can subsequently change the number of phases if symmetrical component quantities are specified.If no line code or impedance data are specified, the line object defaults to 336 MCM ACSR on 4 ft spacing.

Name: `LineCode`

(Getter)
"""
function LineCode(obj)::Union{LineCodeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.LineCode, LineCodeObj)
end

"""
Name of linecode object describing line impedances.
If you use a line code, you do not need to specify the impedances here. The line code must have been PREVIOUSLY defined. The values specified last will prevail over those specified earlier (left-to-right sequence of properties).  You can subsequently change the number of phases if symmetrical component quantities are specified.If no line code or impedance data are specified, the line object defaults to 336 MCM ACSR on 4 ft spacing.

Name: `LineCode`

(Setter)
"""
function LineCode(obj::Obj, value::Union{LineCodeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.LineCode, value, flags)
end

"""
Name of linecode object describing line impedances.
If you use a line code, you do not need to specify the impedances here. The line code must have been PREVIOUSLY defined. The values specified last will prevail over those specified earlier (left-to-right sequence of properties).  You can subsequently change the number of phases if symmetrical component quantities are specified.If no line code or impedance data are specified, the line object defaults to 336 MCM ACSR on 4 ft spacing.

Name: `LineCode`

(Setter)
"""
function LineCode(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LineCode, value, flags)
end

"""
Length of line. If units do not match the impedance data, specify "units" property. 

Name: `Length`
Default: 1.0

(Getter)
"""
function Length(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Length)
end

"""
Length of line. If units do not match the impedance data, specify "units" property. 

Name: `Length`
Default: 1.0

(Setter)
"""
function Length(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Length, value, flags)
end

"""
Number of phases, this line.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases, this line.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
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
Positive-sequence Reactance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.  See also Xmatrix

Name: `X1`
Units: Ω/[length_unit]
Default: 0.1206

(Getter)
"""
function X1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X1)
end

"""
Positive-sequence Reactance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.  See also Xmatrix

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
Zero-sequence capacitance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.See also B0.

Name: `C0`
Units: nF/[length_unit]
Default: 1.5999999999999999

(Getter)
"""
function C0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.C0)
end

"""
Zero-sequence capacitance. Setting any of R1, R0, X1, X0, C1, C0 forces the program to use the symmetrical component line definition.See also B0.

Name: `C0`
Units: nF/[length_unit]
Default: 1.5999999999999999

(Setter)
"""
function C0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.C0, value, flags)
end

"""
Resistance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration. Using any of Rmatrix, Xmatrix, Cmatrix forces program to use the matrix values for line impedance definition. For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `RMatrix`
Units: Ω/[length_unit]

(Getter)
"""
function RMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.RMatrix; matrix=true)
end

"""
Resistance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration. Using any of Rmatrix, Xmatrix, Cmatrix forces program to use the matrix values for line impedance definition. For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `RMatrix`
Units: Ω/[length_unit]

(Setter)
"""
function RMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RMatrix, value, flags)
end
RMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = RMatrix(obj, value[:], flags)

"""
Reactance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration. Using any of Rmatrix, Xmatrix, Cmatrix forces program to use the matrix values for line impedance definition.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `XMatrix`
Units: Ω/[length_unit]

(Getter)
"""
function XMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.XMatrix; matrix=true)
end

"""
Reactance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the impedance of any line configuration. Using any of Rmatrix, Xmatrix, Cmatrix forces program to use the matrix values for line impedance definition.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `XMatrix`
Units: Ω/[length_unit]

(Setter)
"""
function XMatrix(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XMatrix, value, flags)
end
XMatrix(obj::Obj, value::Matrix{Float64}, flags::SetterFlagsT=SetterFlagsT(0)) = XMatrix(obj, value[:], flags)

"""
Nodal Capacitance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the shunt capacitance of any line configuration. Using any of Rmatrix, Xmatrix, Cmatrix forces program to use the matrix values for line impedance definition.  For balanced line models, you may use the standard symmetrical component data definition instead.

Name: `CMatrix`
Units: nF/[length_unit]
Default: [[2.8, -0.5999999999999999, -0.5999999999999999], [-0.5999999999999999, 2.8, -0.5999999999999999], [-0.5999999999999999, -0.5999999999999999, 2.8]]

(Getter)
"""
function CMatrix(obj::Obj)::Matrix{Float64}
    obj_get_float64s(obj, _PropertyIndex.CMatrix; matrix=true)
end

"""
Nodal Capacitance matrix, lower triangle. Order of the matrix is the number of phases. May be used to specify the shunt capacitance of any line configuration. Using any of Rmatrix, Xmatrix, Cmatrix forces program to use the matrix values for line impedance definition.  For balanced line models, you may use the standard symmetrical component data definition instead.

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
Designates this line as a switch for graphics and algorithmic purposes. 
SIDE EFFECT: Sets r1 = 1.0; x1 = 1.0; r0 = 1.0; x0 = 1.0; c1 = 1.1 ; c0 = 1.0;  length = 0.001; You must reset if you want something different.

Name: `Switch`
Default: False

(Getter)
"""
function Switch(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Switch)
end

"""
Designates this line as a switch for graphics and algorithmic purposes. 
SIDE EFFECT: Sets r1 = 1.0; x1 = 1.0; r0 = 1.0; x0 = 1.0; c1 = 1.1 ; c0 = 1.0;  length = 0.001; You must reset if you want something different.

Name: `Switch`
Default: False

(Setter)
"""
function Switch(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Switch, value, flags)
end

"""
Carson earth return resistance per unit length used to compute impedance values at base frequency. Default is 0.01805 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Rg`
Units: Ω/[length_unit]
Default: 0.01805

(Getter)
"""
function Rg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Rg)
end

"""
Carson earth return resistance per unit length used to compute impedance values at base frequency. Default is 0.01805 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Rg`
Units: Ω/[length_unit]
Default: 0.01805

(Setter)
"""
function Rg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Rg, value, flags)
end

"""
Carson earth return reactance per unit length used to compute impedance values at base frequency.  For making better frequency adjustments. Default is 0.155081 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Xg`
Units: Ω/[length_unit]
Default: 0.155081

(Getter)
"""
function Xg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Xg)
end

"""
Carson earth return reactance per unit length used to compute impedance values at base frequency.  For making better frequency adjustments. Default is 0.155081 = 60 Hz value in ohms per kft (matches default line impedances). This value is required for harmonic solutions if you wish to adjust the earth return impedances for frequency. If not, set both Rg and Xg = 0.

Name: `Xg`
Units: Ω/[length_unit]
Default: 0.155081

(Setter)
"""
function Xg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Xg, value, flags)
end

"""
Earth resistivity used to compute earth correction factor. Overrides Line geometry definition if specified.

Name: `rho`
Units: Ωm
Default: 100.0

(Getter)
"""
function rho(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.rho)
end

"""
Earth resistivity used to compute earth correction factor. Overrides Line geometry definition if specified.

Name: `rho`
Units: Ωm
Default: 100.0

(Setter)
"""
function rho(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.rho, value, flags)
end

"""
Geometry code for LineGeometry Object. Supersedes any previous definition of line impedance. Line constants are computed for each frequency change or rho change. CAUTION: may alter number of phases. You cannot subsequently change the number of phases unless you change how the line impedance is defined.

Name: `Geometry`

(Getter)
"""
function Geometry_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Geometry)
end

"""
Geometry code for LineGeometry Object. Supersedes any previous definition of line impedance. Line constants are computed for each frequency change or rho change. CAUTION: may alter number of phases. You cannot subsequently change the number of phases unless you change how the line impedance is defined.

Name: `Geometry`

(Setter)
"""
function Geometry_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Geometry, value, flags)
end

"""
Geometry code for LineGeometry Object. Supersedes any previous definition of line impedance. Line constants are computed for each frequency change or rho change. CAUTION: may alter number of phases. You cannot subsequently change the number of phases unless you change how the line impedance is defined.

Name: `Geometry`

(Getter)
"""
function Geometry(obj)::Union{LineGeometryObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Geometry, LineGeometryObj)
end

"""
Geometry code for LineGeometry Object. Supersedes any previous definition of line impedance. Line constants are computed for each frequency change or rho change. CAUTION: may alter number of phases. You cannot subsequently change the number of phases unless you change how the line impedance is defined.

Name: `Geometry`

(Setter)
"""
function Geometry(obj::Obj, value::Union{LineGeometryObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Geometry, value, flags)
end

"""
Geometry code for LineGeometry Object. Supersedes any previous definition of line impedance. Line constants are computed for each frequency change or rho change. CAUTION: may alter number of phases. You cannot subsequently change the number of phases unless you change how the line impedance is defined.

Name: `Geometry`

(Setter)
"""
function Geometry(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Geometry, value, flags)
end

"""
Length Units. Default is None - assumes length units match impedance units.

Name: `Units`
Default: none

(Getter)
"""
function Units(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.Units))
end

"""
Length Units. Default is None - assumes length units match impedance units.

Name: `Units`
Default: none

(Setter)
"""
function Units(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Units, value, flags)
end

"""
Length Units. Default is None - assumes length units match impedance units.

Name: `Units`
Default: none

(Setter)
"""
function Units(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Units, Int32(value), flags)
end

"""
Length Units. Default is None - assumes length units match impedance units.

Name: `Units`
Default: none

(Getter)
"""
function Units_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Units)
end

"""
Length Units. Default is None - assumes length units match impedance units.

Name: `Units`
Default: none

(Setter)
"""
function Units_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Units(obj, value, flags)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Must be used in conjunction with the Wires property.
Specify this before the wires property.

Name: `Spacing`

(Getter)
"""
function Spacing_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spacing)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Must be used in conjunction with the Wires property.
Specify this before the wires property.

Name: `Spacing`

(Setter)
"""
function Spacing_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spacing, value, flags)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Must be used in conjunction with the Wires property.
Specify this before the wires property.

Name: `Spacing`

(Getter)
"""
function Spacing(obj)::Union{LineSpacingObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spacing, LineSpacingObj)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Must be used in conjunction with the Wires property.
Specify this before the wires property.

Name: `Spacing`

(Setter)
"""
function Spacing(obj::Obj, value::Union{LineSpacingObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spacing, value, flags)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Must be used in conjunction with the Wires property.
Specify this before the wires property.

Name: `Spacing`

(Setter)
"""
function Spacing(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spacing, value, flags)
end

"""
One of {Carson | FullCarson | Deri}. Default is the global value established with the Set EarthModel command. See the Options Help on EarthModel option. This is used to override the global value for this line. This option applies only when the "geometry" property is used.

Name: `EarthModel`
Default: Deri

(Getter)
"""
function EarthModel(obj::Obj)::EarthModelEnum.T
    EarthModelEnum.T(obj_get_int32(obj, _PropertyIndex.EarthModel))
end

"""
One of {Carson | FullCarson | Deri}. Default is the global value established with the Set EarthModel command. See the Options Help on EarthModel option. This is used to override the global value for this line. This option applies only when the "geometry" property is used.

Name: `EarthModel`
Default: Deri

(Setter)
"""
function EarthModel(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.EarthModel, value, flags)
end

"""
One of {Carson | FullCarson | Deri}. Default is the global value established with the Set EarthModel command. See the Options Help on EarthModel option. This is used to override the global value for this line. This option applies only when the "geometry" property is used.

Name: `EarthModel`
Default: Deri

(Setter)
"""
function EarthModel(obj::Obj, value::Union{Int,EarthModelEnum.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.EarthModel, Int32(value), flags)
end

"""
One of {Carson | FullCarson | Deri}. Default is the global value established with the Set EarthModel command. See the Options Help on EarthModel option. This is used to override the global value for this line. This option applies only when the "geometry" property is used.

Name: `EarthModel`
Default: Deri

(Getter)
"""
function EarthModel_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.EarthModel)
end

"""
One of {Carson | FullCarson | Deri}. Default is the global value established with the Set EarthModel command. See the Options Help on EarthModel option. This is used to override the global value for this line. This option applies only when the "geometry" property is used.

Name: `EarthModel`
Default: Deri

(Setter)
"""
function EarthModel_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    EarthModel(obj, value, flags)
end

"""
Alternate way to specify C1. MicroS per unit length

Name: `B1`
Units: μS/[length_unit]

(Getter)
"""
function B1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.B1)
end

"""
Alternate way to specify C1. MicroS per unit length

Name: `B1`
Units: μS/[length_unit]

(Setter)
"""
function B1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.B1, value, flags)
end

"""
Alternate way to specify C0. MicroS per unit length

Name: `B0`
Units: μS/[length_unit]

(Getter)
"""
function B0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.B0)
end

"""
Alternate way to specify C0. MicroS per unit length

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
Line.epsrmedium

Name: `EpsRMedium`
Default: 1.0

(Getter)
"""
function EpsRMedium(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EpsRMedium)
end

"""
Line.epsrmedium

Name: `EpsRMedium`
Default: 1.0

(Setter)
"""
function EpsRMedium(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EpsRMedium, value, flags)
end

"""
Line.heightoffset

Name: `HeightOffset`
Default: 0.0

(Getter)
"""
function HeightOffset(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.HeightOffset)
end

"""
Line.heightoffset

Name: `HeightOffset`
Default: 0.0

(Setter)
"""
function HeightOffset(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.HeightOffset, value, flags)
end

"""
Line.heightunit

Name: `HeightUnit`
Default: m

(Getter)
"""
function HeightUnit(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.HeightUnit))
end

"""
Line.heightunit

Name: `HeightUnit`
Default: m

(Setter)
"""
function HeightUnit(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.HeightUnit, value, flags)
end

"""
Line.heightunit

Name: `HeightUnit`
Default: m

(Setter)
"""
function HeightUnit(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.HeightUnit, Int32(value), flags)
end

"""
Line.heightunit

Name: `HeightUnit`
Default: m

(Getter)
"""
function HeightUnit_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.HeightUnit)
end

"""
Line.heightunit

Name: `HeightUnit`
Default: m

(Setter)
"""
function HeightUnit_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    HeightUnit(obj, value, flags)
end

"""
Line.conductors

Name: `Conductors`

(Getter)
"""
function Conductors_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Conductors)
end

"""
Line.conductors

Name: `Conductors`

(Setter)
"""
function Conductors_str(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Conductors, value, flags)
end

"""
Line.conductors

Name: `Conductors`

(Getter)
"""
function Conductors(obj::Obj)::Vector{Union{AbstractConductorData, Nothing}}
    obj_get_objs(obj, _PropertyIndex.Conductors)
end

"""
Line.conductors

Name: `Conductors`

(Setter)
"""
function Conductors(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Conductors, value, flags)
end

"""
Line.conductors

Name: `Conductors`

(Setter)
"""
function Conductors(obj::Obj, value::Vector{Union{AbstractConductorData, Nothing}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_objs(obj, _PropertyIndex.Conductors, value, flags)
end

"""
Normal rated current.

Name: `NormAmps`
Default: 400.0

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal rated current.

Name: `NormAmps`
Default: 400.0

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Maximum or emergency current rating.

Name: `EmergAmps`
Default: 600.0

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Maximum or emergency current rating.

Name: `EmergAmps`
Default: 600.0

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Failure rate PER UNIT LENGTH per year. Length must be same units as LENGTH property. Default is 0.1 fault per unit length per year.

Name: `FaultRate`
Default: 0.1

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
Failure rate PER UNIT LENGTH per year. Length must be same units as LENGTH property. Default is 0.1 fault per unit length per year.

Name: `FaultRate`
Default: 0.1

(Setter)
"""
function FaultRate(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FaultRate, value, flags)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 20.0

(Getter)
"""
function pctPerm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPerm)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 20.0

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

end # module Line
export Line
