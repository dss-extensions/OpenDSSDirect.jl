module Generic5
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection
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


const _cls_name = "Generic5"
const _cls_idx = 52

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const kW = Int32(4)
const PF = Int32(5)
const Conn = Int32(6)
const kVA = Int32(7)
const P_Ref1kW = Int32(8)
const P_Ref2kW = Int32(9)
const P_Ref3kW = Int32(10)
const V_Ref1kVLN = Int32(11)
const V_Ref2kVLN = Int32(12)
const V_Ref3kVLN = Int32(13)
const P_RefkW = Int32(14)
const Q_RefkVAr = Int32(15)
const Cluster_Num = Int32(16)
const V_refkVLN = Int32(17)
const Ctrl_Mode = Int32(18)
const QV_flag = Int32(19)
const kcd = Int32(20)
const kcq = Int32(21)
const kqi = Int32(22)
const Q_ref1kvar = Int32(23)
const Q_ref2kvar = Int32(24)
const Q_ref3kvar = Int32(25)
const PMaxkW = Int32(26)
const PMinkW = Int32(27)
const PQPriority = Int32(28)
const PmppkW = Int32(29)
const Pfctr1 = Int32(30)
const Pfctr2 = Int32(31)
const Pfctr3 = Int32(32)
const Pfctr4 = Int32(33)
const Pfctr5 = Int32(34)
const Pfctr6 = Int32(35)
const PbiaskW = Int32(36)
const CC_Switch = Int32(37)
const kcq_drp2 = Int32(38)
const Volt_Trhd = Int32(39)
const Droop = Int32(40)
const Spectrum = Int32(41)
const BaseFreq = Int32(42)
const Enabled = Int32(43)
const Like = Int32(44)
end

struct Generic5Obj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export Generic5Obj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = Generic5Obj(ptr, dss)
const Obj = Generic5Obj

