module SwtControls

    using ..lib
    using ..utils

    function Reset()
        lib.SwtControls_Reset()
    end

    """Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state)."""
    function Action()
        return lib.SwtControls_Get_Action()
    end

    """Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state)."""
    function Action(Value)
        lib.SwtControls_Set_Action(Value)
    end

    """(read-only) Array of strings with all SwtControl names in the active circuit."""
    function AllNames()
        return get_string_array(lib.SwtControls_Get_AllNames)
    end

    function Count()
        return lib.SwtControls_Get_Count()
    end

    """Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch."""
    function Delay()
        return lib.SwtControls_Get_Delay()
    end

    """Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch."""
    function Delay(Value)
        lib.SwtControls_Set_Delay(Value)
    end

    """(read-only) Sets the first SwtControl active. Returns 0 if no more."""
    function First()
        return lib.SwtControls_Get_First()
    end

    """The lock prevents both manual and automatic switch operation."""
    function IsLocked()
        return lib.SwtControls_Get_IsLocked() != 0
    end

    """The lock prevents both manual and automatic switch operation."""
    function IsLocked(Value)
        lib.SwtControls_Set_IsLocked(Value)
    end

    """Sets a SwtControl active by Name."""
    function Name()
        return get_string(lib.SwtControls_Get_Name())
    end

    """Sets a SwtControl active by Name."""
    function Name(Value::String)
        lib.SwtControls_Set_Name(Value)
    end

    """(read-only) Sets the next SwtControl active. Returns 0 if no more."""
    function Next()
        return lib.SwtControls_Get_Next()
    end

    """
    (read) Get Normal state of switch
    (write) set Normal state of switch  (see actioncodes) dssActionOpen or dssActionClose
    """
    function NormalState()
        return lib.SwtControls_Get_NormalState()
    end

    """
    (read) Get Normal state of switch
    (write) set Normal state of switch  (see actioncodes) dssActionOpen or dssActionClose
    """
    function NormalState(Value)
        lib.SwtControls_Set_NormalState(Value)
    end

    """
    (read) Force switch to specified state
    (write) Get Present state of switch
    """
    function State()
        return lib.SwtControls_Get_State()
    end

    """
    (read) Force switch to specified state
    (write) Get Present state of switch
    """
    function State(Value)
        lib.SwtControls_Set_State(Value)
    end

    """Full name of the switched element."""
    function SwitchedObj()
        return get_string(lib.SwtControls_Get_SwitchedObj())
    end

    """Full name of the switched element."""
    function SwitchedObj(Value::String)
        lib.SwtControls_Set_SwitchedObj(Value)
    end

    """Terminal number where the switch is located on the SwitchedObj"""
    function SwitchedTerm()
        return lib.SwtControls_Get_SwitchedTerm()
    end

    """Terminal number where the switch is located on the SwitchedObj"""
    function SwitchedTerm(Value)
        lib.SwtControls_Set_SwitchedTerm(Value)

    end

end

