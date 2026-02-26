module Vsource
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: ScanType as ScanTypeEnum, SequenceType, VSourceModel
using ..LoadShape: LoadShapeObj
using ..Spectrum: SpectrumObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PCElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Vsource"
const _cls_idx = 16

module _PropertyIndex
const Bus1 = Int32(1)
const BasekV = Int32(2)
const pu = Int32(3)
const Angle = Int32(4)
const Frequency = Int32(5)
const Phases = Int32(6)
const MVASC3 = Int32(7)
const MVASC1 = Int32(8)
const X1R1 = Int32(9)
const X0R0 = Int32(10)
const Isc3 = Int32(11)
const Isc1 = Int32(12)
const R1 = Int32(13)
const X1 = Int32(14)
const R0 = Int32(15)
const X0 = Int32(16)
const ScanType = Int32(17)
const Sequence = Int32(18)
const Bus2 = Int32(19)
const Z1 = Int32(20)
const Z0 = Int32(21)
const Z2 = Int32(22)
const puZ1 = Int32(23)
const puZ0 = Int32(24)
const puZ2 = Int32(25)
const BaseMVA = Int32(26)
const Yearly = Int32(27)
const Daily = Int32(28)
const Duty = Int32(29)
const Model = Int32(30)
const puZIdeal = Int32(31)
const Spectrum = Int32(32)
const BaseFreq = Int32(33)
const Enabled = Int32(34)
const Like = Int32(35)
end

struct VsourceObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export VsourceObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = VsourceObj(ptr, dss)
const Obj = VsourceObj

function Base.show(io::IO, obj::VsourceObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of bus to which the main terminal (1) is connected.
bus1=busname
bus1=busname.1.2.3

The VSOURCE object is a two-terminal voltage source (Thévenin equivalent). Bus2 defaults to Bus1 with all phases connected to ground (node 0) unless previously specified. This is a Yg connection. If you want something different, define the Bus2 property explicitly.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of bus to which the main terminal (1) is connected.
bus1=busname
bus1=busname.1.2.3

The VSOURCE object is a two-terminal voltage source (Thévenin equivalent). Bus2 defaults to Bus1 with all phases connected to ground (node 0) unless previously specified. This is a Yg connection. If you want something different, define the Bus2 property explicitly.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Base Source kV, usually phase-phase (L-L) unless you are making a positive-sequence model or 1-phase model in which case, it will be phase-neutral (L-N) kV.

Name: `BasekV`
Default: 115.0

(Getter)
"""
function BasekV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BasekV)
end

"""
Base Source kV, usually phase-phase (L-L) unless you are making a positive-sequence model or 1-phase model in which case, it will be phase-neutral (L-N) kV.

Name: `BasekV`
Default: 115.0

(Setter)
"""
function BasekV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.BasekV, value, flags)
end

"""
Per unit of the base voltage that the source is actually operating at.
"pu=1.05"

Name: `pu`
Default: 1.0

(Getter)
"""
function pu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pu)
end

"""
Per unit of the base voltage that the source is actually operating at.
"pu=1.05"

Name: `pu`
Default: 1.0

(Setter)
"""
function pu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pu, value, flags)
end

"""
Phase angle in degrees of first phase: e.g.,Angle=10.3

Name: `Angle`
Default: 0.0

(Getter)
"""
function Angle(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Angle)
end

"""
Phase angle in degrees of first phase: e.g.,Angle=10.3

Name: `Angle`
Default: 0.0

(Setter)
"""
function Angle(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Angle, value, flags)
end

"""
Source frequency.  Defaults to system default base frequency.

Name: `Frequency`
Units: Hz

(Getter)
"""
function Frequency(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Frequency)
end

"""
Source frequency.  Defaults to system default base frequency.

Name: `Frequency`
Units: Hz

(Setter)
"""
function Frequency(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Frequency, value, flags)
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
MVA Short circuit, 3-phase fault. Z1 is determined by squaring the base kv and dividing by this value. For single-phase source, this value is not used.

Name: `MVASC3`
Units: MVA
Default: 2000.0

(Getter)
"""
function MVASC3(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MVASC3)
end

"""
MVA Short circuit, 3-phase fault. Z1 is determined by squaring the base kv and dividing by this value. For single-phase source, this value is not used.

Name: `MVASC3`
Units: MVA
Default: 2000.0

(Setter)
"""
function MVASC3(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MVASC3, value, flags)
end

"""
MVA Short Circuit, 1-phase fault. The "single-phase impedance", Zs, is determined by squaring the base kV and dividing by this value. Then Z0 is determined by Z0 = 3Zs - 2Z1.  For 1-phase sources, Zs is used directly. Use X0R0 to define X/R ratio for 1-phase source.

Name: `MVASC1`
Units: MVA
Default: 2100.0

(Getter)
"""
function MVASC1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MVASC1)
end

