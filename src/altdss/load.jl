module Load
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, LoadModel, LoadStatus
using ..GrowthShape: GrowthShapeObj
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


const _cls_name = "Load"
const _cls_idx = 19

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const kW = Int32(4)
const PF = Int32(5)
const Model = Int32(6)
const Yearly = Int32(7)
const Daily = Int32(8)
const Duty = Int32(9)
const Growth = Int32(10)
const Conn = Int32(11)
const kvar = Int32(12)
const RNeut = Int32(13)
const XNeut = Int32(14)
const Status = Int32(15)
const Class = Int32(16)
const VMinpu = Int32(17)
const VMaxpu = Int32(18)
const VMinNorm = Int32(19)
const VMinEmerg = Int32(20)
const XfkVA = Int32(21)
const AllocationFactor = Int32(22)
const kVA = Int32(23)
const pctMean = Int32(24)
const pctStdDev = Int32(25)
const CVRWatts = Int32(26)
const CVRVars = Int32(27)
const kWh = Int32(28)
const kWhDays = Int32(29)
const CFactor = Int32(30)
const CVRCurve = Int32(31)
const NumCust = Int32(32)
const ZIPV = Int32(33)
const pctSeriesRL = Int32(34)
const RelWeight = Int32(35)
const VLowpu = Int32(36)
const puXHarm = Int32(37)
const XRHarm = Int32(38)
const Spectrum = Int32(39)
const BaseFreq = Int32(40)
const Enabled = Int32(41)
const Like = Int32(42)
end

struct LoadObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export LoadObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = LoadObj(ptr, dss)
const Obj = LoadObj

function Base.show(io::IO, obj::LoadObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of Phases, this load.  Load is evenly divided among phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases, this load.  Load is evenly divided among phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the load is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the load is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for load. For 2- and 3-phase loads, specify phase-phase kV. Otherwise, specify actual kV across each branch of the load. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for load. For 2- and 3-phase loads, specify phase-phase kV. Otherwise, specify actual kV across each branch of the load. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
Total base kW for the load.  Normally, you would enter the maximum kW for the load for the first year and allow it to be adjusted by the load shapes, growth shapes, and global load multiplier.

Legal ways to define base load:
kW, PF
kW, kvar
kVA, PF
XFKVA × Allocationfactor, PF
kWh / (kWhdays × 24) × Cfactor, PF

Name: `kW`
Units: kW
Default: 10.0

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Total base kW for the load.  Normally, you would enter the maximum kW for the load for the first year and allow it to be adjusted by the load shapes, growth shapes, and global load multiplier.

Legal ways to define base load:
kW, PF
kW, kvar
kVA, PF
XFKVA × Allocationfactor, PF
kWh / (kWhdays × 24) × Cfactor, PF

Name: `kW`
Units: kW
Default: 10.0

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
Load power factor.  Enter negative for leading powerfactor (when kW and kvar have opposite signs.)

Name: `PF`
Default: 0.88

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
Load power factor.  Enter negative for leading powerfactor (when kW and kvar have opposite signs.)

Name: `PF`
Default: 0.88

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
Integer code for the model to use for load variation with voltage. Valid values are:

- 1: Standard constant P+jQ load. (Default)
- 2: Constant impedance load. 
- 3: Const P, Quadratic Q (like a motor).
- 4: Nominal Linear P, Quadratic Q (feeder mix). Use this with CVRfactor.
- 5: Constant Current Magnitude
- 6: Const P, Fixed Q
- 7: Const P, Fixed Impedance Q
- 8: ZIPV (7 values)

For Types 6 and 7, only the P is modified by load multipliers.

Name: `Model`
Default: 1

(Getter)
"""
function Model(obj)::LoadModel.T
    LoadModel.T(obj_get_int32(obj, _PropertyIndex.Model))
end

"""
Integer code for the model to use for load variation with voltage. Valid values are:

- 1: Standard constant P+jQ load. (Default)
- 2: Constant impedance load. 
- 3: Const P, Quadratic Q (like a motor).
- 4: Nominal Linear P, Quadratic Q (feeder mix). Use this with CVRfactor.
- 5: Constant Current Magnitude
- 6: Const P, Fixed Q
- 7: Const P, Fixed Impedance Q
- 8: ZIPV (7 values)

For Types 6 and 7, only the P is modified by load multipliers.

Name: `Model`
Default: 1

(Setter)
"""
function Model(obj::Obj, value::Union{Int,LoadModel.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Model, value, flags)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Characteristic  to use for growth factors by years.  Must be previously defined as a Growthshape object. Defaults to circuit default growth factor (see Set Growth command).

Name: `Growth`

(Getter)
"""
function Growth_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Growth)
end

