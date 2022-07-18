module CtrlQueue

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Clear actions for Control Queue"""
function ClearActions()
    @checked Lib.CtrlQueue_ClearActions()
end

"""Clear queue for Control Queue"""
function ClearQueue()
    @checked Lib.CtrlQueue_ClearQueue()
end

"""Delete action handle for Control Queue"""
function Delete(ActionHandle::Int)
    @checked Lib.CtrlQueue_Delete(ActionHandle)
end

"""Do all actions"""
function DoAllQueue()
    @checked Lib.CtrlQueue_DoAllQueue()
end

"""Show queue"""
function Show()
    @checked Lib.CtrlQueue_Show()
end

"""Code for the active action. Long integer code to tell the control device what to do"""
function ActionCode()::Lib.ActionCodes
    return @checked Lib.CtrlQueue_Get_ActionCode()
end

"""Handle (User defined) to device that must act on the pending action."""
function DeviceHandle()::Int
    return @checked Lib.CtrlQueue_Get_DeviceHandle()
end

"""Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)"""
function NumActions()::Int
    return @checked Lib.CtrlQueue_Get_NumActions()
end

"""Pops next action off the action list and makes it the active action. Returns zero if none."""
function PopAction()::Int
    return @checked Lib.CtrlQueue_Get_PopAction()
end

"""Array of strings containing the entire queue in CSV format"""
function Queue()::Vector{String}
    return get_string_array(Lib.CtrlQueue_Get_Queue)
end

"""Number of items on the OpenDSS control Queue"""
function QueueSize()::Int
    return @checked Lib.CtrlQueue_Get_QueueSize()
end

"""(write-only) Set the active action by index"""
function Action(Param1::Int)
    @checked Lib.CtrlQueue_Set_Action(Param1)
end

"""Push a control action onto the DSS control queue by time, action code, and device handle (user defined). Returns Control Queue handle."""
function Push(Hour::Int32, Seconds::Float64, ActionCode::Union{Int32,Lib.ActionCodes}, DeviceHandle::Int32)::Int
    return @checked Lib.CtrlQueue_Push(Hour, Seconds, ActionCode, DeviceHandle);
end

end