function Base.show(io::IO, obj::Generic5Obj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of Phases, this Induction Machine.  

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases, this Induction Machine.  

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the Induction Machine is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the Induction Machine is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV. For 2- and 3-phase machines, specify phase-phase kV. Otherwise, specify actual kV across each branch of the machine. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
Nominal rated (1.0 per unit) voltage, kV. For 2- and 3-phase machines, specify phase-phase kV. Otherwise, specify actual kV across each branch of the machine. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
Shaft Power, kW, for the Induction Machine. Output limit of a DG

Name: `kW`
Default: -0.001

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Shaft Power, kW, for the Induction Machine. Output limit of a DG

Name: `kW`
Default: -0.001

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
[Read Only] Present power factor for the machine. 

**Read-only**

Name: `PF`

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
[Read Only] Present power factor for the machine. 

**Read-only**

Name: `PF`

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Rated kVA for the machine.

Name: `kVA`
Default: -0.0012

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
Rated kVA for the machine.

Name: `kVA`
Default: -0.0012

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
P_ref1kW = 10, goes to P_ref1, unit kW, 1st phase set power

Name: `P_Ref1kW`
Default: 0.0

(Getter)
"""
function P_Ref1kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.P_Ref1kW)
end

"""
P_ref1kW = 10, goes to P_ref1, unit kW, 1st phase set power

Name: `P_Ref1kW`
Default: 0.0

(Setter)
"""
function P_Ref1kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.P_Ref1kW, value, flags)
end

"""
P_ref2kW = 10, goes to P_ref2, unit kW, 2nd phase set power

Name: `P_Ref2kW`
Default: 0.0

(Getter)
"""
function P_Ref2kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.P_Ref2kW)
end

"""
P_ref2kW = 10, goes to P_ref2, unit kW, 2nd phase set power

Name: `P_Ref2kW`
Default: 0.0

(Setter)
"""
function P_Ref2kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.P_Ref2kW, value, flags)
end

"""
P_ref3kW = 10, goes to P_ref3, unit kW, 3rd phase set power

Name: `P_Ref3kW`
Default: 0.0

(Getter)
"""
function P_Ref3kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.P_Ref3kW)
end

"""
P_ref3kW = 10, goes to P_ref3, unit kW, 3rd phase set power

Name: `P_Ref3kW`
Default: 0.0

(Setter)
"""
function P_Ref3kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.P_Ref3kW, value, flags)
end

"""
V_ref1kVLN = 2.16, 1st phase set V, (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref 

Name: `V_Ref1kVLN`
Default: 0.0

(Getter)
"""
function V_Ref1kVLN(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.V_Ref1kVLN)
end

"""
V_ref1kVLN = 2.16, 1st phase set V, (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref 

Name: `V_Ref1kVLN`
Default: 0.0

(Setter)
"""
function V_Ref1kVLN(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.V_Ref1kVLN, value, flags)
end

"""
V_ref2kVLN = 2.16, 2nd phase set V, (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref 

Name: `V_Ref2kVLN`
Default: 0.0

(Getter)
"""
function V_Ref2kVLN(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.V_Ref2kVLN)
end

"""
V_ref2kVLN = 2.16, 2nd phase set V, (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref 

Name: `V_Ref2kVLN`
Default: 0.0

(Setter)
"""
function V_Ref2kVLN(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.V_Ref2kVLN, value, flags)
end

"""
V_ref3kVLN = 2.16, 3rd phase set V, (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref 

Name: `V_Ref3kVLN`
Default: 0.0

(Getter)
"""
function V_Ref3kVLN(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.V_Ref3kVLN)
end

"""
V_ref3kVLN = 2.16, 3rd phase set V, (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref 

Name: `V_Ref3kVLN`
Default: 0.0

(Setter)
"""
function V_Ref3kVLN(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.V_Ref3kVLN, value, flags)
end

"""
P_refkW = 10, goes to P_ref. Ref P Value (kW). P_ref has priority to kW which is nominal value. (Incide variable P_ref is W)

Name: `P_RefkW`
Default: 0.0

(Getter)
"""
function P_RefkW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.P_RefkW)
end

"""
P_refkW = 10, goes to P_ref. Ref P Value (kW). P_ref has priority to kW which is nominal value. (Incide variable P_ref is W)

Name: `P_RefkW`
Default: 0.0

(Setter)
"""
function P_RefkW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.P_RefkW, value, flags)
end

"""
Q_refkVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_RefkVAr`
Default: 0.0

(Getter)
"""
function Q_RefkVAr(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Q_RefkVAr)
end

"""
Q_refkVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_RefkVAr`
Default: 0.0

(Setter)
"""
function Q_RefkVAr(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Q_RefkVAr, value, flags)
end

"""
Cluster_num: has to be coincident with Fmonitor attached. Default value is 0

Name: `Cluster_Num`
Default: 0

(Getter)
"""
function Cluster_Num(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Cluster_Num)
end

"""
Cluster_num: has to be coincident with Fmonitor attached. Default value is 0

Name: `Cluster_Num`
Default: 0

(Setter)
"""
function Cluster_Num(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Cluster_Num, value, flags)
end

"""
V_refkVLN = 2.16, pos sequence set V. V_ref (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref

Name: `V_refkVLN`
Default: 0.001

(Getter)
"""
function V_refkVLN(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.V_refkVLN)
end

"""
V_refkVLN = 2.16, pos sequence set V. V_ref (Unit kV, L-N value): V mode will work if QV_flag =1(by default) V_ref is set which is prior to Q_ref

Name: `V_refkVLN`
Default: 0.001

(Setter)
"""
function V_refkVLN(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.V_refkVLN, value, flags)
end

"""
ctrl mode:     /// contrl mode     ///    ctrl_mode =0; phases = 3;  // pos avg control---p_ref, V_ref, Q_ref    \\n 
 ///    ctrl_mode =1; phases = 1; bus1 = 452.1;      ---p_ref1, V_ref1, Q_ref1 \\n
///    ctrl_mode =2; phases = 1; bus1 = 452.2;      ---p_ref2, V_ref2, Q_ref2 \\n
///    ctrl_mode =3; phases = 1; bus1 = 452.3;      ---p_ref3, V_ref3, Q_ref3 \\n
///    ctrl_mode =4; phases = 3; bus1 = 452.2;      ---p_ref1,2,3, V_ref1,2,3, Q_ref1,2,3

Name: `Ctrl_Mode`
Default: 0

(Getter)
"""
function Ctrl_Mode(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Ctrl_Mode)
end

"""
ctrl mode:     /// contrl mode     ///    ctrl_mode =0; phases = 3;  // pos avg control---p_ref, V_ref, Q_ref    \\n 
 ///    ctrl_mode =1; phases = 1; bus1 = 452.1;      ---p_ref1, V_ref1, Q_ref1 \\n
///    ctrl_mode =2; phases = 1; bus1 = 452.2;      ---p_ref2, V_ref2, Q_ref2 \\n
///    ctrl_mode =3; phases = 1; bus1 = 452.3;      ---p_ref3, V_ref3, Q_ref3 \\n
///    ctrl_mode =4; phases = 3; bus1 = 452.2;      ---p_ref1,2,3, V_ref1,2,3, Q_ref1,2,3

Name: `Ctrl_Mode`
Default: 0

(Setter)
"""
function Ctrl_Mode(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Ctrl_Mode, value, flags)
end

"""
QV_flag : 0-Q_ref mode; 1- V_ref mode

Name: `QV_flag`
Default: 0

(Getter)
"""
function QV_flag(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.QV_flag)
end

"""
QV_flag : 0-Q_ref mode; 1- V_ref mode

Name: `QV_flag`
Default: 0

(Setter)
"""
function QV_flag(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.QV_flag, value, flags)
end

"""
kcd: Idi control gain

Name: `kcd`
Default: 0.1

(Getter)
"""
function kcd(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kcd)
end

"""
kcd: Idi control gain

Name: `kcd`
Default: 0.1

(Setter)
"""
function kcd(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kcd, value, flags)
end

"""
kcq: Iqi control gain to delta V

Name: `kcq`
Default: 0.1

(Getter)
"""
function kcq(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kcq)
end

"""
kcq: Iqi control gain to delta V

Name: `kcq`
Default: 0.1

(Setter)
"""
function kcq(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kcq, value, flags)
end

"""
kqi: Iqi control gain to delta Q

Name: `kqi`
Default: 0.1

(Getter)
"""
function kqi(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kqi)
end

"""
kqi: Iqi control gain to delta Q

Name: `kqi`
Default: 0.1

(Setter)
"""
function kqi(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kqi, value, flags)
end

"""
Q_ref1kVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_ref1kvar`
Default: 0.0

(Getter)
"""
function Q_ref1kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Q_ref1kvar)
end

"""
Q_ref1kVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_ref1kvar`
Default: 0.0

(Setter)
"""
function Q_ref1kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Q_ref1kvar, value, flags)
end

"""
Q_ref2kVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_ref2kvar`
Default: 0.0

(Getter)
"""
function Q_ref2kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Q_ref2kvar)
end

"""
Q_ref2kVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_ref2kvar`
Default: 0.0

(Setter)
"""
function Q_ref2kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Q_ref2kvar, value, flags)
end

"""
Q_ref3kVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_ref3kvar`
Default: 0.0

(Getter)
"""
function Q_ref3kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Q_ref3kvar)
end

"""
Q_ref3kVAr=10. Unit Qvar. Ref Q kVAr Value: work only when V_ref is not set

Name: `Q_ref3kvar`
Default: 0.0

(Setter)
"""
function Q_ref3kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Q_ref3kvar, value, flags)
end

"""
PmaxkW = 100, goes to Pmax, unit kW, set max active power output; Operation limit of active power for DG
  Pmax should be less than or equal to kW

Name: `PMaxkW`
Default: -0.001

(Getter)
"""
function PMaxkW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PMaxkW)
end

"""
PmaxkW = 100, goes to Pmax, unit kW, set max active power output; Operation limit of active power for DG
  Pmax should be less than or equal to kW

Name: `PMaxkW`
Default: -0.001

(Setter)
"""
function PMaxkW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PMaxkW, value, flags)
end

"""
PminkW = 10, goes to Pmin, unit kW; Operation limit of active power for DG

Name: `PMinkW`
Default: 0.0

(Getter)
"""
function PMinkW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PMinkW)
end

"""
PminkW = 10, goes to Pmin, unit kW; Operation limit of active power for DG

Name: `PMinkW`
Default: 0.0

(Setter)
"""
function PMinkW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PMinkW, value, flags)
end

"""
PQpriority, goes to PQpriority, define how to set Qmax. 0: Q,1: P 

Name: `PQPriority`
Default: 1

(Getter)
"""
function PQPriority(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.PQPriority)
end

"""
PQpriority, goes to PQpriority, define how to set Qmax. 0: Q,1: P 

Name: `PQPriority`
Default: 1

(Setter)
"""
function PQPriority(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.PQPriority, value, flags)
end

"""
PmppkW = 100, goes to Pmpp, unit kW, input Pmpp to calculate kW;
  kW := (Pmpp + Pbias)*Pfctr1*Pfctr2*Pfctr3*Pfctr4*Pfctr5*Pfctr6;
Pbias = 0 by default, Pfctr*=1 by default; These properties will overwrite kW.

Name: `PmppkW`
Default: 0.001

(Getter)
"""
function PmppkW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PmppkW)
end

"""
PmppkW = 100, goes to Pmpp, unit kW, input Pmpp to calculate kW;
  kW := (Pmpp + Pbias)*Pfctr1*Pfctr2*Pfctr3*Pfctr4*Pfctr5*Pfctr6;
Pbias = 0 by default, Pfctr*=1 by default; These properties will overwrite kW.

Name: `PmppkW`
Default: 0.001

(Setter)
"""
function PmppkW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PmppkW, value, flags)
end

"""
Pfctr1 = 0.16, see PmppkW

Name: `Pfctr1`
Default: 1.0

(Getter)
"""
function Pfctr1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pfctr1)
end

"""
Pfctr1 = 0.16, see PmppkW

Name: `Pfctr1`
Default: 1.0

(Setter)
"""
function Pfctr1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pfctr1, value, flags)
end

"""
Pfctr2 = 1, 1 by default, see PmppkW

Name: `Pfctr2`
Default: 1.0

(Getter)
"""
function Pfctr2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pfctr2)
end

"""
Pfctr2 = 1, 1 by default, see PmppkW

Name: `Pfctr2`
Default: 1.0

(Setter)
"""
function Pfctr2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pfctr2, value, flags)
end

"""
Pfctr3 = 1, 1 by default, see PmppkW

Name: `Pfctr3`
Default: 1.0

(Getter)
"""
function Pfctr3(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pfctr3)
end

"""
Pfctr3 = 1, 1 by default, see PmppkW

Name: `Pfctr3`
Default: 1.0

(Setter)
"""
function Pfctr3(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pfctr3, value, flags)
end

"""
Pfctr4= 1, 1 by default, see PmppkW

Name: `Pfctr4`
Default: 1.0

(Getter)
"""
function Pfctr4(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pfctr4)
end

"""
Pfctr4= 1, 1 by default, see PmppkW

Name: `Pfctr4`
Default: 1.0

(Setter)
"""
function Pfctr4(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pfctr4, value, flags)
end

"""
Pfctr5 =1, 1 by default, see PmppkW

Name: `Pfctr5`
Default: 1.0

(Getter)
"""
function Pfctr5(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pfctr5)
end

"""
Pfctr5 =1, 1 by default, see PmppkW

Name: `Pfctr5`
Default: 1.0

(Setter)
"""
function Pfctr5(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pfctr5, value, flags)
end

"""
Pfctr6 = 1, 1 by default, see PmppkW

Name: `Pfctr6`
Default: 1.0

(Getter)
"""
function Pfctr6(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pfctr6)
end

"""
Pfctr6 = 1, 1 by default, see PmppkW

Name: `Pfctr6`
Default: 1.0

(Setter)
"""
function Pfctr6(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pfctr6, value, flags)
end

"""
Pbias = -0.1, 0 by default, see PmppkW

Name: `PbiaskW`
Default: 0.0

(Getter)
"""
function PbiaskW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PbiaskW)
end

"""
Pbias = -0.1, 0 by default, see PmppkW

Name: `PbiaskW`
Default: 0.0

(Setter)
"""
function PbiaskW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PbiaskW, value, flags)
end

"""
CC_Switch: default value is false.
CC_Switch = true --cooperate control on
CC_Switch = false -- cooperate control off

Name: `CC_Switch`
Default: False

(Getter)
"""
function CC_Switch(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.CC_Switch)
end

"""
CC_Switch: default value is false.
CC_Switch = true --cooperate control on
CC_Switch = false -- cooperate control off

Name: `CC_Switch`
Default: False

(Setter)
"""
function CC_Switch(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.CC_Switch, value, flags)
end

"""
kcq_drp2. the droop gain: 0.0~0.1

Name: `kcq_drp2`
Default: 0.0

(Getter)
"""
function kcq_drp2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kcq_drp2)
end

"""
kcq_drp2. the droop gain: 0.0~0.1

Name: `kcq_drp2`
Default: 0.0

(Setter)
"""
function kcq_drp2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kcq_drp2, value, flags)
end

"""
Volt_Trhd. 0.~0.05. 0 means v has to follow v_ref

Name: `Volt_Trhd`
Default: 0.0

(Getter)
"""
function Volt_Trhd(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Volt_Trhd)
end

"""
Volt_Trhd. 0.~0.05. 0 means v has to follow v_ref

Name: `Volt_Trhd`
Default: 0.0

(Setter)
"""
function Volt_Trhd(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Volt_Trhd, value, flags)
end

"""
droop type: integer: 2- Q = kcq_drp2 * (1-v_dg). others: integral droop with kcq.

Name: `Droop`
Default: 0

(Getter)
"""
function Droop(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Droop)
end

"""
droop type: integer: 2- Q = kcq_drp2 * (1-v_dg). others: integral droop with kcq.

Name: `Droop`
Default: 0

(Setter)
"""
function Droop(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Droop, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: default

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

end # module Generic5
export Generic5
