module CtrlQueue

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Clear actions for Control Queue"""
function ClearActions(dss::DSSContext)
    @checked Lib.CtrlQueue_ClearActions(dss.ctx)
end
ClearActions() = ClearActions(DSS_DEFAULT_CTX)

"""Clear queue for Control Queue"""
function ClearQueue(dss::DSSContext)
    @checked Lib.CtrlQueue_ClearQueue(dss.ctx)
end
ClearQueue() = ClearQueue(DSS_DEFAULT_CTX)

"""Delete action handle for Control Queue"""
function Delete(dss::DSSContext, ActionHandle::Int)
    @checked Lib.CtrlQueue_Delete(dss.ctx, ActionHandle)
end
Delete(ActionHandle::Int) = Delete(DSS_DEFAULT_CTX, ActionHandle)

"""Do all actions"""
function DoAllQueue(dss::DSSContext)
    @checked Lib.CtrlQueue_DoAllQueue(dss.ctx)
end
DoAllQueue() = DoAllQueue(DSS_DEFAULT_CTX)

"""Show queue"""
function Show(dss::DSSContext)
    @checked Lib.CtrlQueue_Show(dss.ctx)
end
Show() = Show(DSS_DEFAULT_CTX)

"""Code for the active action. Long integer code to tell the control device what to do"""
function ActionCode(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.CtrlQueue_Get_ActionCode(dss.ctx)
end
ActionCode() = ActionCode(DSS_DEFAULT_CTX)

"""Handle (User defined) to device that must act on the pending action."""
function DeviceHandle(dss::DSSContext)::Int
    return @checked Lib.CtrlQueue_Get_DeviceHandle(dss.ctx)
end
DeviceHandle() = DeviceHandle(DSS_DEFAULT_CTX)

"""Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)"""
function NumActions(dss::DSSContext)::Int
    return @checked Lib.CtrlQueue_Get_NumActions(dss.ctx)
end
NumActions() = NumActions(DSS_DEFAULT_CTX)

"""Pops next action off the action list and makes it the active action. Returns zero if none."""
function PopAction(dss::DSSContext)::Int
    return @checked Lib.CtrlQueue_Get_PopAction(dss.ctx)
end
PopAction() = PopAction(DSS_DEFAULT_CTX)

"""Array of strings containing the entire queue in CSV format"""
function Queue(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.CtrlQueue_Get_Queue, dss.ctx)
end
Queue() = Queue(DSS_DEFAULT_CTX)

"""Number of items on the OpenDSS control Queue"""
function QueueSize(dss::DSSContext)::Int
    return @checked Lib.CtrlQueue_Get_QueueSize(dss.ctx)
end
QueueSize() = QueueSize(DSS_DEFAULT_CTX)

"""(write-only) Set the active action by index"""
function Action(dss::DSSContext, Param1::Int)
    @checked Lib.CtrlQueue_Set_Action(dss.ctx, Param1)
end
Action(Param1::Int) = Action(DSS_DEFAULT_CTX, Param1)

"""Push a control action onto the DSS control queue by time, action code, and device handle (user defined). Returns Control Queue handle."""
function Push(dss::DSSContext, Hour::Int32, Seconds::Float64, ActionCode::Union{Int32,Lib.ActionCodes}, DeviceHandle::Int32)::Int
    return @checked Lib.CtrlQueue_Push(dss.ctx, Hour, Seconds, ActionCode, DeviceHandle);
end
Push(Hour::Int32, Seconds::Float64, ActionCode::Union{Int32,Lib.ActionCodes}, DeviceHandle::Int32) = Push(DSS_DEFAULT_CTX, Hour, Seconds, ActionCode, DeviceHandle)

end