"""
MVA Short Circuit, 1-phase fault. The "single-phase impedance", Zs, is determined by squaring the base kV and dividing by this value. Then Z0 is determined by Z0 = 3Zs - 2Z1.  For 1-phase sources, Zs is used directly. Use X0R0 to define X/R ratio for 1-phase source.

Name: `MVASC1`
Units: MVA
Default: 2100.0

(Setter)
"""
function MVASC1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MVASC1, value, flags)
end

"""
Positive-sequence X/R ratio.

Name: `X1R1`
Default: 4.0

(Getter)
"""
function X1R1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X1R1)
end

"""
Positive-sequence X/R ratio.

Name: `X1R1`
Default: 4.0

(Setter)
"""
function X1R1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X1R1, value, flags)
end

"""
Zero-sequence X/R ratio.

Name: `X0R0`
Default: 3.0

(Getter)
"""
function X0R0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X0R0)
end

"""
Zero-sequence X/R ratio.

Name: `X0R0`
Default: 3.0

(Setter)
"""
function X0R0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X0R0, value, flags)
end

"""
Alternate method of defining the source impedance. 
3-phase short circuit current.

Name: `Isc3`
Units: A

(Getter)
"""
function Isc3(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Isc3)
end

"""
Alternate method of defining the source impedance. 
3-phase short circuit current.

Name: `Isc3`
Units: A

(Setter)
"""
function Isc3(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Isc3, value, flags)
end

"""
Alternate method of defining the source impedance. 
single-phase short circuit current.

Name: `Isc1`
Units: A

(Getter)
"""
function Isc1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Isc1)
end

"""
Alternate method of defining the source impedance. 
single-phase short circuit current.

Name: `Isc1`
Units: A

(Setter)
"""
function Isc1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Isc1, value, flags)
end

"""
Alternate method of defining the source impedance. 
Positive-sequence resistance.

Name: `R1`
Units: Ω

(Getter)
"""
function R1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R1)
end

"""
Alternate method of defining the source impedance. 
Positive-sequence resistance.

Name: `R1`
Units: Ω

(Setter)
"""
function R1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R1, value, flags)
end

"""
Alternate method of defining the source impedance. 
Positive-sequence reactance.

Name: `X1`
Units: Ω

(Getter)
"""
function X1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X1)
end

"""
Alternate method of defining the source impedance. 
Positive-sequence reactance.

Name: `X1`
Units: Ω

(Setter)
"""
function X1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X1, value, flags)
end

"""
Alternate method of defining the source impedance. 
Zero-sequence resistance.

Name: `R0`
Units: Ω

(Getter)
"""
function R0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R0)
end

"""
Alternate method of defining the source impedance. 
Zero-sequence resistance.

Name: `R0`
Units: Ω

(Setter)
"""
function R0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R0, value, flags)
end

"""
Alternate method of defining the source impedance. 
Zero-sequence reactance.

Name: `X0`
Units: Ω

(Getter)
"""
function X0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X0)
end