"""
Characteristic  to use for growth factors by years.  Must be previously defined as a Growthshape object. Defaults to circuit default growth factor (see Set Growth command).

Name: `Growth`

(Setter)
"""
function Growth_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Growth, value, flags)
end

"""
Characteristic  to use for growth factors by years.  Must be previously defined as a Growthshape object. Defaults to circuit default growth factor (see Set Growth command).

Name: `Growth`

(Getter)
"""
function Growth(obj)::Union{GrowthShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Growth, GrowthShapeObj)
end

"""
Characteristic  to use for growth factors by years.  Must be previously defined as a Growthshape object. Defaults to circuit default growth factor (see Set Growth command).

Name: `Growth`

(Setter)
"""
function Growth(obj::Obj, value::Union{GrowthShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Growth, value, flags)
end

"""
Characteristic  to use for growth factors by years.  Must be previously defined as a Growthshape object. Defaults to circuit default growth factor (see Set Growth command).

Name: `Growth`

(Setter)
"""
function Growth(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Growth, value, flags)
end

"""
={wye or LN | delta or LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
={wye or LN | delta or LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
={wye or LN | delta or LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
={wye or LN | delta or LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
={wye or LN | delta or LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Specify the base kvar for specifying load as kW & kvar.  Assumes kW has been already defined.  Alternative to specifying the power factor.  Side effect:  the power factor and kVA is altered to agree.

Name: `kvar`
Units: kvar

(Getter)
"""
function kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvar)
end

"""
Specify the base kvar for specifying load as kW & kvar.  Assumes kW has been already defined.  Alternative to specifying the power factor.  Side effect:  the power factor and kVA is altered to agree.

Name: `kvar`
Units: kvar

(Setter)
"""
function kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvar, value, flags)
end

"""
Neutral resistance of wye (star)-connected load in actual ohms. If entered as a negative value, the neutral can be open, or floating, or it can be connected to node 0 (ground), which is the usual default. If >=0 be sure to explicitly specify the node connection for the neutral, or last, conductor. Otherwise, the neutral impedance will be shorted to ground.

Name: `RNeut`
Units: Ω
Default: -1.0

(Getter)
"""
function RNeut(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RNeut)
end

"""
Neutral resistance of wye (star)-connected load in actual ohms. If entered as a negative value, the neutral can be open, or floating, or it can be connected to node 0 (ground), which is the usual default. If >=0 be sure to explicitly specify the node connection for the neutral, or last, conductor. Otherwise, the neutral impedance will be shorted to ground.

Name: `RNeut`
Units: Ω
Default: -1.0

(Setter)
"""
function RNeut(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RNeut, value, flags)
end

"""
Neutral reactance of wye(star)-connected load in actual ohms. May be positive or negative.

Name: `XNeut`
Units: Ω
Default: 0.0

(Getter)
"""
function XNeut(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XNeut)
end

"""
Neutral reactance of wye(star)-connected load in actual ohms. May be positive or negative.

Name: `XNeut`
Units: Ω
Default: 0.0

(Setter)
"""
function XNeut(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XNeut, value, flags)
end

"""
={Variable | Fixed | Exempt}.  Default is variable. If Fixed, no load multipliers apply;  however, growth multipliers do apply.  All multipliers apply to Variable loads.  Exempt loads are not modified by the global load multiplier, such as in load duration curves, etc.  Daily multipliers do apply, so setting this property to Exempt is a good way to represent industrial load that stays the same day-after-day for the period study.

Name: `Status`
Default: Variable

(Getter)
"""
function Status(obj::Obj)::LoadStatus.T
    LoadStatus.T(obj_get_int32(obj, _PropertyIndex.Status))
end

