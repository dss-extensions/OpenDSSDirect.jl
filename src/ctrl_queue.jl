module CtrlQueue

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Clear all actions from the Control Proxy's Action List (they are popped off the list).

Original COM help: https://opendss.epri.com/ClearActions.html
"""
function ClearActions(dss::DSSContext)
    @checked dss_ccall(dss.capi.CtrlQueue_ClearActions, dss.ctx)
end
ClearActions() = ClearActions(DSS_DEFAULT_CTX)

"""
Clear the control queue.

Original COM help: https://opendss.epri.com/ClearQueue.html
"""
function ClearQueue(dss::DSSContext)
    @checked dss_ccall(dss.capi.CtrlQueue_ClearQueue, dss.ctx)
end
ClearQueue() = ClearQueue(DSS_DEFAULT_CTX)

"""
Delete an Action from the DSS Control Queue by the handle that is returned when the action is added.

(The Push function returns the handle.)

Original COM help: https://opendss.epri.com/Delete.html
"""
function Delete(dss::DSSContext, ActionHandle::Int)
    @checked dss_ccall(dss.capi.CtrlQueue_Delete, dss.ctx, ActionHandle)
end
Delete(ActionHandle::Int) = Delete(DSS_DEFAULT_CTX, ActionHandle)

"""
Execute all actions currently on the Control Queue.

Side effect: clears the queue.

Original COM help: https://opendss.epri.com/DoAllQueue.html
"""
function DoAllQueue(dss::DSSContext)
    @checked dss_ccall(dss.capi.CtrlQueue_DoAllQueue, dss.ctx)
end
DoAllQueue() = DoAllQueue(DSS_DEFAULT_CTX)

"""
Export the queue to a CSV table and show it.

Original COM help: https://opendss.epri.com/Show.html
"""
function Show(dss::DSSContext)
    @checked dss_ccall(dss.capi.CtrlQueue_Show, dss.ctx)
end
Show() = Show(DSS_DEFAULT_CTX)

"""
Code for the active action. Integer code to tell the control device what to do.

Use this to determine what the user-defined controls are supposed to do.
It can be any 32-bit integer of the user's choosing and is the same value that the control pushed onto the control queue earlier.

Original COM help: https://opendss.epri.com/ActionCode.html
"""
function ActionCode(dss::DSSContext)::Lib.ActionCodes
    return @checked dss_ccall(dss.capi.CtrlQueue_Get_ActionCode, dss.ctx)
end
ActionCode() = ActionCode(DSS_DEFAULT_CTX)

"""
Handle (User defined) to device that must act on the pending action.

The user-written code driving the interface may support more than one
control element as necessary to perform the simulation. This handle is
an index returned to the user program that lets the program know which
control is to perform the active action.

Original COM help: https://opendss.epri.com/DeviceHandle.html
"""
function DeviceHandle(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CtrlQueue_Get_DeviceHandle, dss.ctx)
end
DeviceHandle() = DeviceHandle(DSS_DEFAULT_CTX)

"""
Number of Actions on the current action list (that have been popped off the control queue by CheckControlActions)

Original COM help: https://opendss.epri.com/NumActions.html
"""
function NumActions(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CtrlQueue_Get_NumActions, dss.ctx)
end
NumActions() = NumActions(DSS_DEFAULT_CTX)

"""
Pops next action off the action list and makes it the active action. Returns zero if none.

Original COM help: https://opendss.epri.com/PopAction.html
"""
function PopAction(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CtrlQueue_Get_PopAction, dss.ctx)
end
PopAction() = PopAction(DSS_DEFAULT_CTX)

"""
Array of strings containing the entire queue in CSV format

Original COM help: https://opendss.epri.com/Queue.html
"""
function Queue(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.CtrlQueue_Get_Queue, dss)
end
Queue() = Queue(DSS_DEFAULT_CTX)

"""
Number of items on the OpenDSS control Queue

Original COM help: https://opendss.epri.com/QueueSize.html
"""
function QueueSize(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CtrlQueue_Get_QueueSize, dss.ctx)
end
QueueSize() = QueueSize(DSS_DEFAULT_CTX)

"""
(write-only) Set the active action by index

Original COM help: https://opendss.epri.com/Action.html
"""
function Action(dss::DSSContext, Param1::Int)
    @checked dss_ccall(dss.capi.CtrlQueue_Set_Action, dss.ctx, Param1)
end
Action(Param1::Int) = Action(DSS_DEFAULT_CTX, Param1)

"""
Push a control action onto the DSS control queue by time, action code, and device handle (user defined). Returns Control Queue handle.

Original COM help: https://opendss.epri.com/Push.html
"""
function Push(dss::DSSContext, Hour::Int32, Seconds::Float64, ActionCode::Union{Int32,Lib.ActionCodes}, DeviceHandle::Int32)::Int
    return @checked dss_ccall(dss.capi.CtrlQueue_Push, dss.ctx, Hour, Seconds, ActionCode, DeviceHandle);
end
Push(Hour::Int32, Seconds::Float64, ActionCode::Union{Int32,Lib.ActionCodes}, DeviceHandle::Int32) = Push(DSS_DEFAULT_CTX, Hour, Seconds, ActionCode, DeviceHandle)

end