"""
Alternate method of defining the source impedance. 
Zero-sequence reactance.

Name: `X0`
Units: Ω

(Setter)
"""
function X0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X0, value, flags)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Getter)
"""
function ScanType(obj::Obj)::ScanTypeEnum.T
    ScanTypeEnum.T(obj_get_int32(obj, _PropertyIndex.ScanType))
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Setter)
"""
function ScanType(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ScanType, value, flags)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Setter)
"""
function ScanType(obj::Obj, value::Union{Int,ScanTypeEnum.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.ScanType, Int32(value), flags)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Getter)
"""
function ScanType_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ScanType)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Setter)
"""
function ScanType_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    ScanType(obj, value, flags)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Getter)
"""
function Sequence(obj::Obj)::SequenceType.T
    SequenceType.T(obj_get_int32(obj, _PropertyIndex.Sequence))
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Setter)
"""
function Sequence(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Sequence, value, flags)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Setter)
"""
function Sequence(obj::Obj, value::Union{Int,SequenceType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Sequence, Int32(value), flags)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Getter)
"""
function Sequence_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Sequence)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Setter)
"""
function Sequence_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Sequence(obj, value, flags)
end

"""
Name of bus to which 2nd terminal is connected.
bus2=busname
bus2=busname.1.2.3

Default is Bus1.0.0.0 (grounded wye connection)

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of bus to which 2nd terminal is connected.
bus2=busname
bus2=busname.1.2.3

Default is Bus1.0.0.0 (grounded wye connection)

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Negative-sequence equivalent source impedance, ohms, as a 2-element array representing a complex number. Example: 

Z2=[1, 2]  ! represents 1 + j2 

Used to define the impedance matrix of the VSOURCE if Z1 is also specified. 

Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.

Name: `Z2`
Units: Ω
Default: [1.6037668205527518, 6.415067282211007]

(Getter)
"""
function Z2(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.Z2)
end

"""
Negative-sequence equivalent source impedance, ohms, as a 2-element array representing a complex number. Example: 

Z2=[1, 2]  ! represents 1 + j2 

Used to define the impedance matrix of the VSOURCE if Z1 is also specified. 

Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical.

Name: `Z2`
Units: Ω
Default: [1.6037668205527518, 6.415067282211007]

(Setter)
"""
function Z2(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.Z2, value, flags)
end

"""
2-element array: e.g., [1  2]. An alternate way to specify Z1. See Z1 property. Per-unit positive-sequence impedance on base of Vsource BasekV and BaseMVA.

Name: `puZ1`
Default: [0.012126781251816649, 0.048507125007266595]

(Getter)
"""
function puZ1(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.puZ1)
end

"""
2-element array: e.g., [1  2]. An alternate way to specify Z1. See Z1 property. Per-unit positive-sequence impedance on base of Vsource BasekV and BaseMVA.

Name: `puZ1`
Default: [0.012126781251816649, 0.048507125007266595]

(Setter)
"""
function puZ1(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.puZ1, value, flags)
end

"""
2-element array: e.g., [1  2]. An alternate way to specify Z0. See Z0 property. Per-unit zero-sequence impedance on base of Vsource BasekV and BaseMVA.

Name: `puZ0`
Default: [0.013580611191859016, 0.04074183357557704]

(Getter)
"""
function puZ0(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.puZ0)
end

"""
2-element array: e.g., [1  2]. An alternate way to specify Z0. See Z0 property. Per-unit zero-sequence impedance on base of Vsource BasekV and BaseMVA.

Name: `puZ0`
Default: [0.013580611191859016, 0.04074183357557704]

(Setter)
"""
function puZ0(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.puZ0, value, flags)
end

"""
2-element array: e.g., [1  2]. An alternate way to specify Z2. See Z2 property. Per-unit negative-sequence impedance on base of Vsource BasekV and BaseMVA.

Name: `puZ2`
Default: [0.012126781251816649, 0.048507125007266595]

(Getter)
"""
function puZ2(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.puZ2)
end

"""
2-element array: e.g., [1  2]. An alternate way to specify Z2. See Z2 property. Per-unit negative-sequence impedance on base of Vsource BasekV and BaseMVA.

Name: `puZ2`
Default: [0.012126781251816649, 0.048507125007266595]

(Setter)
"""
function puZ2(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.puZ2, value, flags)
end

"""
Default value is 100. Base used to convert values specified with puZ1, puZ0, and puZ2 properties to ohms on kV base specified by BasekV property.

Name: `BaseMVA`
Default: 100.0

(Getter)
"""
function BaseMVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BaseMVA)
end