"""
={Variable | Fixed | Exempt}.  Default is variable. If Fixed, no load multipliers apply;  however, growth multipliers do apply.  All multipliers apply to Variable loads.  Exempt loads are not modified by the global load multiplier, such as in load duration curves, etc.  Daily multipliers do apply, so setting this property to Exempt is a good way to represent industrial load that stays the same day-after-day for the period study.

Name: `Status`
Default: Variable

(Setter)
"""
function Status(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Status, value, flags)
end

"""
={Variable | Fixed | Exempt}.  Default is variable. If Fixed, no load multipliers apply;  however, growth multipliers do apply.  All multipliers apply to Variable loads.  Exempt loads are not modified by the global load multiplier, such as in load duration curves, etc.  Daily multipliers do apply, so setting this property to Exempt is a good way to represent industrial load that stays the same day-after-day for the period study.

Name: `Status`
Default: Variable

(Setter)
"""
function Status(obj::Obj, value::Union{Int,LoadStatus.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Status, Int32(value), flags)
end

"""
={Variable | Fixed | Exempt}.  Default is variable. If Fixed, no load multipliers apply;  however, growth multipliers do apply.  All multipliers apply to Variable loads.  Exempt loads are not modified by the global load multiplier, such as in load duration curves, etc.  Daily multipliers do apply, so setting this property to Exempt is a good way to represent industrial load that stays the same day-after-day for the period study.

Name: `Status`
Default: Variable

(Getter)
"""
function Status_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Status)
end

"""
={Variable | Fixed | Exempt}.  Default is variable. If Fixed, no load multipliers apply;  however, growth multipliers do apply.  All multipliers apply to Variable loads.  Exempt loads are not modified by the global load multiplier, such as in load duration curves, etc.  Daily multipliers do apply, so setting this property to Exempt is a good way to represent industrial load that stays the same day-after-day for the period study.

Name: `Status`
Default: Variable

(Setter)
"""
function Status_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Status(obj, value, flags)
end

"""
An arbitrary integer number representing the class of load so that load values may be segregated by load value. Default is 1; not used internally.

Name: `Class`
Default: 1

(Getter)
"""
function Class(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Class)
end

"""
An arbitrary integer number representing the class of load so that load values may be segregated by load value. Default is 1; not used internally.

Name: `Class`
Default: 1

(Setter)
"""
function Class(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Class, value, flags)
end

"""
Default = 0.95.  Minimum per unit voltage for which the MODEL is assumed to apply. Lower end of normal voltage range.Below this value, the load model reverts to a constant impedance model that matches the model at the transition voltage. See also "Vlowpu" which causes the model to match Model=2 below the transition voltage.

Name: `VMinpu`
Default: 0.95

(Getter)
"""
function VMinpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMinpu)
end

"""
Default = 0.95.  Minimum per unit voltage for which the MODEL is assumed to apply. Lower end of normal voltage range.Below this value, the load model reverts to a constant impedance model that matches the model at the transition voltage. See also "Vlowpu" which causes the model to match Model=2 below the transition voltage.

Name: `VMinpu`
Default: 0.95

(Setter)
"""
function VMinpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMinpu, value, flags)
end

"""
Default = 1.05.  Maximum per unit voltage for which the MODEL is assumed to apply. Above this value, the load model reverts to a constant impedance model.

Name: `VMaxpu`
Default: 1.05

(Getter)
"""
function VMaxpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMaxpu)
end

"""
Default = 1.05.  Maximum per unit voltage for which the MODEL is assumed to apply. Above this value, the load model reverts to a constant impedance model.

Name: `VMaxpu`
Default: 1.05

(Setter)
"""
function VMaxpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMaxpu, value, flags)
end

"""
Minimum per unit voltage for load EEN evaluations, Normal limit.  Default = 0, which defaults to system "vminnorm" property (see Set Command under Executive).  If this property is specified, it ALWAYS overrides the system specification. This allows you to have different criteria for different loads. Set to zero to revert to the default system value.

Name: `VMinNorm`
Default: 0.0

(Getter)
"""
function VMinNorm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMinNorm)
end

"""
Minimum per unit voltage for load EEN evaluations, Normal limit.  Default = 0, which defaults to system "vminnorm" property (see Set Command under Executive).  If this property is specified, it ALWAYS overrides the system specification. This allows you to have different criteria for different loads. Set to zero to revert to the default system value.

Name: `VMinNorm`
Default: 0.0

(Setter)
"""
function VMinNorm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMinNorm, value, flags)
end

