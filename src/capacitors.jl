module Capacitors

    using ..lib
    using ..utils

    function AddStep()::Bool
        return lib.Capacitors_AddStep() != 0
    end

    function Close()
        lib.Capacitors_Close()
    end

    function Open()
        lib.Capacitors_Open()
    end

    function SubtractStep()::Bool
        return lib.Capacitors_SubtractStep() != 0
    end

    """(read-only) Array of strings with all Capacitor names in the circuit."""
    function AllNames()
        # TODO: return
        return get_string_array(lib.Capacitors_Get_AllNames)
    end

    """(read-only) Number of Steps available in cap bank to be switched ON."""
    function AvailableSteps()::Int
        return lib.Capacitors_Get_AvailableSteps()
    end

    """(read-only) Number of Capacitor objects in active circuit."""
    function Count():Int
        return lib.Capacitors_Get_Count()
    end

    """(read-only) Sets the first Capacitor active. Returns 0 if no more."""
    function First()::Int
        return lib.Capacitors_Get_First()
    end

    """Delta connection or wye? (Getter)"""
    function IsDelta()
        return lib.Capacitors_Get_IsDelta() != 0
    end

    """Delta connection or wye? (Setter)"""
    function IsDelta(Value::Bool)
        lib.Capacitors_Set_IsDelta(Value ? 1 : 0)
    end

    """Sets the active Capacitor by Name. (Getter)"""
    function Name()::String
        return get_string(lib.Capacitors_Get_Name())
    end

    """Sets the active Capacitor by Name. (Setter)"""
    function Name(Value::String)
        lib.Capacitors_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets the next Capacitor active. Returns 0 if no more."""
    function Next()::Int
        return lib.Capacitors_Get_Next()
    end

    """Number of steps (default 1) for distributing and switching the total bank kVAR. (Getter)"""
    function NumSteps()::Int
        return lib.Capacitors_Get_NumSteps()
    end

    """Number of steps (default 1) for distributing and switching the total bank kVAR. (Setter)"""
    function NumSteps(Value::Int)
        lib.Capacitors_Set_NumSteps(Value)
    end

    """
    (read) A array of  integer [0..numsteps-1] indicating state of each step. If value is -1 an error has occurred.
    """
    function States()
        return get_int32_array(lib.Capacitors_Get_States)
    end

    """(write) Array of integer [0 ..numSteps-1] indicating the state of each step"""
    function States(Value)
        Value, ValuePtr, ValueCount = prepare_int32_array(Value)
        lib.Capacitors_Set_States(ValuePtr, ValueCount)
    end

    """Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Getter)"""
    function kV()::Float64
        # Getter
        return lib.Capacitors_Get_kV()
    end

    """Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Setter)"""
    function kV(Value::Float64)
        lib.Capacitors_Set_kV(Value)
    end

    """Total bank KVAR, distributed equally among phases and steps. (Getter)"""
    function kvar()::Float64
        return lib.Capacitors_Get_kvar()
    end

    """Total bank KVAR, distributed equally among phases and steps. (Setter)"""
    function kvar(Value::Float64)
        lib.Capacitors_Set_kvar(Value)
    end

end