"""
Default value is 100. Base used to convert values specified with puZ1, puZ0, and puZ2 properties to ohms on kV base specified by BasekV property.

Name: `BaseMVA`
Default: 100.0

(Setter)
"""
function BaseMVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.BaseMVA, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
LOADSHAPE object to use for the per-unit voltage for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
LOADSHAPE object to use for the per-unit voltage for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
LOADSHAPE object to use for the per-unit voltage for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
LOADSHAPE object to use for the per-unit voltage for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
LOADSHAPE object to use for the per-unit voltage for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
LOADSHAPE object to use for the per-unit voltage for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for the per-unit voltage for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual L-N kV.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Specifies whether the Vsource is to be considered a Thévenin short circuit model or a quasi-ideal voltage source. If Thévenin, the Vsource uses the impedances defined for all calculations. If "Ideal", the model uses a small impedance on the diagonal of the impedance matrix for the fundamental base frequency power flow only. Then switches to actual Thévenin model for other frequencies. 

Name: `Model`
Default: Thevenin

(Getter)
"""
function Model(obj::Obj)::VSourceModel.T
    VSourceModel.T(obj_get_int32(obj, _PropertyIndex.Model))
end

"""
Specifies whether the Vsource is to be considered a Thévenin short circuit model or a quasi-ideal voltage source. If Thévenin, the Vsource uses the impedances defined for all calculations. If "Ideal", the model uses a small impedance on the diagonal of the impedance matrix for the fundamental base frequency power flow only. Then switches to actual Thévenin model for other frequencies. 

Name: `Model`
Default: Thevenin

(Setter)
"""
function Model(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Model, value, flags)
end

"""
Specifies whether the Vsource is to be considered a Thévenin short circuit model or a quasi-ideal voltage source. If Thévenin, the Vsource uses the impedances defined for all calculations. If "Ideal", the model uses a small impedance on the diagonal of the impedance matrix for the fundamental base frequency power flow only. Then switches to actual Thévenin model for other frequencies. 

Name: `Model`
Default: Thevenin

(Setter)
"""
function Model(obj::Obj, value::Union{Int,VSourceModel.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Model, Int32(value), flags)
end

"""
Specifies whether the Vsource is to be considered a Thévenin short circuit model or a quasi-ideal voltage source. If Thévenin, the Vsource uses the impedances defined for all calculations. If "Ideal", the model uses a small impedance on the diagonal of the impedance matrix for the fundamental base frequency power flow only. Then switches to actual Thévenin model for other frequencies. 

Name: `Model`
Default: Thevenin

(Getter)
"""
function Model_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Model)
end

"""
Specifies whether the Vsource is to be considered a Thévenin short circuit model or a quasi-ideal voltage source. If Thévenin, the Vsource uses the impedances defined for all calculations. If "Ideal", the model uses a small impedance on the diagonal of the impedance matrix for the fundamental base frequency power flow only. Then switches to actual Thévenin model for other frequencies. 

Name: `Model`
Default: Thevenin

(Setter)
"""
function Model_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Model(obj, value, flags)
end

"""
2-element array: e.g., [1  2]. The pu impedance to use for the quasi-ideal voltage source model. Should be a very small impedances. Default is [1e-6, 0.001]. Per-unit impedance on base of Vsource BasekV and BaseMVA. If too small, solution may not work. Be sure to check the voltage values and powers.

Name: `puZIdeal`
Default: [1e-06, 0.001]

(Getter)
"""
function puZIdeal(obj)::ComplexF64
    obj_get_complex(obj, _PropertyIndex.puZIdeal)
end

"""
2-element array: e.g., [1  2]. The pu impedance to use for the quasi-ideal voltage source model. Should be a very small impedances. Default is [1e-6, 0.001]. Per-unit impedance on base of Vsource BasekV and BaseMVA. If too small, solution may not work. Be sure to check the voltage values and powers.

Name: `puZIdeal`
Default: [1e-06, 0.001]

(Setter)
"""
function puZIdeal(obj::Obj, value::ComplexF64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_complex(obj, _PropertyIndex.puZIdeal, value, flags)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: defaultvsource

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: defaultvsource

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: defaultvsource

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: defaultvsource

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: defaultvsource

(Setter)
"""
function Spectrum(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
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

end # module Vsource
export Vsource