"""
Minimum per unit voltage for load UE evaluations, Emergency limit.  Default = 0, which defaults to system "vminemerg" property (see Set Command under Executive).  If this property is specified, it ALWAYS overrides the system specification. This allows you to have different criteria for different loads. Set to zero to revert to the default system value.

Name: `VMinEmerg`
Default: 0.0

(Getter)
"""
function VMinEmerg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMinEmerg)
end

"""
Minimum per unit voltage for load UE evaluations, Emergency limit.  Default = 0, which defaults to system "vminemerg" property (see Set Command under Executive).  If this property is specified, it ALWAYS overrides the system specification. This allows you to have different criteria for different loads. Set to zero to revert to the default system value.

Name: `VMinEmerg`
Default: 0.0

(Setter)
"""
function VMinEmerg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMinEmerg, value, flags)
end

"""
Default = 0.0.  Rated kVA of service transformer for allocating loads based on connected kVA at a bus. Side effect:  kW, PF, and kvar are modified. See help on kVA.

Name: `XfkVA`
Units: kVA
Default: 0.0

(Getter)
"""
function XfkVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XfkVA)
end

"""
Default = 0.0.  Rated kVA of service transformer for allocating loads based on connected kVA at a bus. Side effect:  kW, PF, and kvar are modified. See help on kVA.

Name: `XfkVA`
Units: kVA
Default: 0.0

(Setter)
"""
function XfkVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XfkVA, value, flags)
end

"""
Default = 0.5.  Allocation factor for allocating loads based on connected kVA at a bus. Side effect:  kW, PF, and kvar are modified by multiplying this factor times the XFKVA (if > 0).

Name: `AllocationFactor`
Default: 0.5

(Getter)
"""
function AllocationFactor(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.AllocationFactor)
end

"""
Default = 0.5.  Allocation factor for allocating loads based on connected kVA at a bus. Side effect:  kW, PF, and kvar are modified by multiplying this factor times the XFKVA (if > 0).

Name: `AllocationFactor`
Default: 0.5

(Setter)
"""
function AllocationFactor(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.AllocationFactor, value, flags)
end

"""
Specify base Load in kVA (and power factor)

Legal ways to define base load:
kW, PF
kW, kvar
kVA, PF
XFKVA × Allocationfactor, PF
kWh / (kWhdays × 24) × Cfactor, PF

Name: `kVA`
Units: kVA

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
Specify base Load in kVA (and power factor)

Legal ways to define base load:
kW, PF
kW, kvar
kVA, PF
XFKVA × Allocationfactor, PF
kWh / (kWhdays × 24) × Cfactor, PF

Name: `kVA`
Units: kVA

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
Percent mean value for load to use for monte carlo studies if no loadshape is assigned to this load.

Name: `%Mean`
Default: 50.0

(Getter)
"""
function pctMean(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctMean)
end

"""
Percent mean value for load to use for monte carlo studies if no loadshape is assigned to this load.

Name: `%Mean`
Default: 50.0

(Setter)
"""
function pctMean(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctMean, value, flags)
end

"""
Percent Std deviation value for load to use for monte carlo studies if no loadshape is assigned to this load.

Name: `%StdDev`
Default: 10.0

(Getter)
"""
function pctStdDev(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctStdDev)
end

"""
Percent Std deviation value for load to use for monte carlo studies if no loadshape is assigned to this load.

Name: `%StdDev`
Default: 10.0

(Setter)
"""
function pctStdDev(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctStdDev, value, flags)
end

"""
Percent reduction in active power (watts) per 1% reduction in voltage from 100% rated.
 Typical values range from 0.4 to 0.8. Applies to Model=4 only.
 Intended to represent conservation voltage reduction or voltage optimization measures.

Name: `CVRWatts`
Default: 1.0

(Getter)
"""
function CVRWatts(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CVRWatts)
end

"""
Percent reduction in active power (watts) per 1% reduction in voltage from 100% rated.
 Typical values range from 0.4 to 0.8. Applies to Model=4 only.
 Intended to represent conservation voltage reduction or voltage optimization measures.

Name: `CVRWatts`
Default: 1.0

(Setter)
"""
function CVRWatts(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CVRWatts, value, flags)
end

