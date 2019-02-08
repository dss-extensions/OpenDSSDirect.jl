module SwtControls

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Reset SWT controls"""
    function Reset()
        Lib.SwtControls_Reset()
    end

    """Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Getter)"""
    function Action()::Int
        return Lib.SwtControls_Get_Action()
    end

    """Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Setter)"""
    function Action(Value::Int)
        Lib.SwtControls_Set_Action(Value)
    end

    """Array of strings with all SwtControl names in the active circuit."""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.SwtControls_Get_AllNames)
    end

    function Count()::Int
        return Lib.SwtControls_Get_Count()
    end

    """Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Getter)"""
    function Delay()::Float64
        return Lib.SwtControls_Get_Delay()
    end

    """Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Setter)"""
    function Delay(Value::Float64)
        Lib.SwtControls_Set_Delay(Value)
    end

    """Sets the first SwtControl active. Returns 0 if no more."""
    function First()::Int
        return Lib.SwtControls_Get_First()
    end

    """The lock prevents both manual and automatic switch operation. (Getter)"""
    function IsLocked()::Bool
        return Lib.SwtControls_Get_IsLocked() != 0
    end

    """The lock prevents both manual and automatic switch operation. (Setter)"""
    function IsLocked(Value::Bool)
        Lib.SwtControls_Set_IsLocked(Value ? 1 : 0)
    end

    """Sets a SwtControl active by Name. (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.SwtControls_Get_Name())
    end

    """Sets a SwtControl active by Name. (Setter)"""
    function Name(Value::String)
        Lib.SwtControls_Set_Name(Value)
    end

    """Sets the next SwtControl active. Returns 0 if no more."""
    function Next()::Int
        return Lib.SwtControls_Get_Next()
    end

    """Normal state of switch (Getter)"""
    function NormalState()::Int
        return Lib.SwtControls_Get_NormalState()
    end

    """Normal state of switch (Setter)"""
    function NormalState(Value::Int)
        Lib.SwtControls_Set_NormalState(Value)
    end

    """State of switch (Getter)"""
    function State()::Int
        return Lib.SwtControls_Get_State()
    end

    """State of switch (Setter)"""
    function State(Value::Int)
        Lib.SwtControls_Set_State(Value)
    end

    """Full name of the switched element. (Getter)"""
    function SwitchedObj()::String
        return Utils.get_string(Lib.SwtControls_Get_SwitchedObj())
    end

    """Full name of the switched element. (Setter)"""
    function SwitchedObj(Value::String)
        Lib.SwtControls_Set_SwitchedObj(Value)
    end

    """Terminal number where the switch is located on the SwitchedObj (Getter)"""
    function SwitchedTerm()::Int
        return Lib.SwtControls_Get_SwitchedTerm()
    end

    """Terminal number where the switch is located on the SwitchedObj (Setter)"""
    function SwitchedTerm(Value::Int)
        Lib.SwtControls_Set_SwitchedTerm(Value)

    end

end

