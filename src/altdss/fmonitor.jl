module FMonitor
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: FMonitorAction
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "FMonitor"
const _cls_idx = 51

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const Action = Int32(3)
const P_Trans_Ref = Int32(4)
const Node_Num = Int32(5)
const Cluster_Num = Int32(6)
const Nodes = Int32(7)
const CommVector = Int32(8)
const ElemTableLine = Int32(9)
const P_Mode = Int32(10)
const CommDelayVector = Int32(11)
const T_IntVL_Smpl = Int32(12)
const MaxLocalMem = Int32(13)
const Volt_Limits_pu = Int32(14)
const b_Curt_Ctrl = Int32(15)
const Up_Dly = Int32(16)
const Virtual_LD_Node = Int32(17)
const EGen = Int32(18)
const Attack_Defense = Int32(19)
const Comm_Hide = Int32(20)
const Comm_Node_Hide = Int32(21)
const BaseFreq = Int32(22)
const Enabled = Int32(23)
const Like = Int32(24)
end

struct FMonitorObj <: AbstractMeterElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export FMonitorObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = FMonitorObj(ptr, dss)
const Obj = FMonitorObj

function Base.show(io::IO, obj::FMonitorObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the monitor is connected. 1 or 2, typically. For monitoring states, attach monitor to terminal 1.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the monitor is connected. 1 or 2, typically. For monitoring states, attach monitor to terminal 1.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
{Clear | Save | Take | Process}
(C)lears or (S)aves current buffer.
(T)ake action takes a sample.
(P)rocesses the data taken so far (e.g. Pst for mode 4).

Note that monitors are automatically reset (cleared) when the Set Mode= command is issued. Otherwise, the user must explicitly reset all monitors (reset monitors command) or individual monitors with the Clear action.

Name: `Action`
"""
function Action(obj::Obj, value::Union{Int,FMonitorAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
{Clear | Save | Take | Process}
(C)lears or (S)aves current buffer.
(T)ake action takes a sample.
(P)rocesses the data taken so far (e.g. Pst for mode 4).

Note that monitors are automatically reset (cleared) when the Set Mode= command is issued. Otherwise, the user must explicitly reset all monitors (reset monitors command) or individual monitors with the Clear action.

Name: `Action`
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value)
end

"""Shortcut to Action(FMonitorAction.Clear)"""
function Clear(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, FMonitorAction.T.Clear, flags)
end

"""Shortcut to Action(FMonitorAction.Reset)"""
function Reset(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, FMonitorAction.T.Reset, flags)
end

"""
P_trans_ref: P ref value for metered element(unit kW)

Name: `P_Trans_Ref`
Default: 0.0

(Getter)
"""
function P_Trans_Ref(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.P_Trans_Ref)
end

"""
P_trans_ref: P ref value for metered element(unit kW)

Name: `P_Trans_Ref`
Default: 0.0

(Setter)
"""
function P_Trans_Ref(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.P_Trans_Ref, value, flags)
end

"""
Node_num
Assign a node number within a cluster

**Unused** (unused internally by the models, but can be used to transport data)

Name: `Node_Num`
Default: 0

(Getter)
"""
function Node_Num(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Node_Num)
end

"""
Node_num
Assign a node number within a cluster

**Unused** (unused internally by the models, but can be used to transport data)

Name: `Node_Num`
Default: 0

(Setter)
"""
function Node_Num(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Node_Num, value, flags)
end

"""
Cluster_num

Name: `Cluster_Num`
Default: 0

(Getter)
"""
function Cluster_Num(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Cluster_Num)
end

"""
Cluster_num

Name: `Cluster_Num`
Default: 0

(Setter)
"""
function Cluster_Num(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Cluster_Num, value, flags)
end

"""
Nodes connected to this FMonitor. Example:(Nodes=33)

Name: `Nodes`
Default: 33

(Getter)
"""
function Nodes(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Nodes)
end

"""
Nodes connected to this FMonitor. Example:(Nodes=33)

Name: `Nodes`
Default: 33

(Setter)
"""
function Nodes(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Nodes, value, flags)
end

"""
CommVector of this FMonitor. 
The first entry of this vector is the number of 
Example:(CommVector={2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
The example show node #2 can communicate to node #1,#2,#3

Name: `CommVector`

(Getter)
"""
function CommVector(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CommVector)
end

"""
CommVector of this FMonitor. 
The first entry of this vector is the number of 
Example:(CommVector={2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
The example show node #2 can communicate to node #1,#2,#3

Name: `CommVector`

(Setter)
"""
function CommVector(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CommVector, value, flags)
end

"""
ElemTableLine of the each node within this cluster. 
The first entry of this vector is the number of node within cluster 
The second entry of this vector is element name 
The third entry of this vector is terminal number 
The fourth entry of this vector is voltage sensor 
Example:(ElemTable={2,Line.1,1,1})
The example show node #2 Element

Name: `ElemTableLine`

(Getter)
"""
function ElemTableLine(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ElemTableLine)
end

"""
ElemTableLine of the each node within this cluster. 
The first entry of this vector is the number of node within cluster 
The second entry of this vector is element name 
The third entry of this vector is terminal number 
The fourth entry of this vector is voltage sensor 
Example:(ElemTable={2,Line.1,1,1})
The example show node #2 Element

Name: `ElemTableLine`

(Setter)
"""
function ElemTableLine(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ElemTableLine, value, flags)
end

"""
0 = real Power controlled by each p_ref on each DG
1 = real Power on MeteredElem controlled by DGs according to P_trans_ref
2 = Not defined
3 = Not defined

Name: `P_Mode`
Default: 0

(Getter)
"""
function P_Mode(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.P_Mode)
end

"""
0 = real Power controlled by each p_ref on each DG
1 = real Power on MeteredElem controlled by DGs according to P_trans_ref
2 = Not defined
3 = Not defined

Name: `P_Mode`
Default: 0

(Setter)
"""
function P_Mode(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.P_Mode, value, flags)
end

"""
CommDelayVector of this FMonitor. 
The first entry of this vector is the number of the node.
Example:(CommVector={2,t1,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
The example show node #2 can communicate to node #1 and #3 with time delay t1 and t2 separately

Name: `CommDelayVector`

(Getter)
"""
function CommDelayVector(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CommDelayVector)
end

"""
CommDelayVector of this FMonitor. 
The first entry of this vector is the number of the node.
Example:(CommVector={2,t1,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
The example show node #2 can communicate to node #1 and #3 with time delay t1 and t2 separately

Name: `CommDelayVector`

(Setter)
"""
function CommDelayVector(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CommDelayVector, value, flags)
end

"""
T_intvl_smpl: 
The information of each agent will be sampled at each T_comm time. Unit is second.
T_intvl_smpl is also the minimal communication time between neighbor nodes.
If T_intvl_smpl=0.0, no delay for the communication is enabled in the simulation.

Name: `T_IntVL_Smpl`
Default: 0.0

(Getter)
"""
function T_IntVL_Smpl(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.T_IntVL_Smpl)
end

"""
T_intvl_smpl: 
The information of each agent will be sampled at each T_comm time. Unit is second.
T_intvl_smpl is also the minimal communication time between neighbor nodes.
If T_intvl_smpl=0.0, no delay for the communication is enabled in the simulation.

Name: `T_IntVL_Smpl`
Default: 0.0

(Setter)
"""
function T_IntVL_Smpl(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.T_IntVL_Smpl, value, flags)
end

"""
MaxLocalMem: the max number of local memory size. No larger than 99

Name: `MaxLocalMem`
Default: 10

(Getter)
"""
function MaxLocalMem(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.MaxLocalMem)
end

"""
MaxLocalMem: the max number of local memory size. No larger than 99

Name: `MaxLocalMem`
Default: 10

(Setter)
"""
function MaxLocalMem(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.MaxLocalMem, value, flags)
end

"""
Volt_limits_pu: example "Volt_limits_pu={a0,a1, a2}"
a0: the phase number, 0 means pos. seq; a1: upper voltage limit of this cluster, usually 1.05;
a2: upper voltage limit of this cluster, usually 0.95

Name: `Volt_Limits_pu`
Default: [0, 0, 0.94999999999999996]

(Getter)
"""
function Volt_Limits_pu(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Volt_Limits_pu)
end

"""
Volt_limits_pu: example "Volt_limits_pu={a0,a1, a2}"
a0: the phase number, 0 means pos. seq; a1: upper voltage limit of this cluster, usually 1.05;
a2: upper voltage limit of this cluster, usually 0.95

Name: `Volt_Limits_pu`
Default: [0, 0, 0.94999999999999996]

(Setter)
"""
function Volt_Limits_pu(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Volt_Limits_pu, value, flags)
end

"""
b_Curt_Ctrl:set P curtailment on/off;
b_Curt_Ctrl=True: P curtailment will be implemented according to the system voltage (default);
b_Curt_Ctrl=False: P curtailment will not be implemented.

Name: `b_Curt_Ctrl`
Default: False

(Getter)
"""
function b_Curt_Ctrl(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.b_Curt_Ctrl)
end

"""
b_Curt_Ctrl:set P curtailment on/off;
b_Curt_Ctrl=True: P curtailment will be implemented according to the system voltage (default);
b_Curt_Ctrl=False: P curtailment will not be implemented.

Name: `b_Curt_Ctrl`
Default: False

(Setter)
"""
function b_Curt_Ctrl(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.b_Curt_Ctrl, value, flags)
end

"""
up_dly: delay time to upper level. For example: "up_dly := 0.05"
It can be used to simulate the time delay between clusters

Name: `Up_Dly`
Default: 0.0

(Getter)
"""
function Up_Dly(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Up_Dly)
end

"""
up_dly: delay time to upper level. For example: "up_dly := 0.05"
It can be used to simulate the time delay between clusters

Name: `Up_Dly`
Default: 0.0

(Setter)
"""
function Up_Dly(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Up_Dly, value, flags)
end

"""
Which node talks to upper level.

Name: `Virtual_LD_Node`
Default: 1

(Getter)
"""
function Virtual_LD_Node(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Virtual_LD_Node)
end

"""
Which node talks to upper level.

Name: `Virtual_LD_Node`
Default: 1

(Setter)
"""
function Virtual_LD_Node(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Virtual_LD_Node, value, flags)
end

"""
`EGen = {kVA_fm, M_fm, D_fm, Tau_fm, Ki_fm,init_time}`

where equations are:

`delta'' = omega`
`M_fm * omega'' = puPm - puPe - D_fm*omega`
`Tau_fm*Pm '' = Ki_fm * omega`
`puPm = Pm / kVA_fm, puPe = Pe / kVAM_fm;`

Everything is zero within init_time (default value is 0.5s);
`k_dltP` is the coordinator for PV control input: `u_i = k_dltP * pu_DltP + omg_fm`.

Name: `EGen`
Default: [0, 0, 0, 0, 0, 0.5, 0]

(Getter)
"""
function EGen(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.EGen)
end

"""
`EGen = {kVA_fm, M_fm, D_fm, Tau_fm, Ki_fm,init_time}`

where equations are:

`delta'' = omega`
`M_fm * omega'' = puPm - puPe - D_fm*omega`
`Tau_fm*Pm '' = Ki_fm * omega`
`puPm = Pm / kVA_fm, puPe = Pe / kVAM_fm;`

Everything is zero within init_time (default value is 0.5s);
`k_dltP` is the coordinator for PV control input: `u_i = k_dltP * pu_DltP + omg_fm`.

Name: `EGen`
Default: [0, 0, 0, 0, 0, 0.5, 0]

(Setter)
"""
function EGen(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.EGen, value, flags)
end

"""
Define attack and defense:

`attack_defense = {atk , dfs , atk_time , atk_node_num  , d_atk0  , beta_dfs, D_beta, D_p }`.

attack_defense has to be defined after ''nodes'.
Example: `attack_defense = { true , false , 0.5 , 1 , 0.1 , 5, 1 , 1}`.
Example:
(1) under attack;
(2) defense is off;
(3) attack starts at 0.5s;
(4) attack is on node 1;
(5) initial value of attack: `d_0 = 0.1`;
(6) `beta = 5`;
(7) `D_beta` is used as a multiplier on \\phi;
(8) `D_p` is used as the attack on gradient control: `D_p = 1`, which is normal; `D_p=-1`, gradient control work on the opposite.

Name: `Attack_Defense`
Default: ["no", "no", 0.5, 1, 0, 0, 1, 1]

(Getter)
"""
function Attack_Defense(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Attack_Defense)
end

"""
Define attack and defense:

`attack_defense = {atk , dfs , atk_time , atk_node_num  , d_atk0  , beta_dfs, D_beta, D_p }`.

attack_defense has to be defined after ''nodes'.
Example: `attack_defense = { true , false , 0.5 , 1 , 0.1 , 5, 1 , 1}`.
Example:
(1) under attack;
(2) defense is off;
(3) attack starts at 0.5s;
(4) attack is on node 1;
(5) initial value of attack: `d_0 = 0.1`;
(6) `beta = 5`;
(7) `D_beta` is used as a multiplier on \\phi;
(8) `D_p` is used as the attack on gradient control: `D_p = 1`, which is normal; `D_p=-1`, gradient control work on the opposite.

Name: `Attack_Defense`
Default: ["no", "no", 0.5, 1, 0, 0, 1, 1]

(Setter)
"""
function Attack_Defense(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Attack_Defense, value, flags)
end

"""
Comm_hide={...}. It is defined like CommVector.

Name: `Comm_Hide`

(Getter)
"""
function Comm_Hide(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Comm_Hide)
end

"""
Comm_hide={...}. It is defined like CommVector.

Name: `Comm_Hide`

(Setter)
"""
function Comm_Hide(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Comm_Hide, value, flags)
end

"""
Comm_node_hide={...}. It is defined like CommVector.

Name: `Comm_Node_Hide`

(Getter)
"""
function Comm_Node_Hide(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Comm_Node_Hide)
end

"""
Comm_node_hide={...}. It is defined like CommVector.

Name: `Comm_Node_Hide`

(Setter)
"""
function Comm_Node_Hide(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Comm_Node_Hide, value, flags)
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

end # module FMonitor
export FMonitor