"""
Percent reduction in reactive power (vars) per 1% reduction in voltage from 100% rated. 
 Typical values range from 2 to 3. Applies to Model=4 only.
 Intended to represent conservation voltage reduction or voltage optimization measures.

Name: `CVRVars`
Default: 2.0

(Getter)
"""
function CVRVars(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CVRVars)
end

"""
Percent reduction in reactive power (vars) per 1% reduction in voltage from 100% rated. 
 Typical values range from 2 to 3. Applies to Model=4 only.
 Intended to represent conservation voltage reduction or voltage optimization measures.

Name: `CVRVars`
Default: 2.0

(Setter)
"""
function CVRVars(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CVRVars, value, flags)
end

"""
kWh billed for this period. See help on kVA and Cfactor and kWhDays.

Name: `kWh`
Units: kWh
Default: 0.0

(Getter)
"""
function kWh(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWh)
end

"""
kWh billed for this period. See help on kVA and Cfactor and kWhDays.

Name: `kWh`
Units: kWh
Default: 0.0

(Setter)
"""
function kWh(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWh, value, flags)
end

"""
Length of kWh billing period in days (24 hr days). Average demand is computed using this value.

Name: `kWhDays`
Default: 30.0

(Getter)
"""
function kWhDays(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWhDays)
end

"""
Length of kWh billing period in days (24 hr days). Average demand is computed using this value.

Name: `kWhDays`
Default: 30.0

(Setter)
"""
function kWhDays(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWhDays, value, flags)
end

"""
Factor relating average kW to peak kW. See kWh and kWhdays. See kVA.

Name: `CFactor`
Default: 4.0

(Getter)
"""
function CFactor(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CFactor)
end

"""
Factor relating average kW to peak kW. See kWh and kWhdays. See kVA.

Name: `CFactor`
Default: 4.0

(Setter)
"""
function CFactor(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CFactor, value, flags)
end

"""
Default is NONE. Curve describing both watt and var factors as a function of time. Refers to a LoadShape object with both Mult and Qmult defined. Define a Loadshape to agree with yearly or daily curve according to the type of analysis being done. If NONE, the CVRwatts and CVRvars factors are used and assumed constant.

Name: `CVRCurve`

(Getter)
"""
function CVRCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CVRCurve)
end

"""
Default is NONE. Curve describing both watt and var factors as a function of time. Refers to a LoadShape object with both Mult and Qmult defined. Define a Loadshape to agree with yearly or daily curve according to the type of analysis being done. If NONE, the CVRwatts and CVRvars factors are used and assumed constant.

Name: `CVRCurve`

(Setter)
"""
function CVRCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CVRCurve, value, flags)
end

"""
Default is NONE. Curve describing both watt and var factors as a function of time. Refers to a LoadShape object with both Mult and Qmult defined. Define a Loadshape to agree with yearly or daily curve according to the type of analysis being done. If NONE, the CVRwatts and CVRvars factors are used and assumed constant.

Name: `CVRCurve`

(Getter)
"""
function CVRCurve(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.CVRCurve, LoadShapeObj)
end

"""
Default is NONE. Curve describing both watt and var factors as a function of time. Refers to a LoadShape object with both Mult and Qmult defined. Define a Loadshape to agree with yearly or daily curve according to the type of analysis being done. If NONE, the CVRwatts and CVRvars factors are used and assumed constant.

Name: `CVRCurve`

(Setter)
"""
function CVRCurve(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.CVRCurve, value, flags)
end

"""
Default is NONE. Curve describing both watt and var factors as a function of time. Refers to a LoadShape object with both Mult and Qmult defined. Define a Loadshape to agree with yearly or daily curve according to the type of analysis being done. If NONE, the CVRwatts and CVRvars factors are used and assumed constant.

Name: `CVRCurve`

(Setter)
"""
function CVRCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CVRCurve, value, flags)
end

"""
Number of customers, this load.

Name: `NumCust`
Default: 1

(Getter)
"""
function NumCust(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NumCust)
end

"""
Number of customers, this load.

Name: `NumCust`
Default: 1

(Setter)
"""
function NumCust(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NumCust, value, flags)
end

"""
Array of 7 coefficients:

 First 3 are ZIP weighting factors for real power (should sum to 1)
 Next 3 are ZIP weighting factors for reactive power (should sum to 1)
 Last 1 is cut-off voltage in p.u. of base kV; load is 0 below this cut-off
 No defaults; all coefficients must be specified if using model=8.

Name: `ZIPV`

(Getter)
"""
function ZIPV(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.ZIPV)
end

