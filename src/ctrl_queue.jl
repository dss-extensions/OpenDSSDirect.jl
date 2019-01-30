module CtrlQueue

    using ..lib
    using ..utils

    function ClearActions()
        lib.CtrlQueue_ClearActions()
    end

    function ClearQueue()
        lib.CtrlQueue_ClearQueue()
    end

    function Delete(ActionHandle)::Int
        lib.CtrlQueue_Delete(ActionHandle)
    end

    function DoAllQueue()
        lib.CtrlQueue_DoAllQueue()
    end

    function Show()
        lib.CtrlQueue_Show()
    end

    """(read-only) Code for the active action. Long integer code to tell the control device what to do"""
    function ActionCode()::Int
        # TODO: return enum?
        return lib.CtrlQueue_Get_ActionCode()
    end

    """(read-only) Handle (User defined) to device that must act on the pending action."""
    function DeviceHandle()::Int
        return lib.CtrlQueue_Get_DeviceHandle()
    end

    """(read-only) Number of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)"""
    function NumActions()::Int
        return lib.CtrlQueue_Get_NumActions()
    end

    """(read-only) Pops next action off the action list and makes it the active action. Returns zero if none."""
    function PopAction()::Int
        return lib.CtrlQueue_Get_PopAction()
    end

    """(read-only) Array of strings containing the entire queue in CSV format"""
    function Queue()::Vector{String}
        return get_string_array(lib.CtrlQueue_Get_Queue)
    end

    """(read-only) Number of items on the OpenDSS control Queue"""
    function QueueSize()::Int
        return lib.CtrlQueue_Get_QueueSize()
    end

    """(write-only) Set the active action by index"""
    function Action(Param1::Int)
        lib.CtrlQueue_Set_Action(Param1)
    end

end