"""
Array of 7 coefficients:

 First 3 are ZIP weighting factors for real power (should sum to 1)
 Next 3 are ZIP weighting factors for reactive power (should sum to 1)
 Last 1 is cut-off voltage in p.u. of base kV; load is 0 below this cut-off
 No defaults; all coefficients must be specified if using model=8.

Name: `ZIPV`

(Setter)
"""
function ZIPV(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.ZIPV, value, flags)
end

"""
Percent of load that is series R-L for Harmonic studies. Remainder is assumed to be parallel R and L. This can have a significant impact on the amount of damping observed in Harmonics solutions.

Name: `%SeriesRL`
Default: 50.0

(Getter)
"""
function pctSeriesRL(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctSeriesRL)
end

"""
Percent of load that is series R-L for Harmonic studies. Remainder is assumed to be parallel R and L. This can have a significant impact on the amount of damping observed in Harmonics solutions.

Name: `%SeriesRL`
Default: 50.0

(Setter)
"""
function pctSeriesRL(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctSeriesRL, value, flags)
end

"""
Relative weighting factor for reliability calcs. Used to designate high priority loads such as hospitals, etc. 

Is multiplied by number of customers and load kW during reliability calcs.

Name: `RelWeight`
Default: 1.0

(Getter)
"""
function RelWeight(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RelWeight)
end

"""
Relative weighting factor for reliability calcs. Used to designate high priority loads such as hospitals, etc. 

Is multiplied by number of customers and load kW during reliability calcs.

Name: `RelWeight`
Default: 1.0

(Setter)
"""
function RelWeight(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RelWeight, value, flags)
end

"""
Per unit voltage at which the model switches to same as constant Z model (model=2). This allows more consistent convergence at very low voltaes due to opening switches or solving for fault situations.

Name: `VLowpu`
Default: 0.5

(Getter)
"""
function VLowpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VLowpu)
end

"""
Per unit voltage at which the model switches to same as constant Z model (model=2). This allows more consistent convergence at very low voltaes due to opening switches or solving for fault situations.

Name: `VLowpu`
Default: 0.5

(Setter)
"""
function VLowpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VLowpu, value, flags)
end

"""
Special reactance, pu (based on kVA, kV properties), for the series impedance branch in the load model for HARMONICS analysis. Generally used to represent motor load blocked rotor reactance. If not specified (that is, set =0, the default value), the series branch is computed from the percentage of the nominal load at fundamental frequency specified by the %SERIESRL property. 

Applies to load model in HARMONICS mode only.

A typical value would be approximately 0.20 pu based on kVA × %SeriesRL / 100.0.

Name: `puXHarm`

(Getter)
"""
function puXHarm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.puXHarm)
end

"""
Special reactance, pu (based on kVA, kV properties), for the series impedance branch in the load model for HARMONICS analysis. Generally used to represent motor load blocked rotor reactance. If not specified (that is, set =0, the default value), the series branch is computed from the percentage of the nominal load at fundamental frequency specified by the %SERIESRL property. 

Applies to load model in HARMONICS mode only.

A typical value would be approximately 0.20 pu based on kVA × %SeriesRL / 100.0.

Name: `puXHarm`

(Setter)
"""
function puXHarm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.puXHarm, value, flags)
end

"""
X/R ratio of the special harmonics mode reactance specified by the puXHARM property at fundamental frequency.

Name: `XRHarm`
Default: 6.0

(Getter)
"""
function XRHarm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XRHarm)
end

"""
X/R ratio of the special harmonics mode reactance specified by the puXHARM property at fundamental frequency.

Name: `XRHarm`
Default: 6.0

(Setter)
"""
function XRHarm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XRHarm, value, flags)
end

"""
Name of harmonic current spectrum for this load.

Name: `Spectrum`
Default: defaultload

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic current spectrum for this load.

Name: `Spectrum`
Default: defaultload

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic current spectrum for this load.

Name: `Spectrum`
Default: defaultload

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic current spectrum for this load.

Name: `Spectrum`
Default: defaultload

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic current spectrum for this load.

Name: `Spectrum`
Default: defaultload

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

end # module Load
export Load
