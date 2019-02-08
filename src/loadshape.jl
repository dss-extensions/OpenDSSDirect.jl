
module LoadShape

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Create new Load Shape"""
    function New(Name)::Int
        return Lib.LoadShapes_New(Cstring(pointer(Name)))
    end

    """Normalize Load Shape"""
    function Normalize()
        Lib.LoadShapes_Normalize()
    end

    """Array of strings containing names of all Loadshape objects currently defined."""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.LoadShapes_Get_AllNames)
    end

    """Number of Loadshape objects currently defined in Loadshape collection"""
    function Count()::Int
        return Lib.LoadShapes_Get_Count()
    end

    """Set the first loadshape active and return integer index of the loadshape. Returns 0 if none."""
    function First()::Int
        return Lib.LoadShapes_Get_First()
    end

    """Fixed interval time value, hours."""
    function HrInterval()::Float64
        return Lib.LoadShapes_Get_HrInterval()
    end

    """Fixed interval time value, hours."""
    function HrInterval(Value::Float64)
        Lib.LoadShapes_Set_HrInterval(Value)
    end

    """Fixed Interval time value, in minutes"""
    function MinInterval()::Float64
        return Lib.LoadShapes_Get_MinInterval()
    end

    """Fixed Interval time value, in minutes"""
    function MinInterval(Value::Float64)
        Lib.LoadShapes_Set_MinInterval(Value)
    end

    """Name of the active Loadshape (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.LoadShapes_Get_Name())
    end

    """Name of the active Loadshape (Setter)"""
    function Name(Value::String)
        Lib.LoadShapes_Set_Name(Cstring(pointer(Value)))
    end

    """Advance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes."""
    function Next()::Int
        return Lib.LoadShapes_Get_Next()
    end

    """Number of points in active Loadshape. (Getter)"""
    function Npts()::Int
        return Lib.LoadShapes_Get_Npts()
    end

    """Number of points in active Loadshape. (Setter)"""
    function Npts(Value::Int)
        Lib.LoadShapes_Set_Npts(Value)
    end

    """Base for normalizing P curve (Getter)"""
    function PBase()::Float64
        return Lib.LoadShapes_Get_PBase()
    end

    """Base for normalizing P curve (Setter)"""
    function PBase(Value::Float64)
        Lib.LoadShapes_Set_PBase(Value)
    end

    """Array of Doubles for the P multiplier in the Loadshape. (Getter)"""
    function PMult()::Vector{Float64}
        return Utils.get_float64_array(Lib.LoadShapes_Get_Pmult)
    end

    """Array of Doubles for the P multiplier in the Loadshape. (Setter)"""
    function PMult(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.LoadShapes_Set_Pmult(ValuePtr, ValueCount)
    end

    """Base for normalizing Q curve. If left at zero, the peak value is used. (Getter)"""
    function QBase()::Float64
        return Lib.LoadShapes_Get_Qbase()
    end

    """Base for normalizing Q curve. If left at zero, the peak value is used. (Setter)"""
    function QBase(Value::Float64)
        Lib.LoadShapes_Set_Qbase(Value)
    end

    """Array of doubles containing the Q multipliers. (Getter)"""
    function QMult()::Vector{Float64}
        return Utils.get_float64_array(Lib.LoadShapes_Get_Qmult)
    end

    """Array of doubles containing the Q multipliers. (Setter)"""
    function QMult(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.LoadShapes_Set_Qmult(ValuePtr, ValueCount)
    end

    """Time array in hours correscponding to P and Q multipliers when the Interval=0. (Getter)"""
    function TimeArray()::Vector{Float64}
        return Utils.get_float64_array(Lib.LoadShapes_Get_TimeArray)
    end

    """Time array in hours correscponding to P and Q multipliers when the Interval=0. (Setter)"""
    function TimeArray(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.LoadShapes_Set_TimeArray(ValuePtr, ValueCount)
    end

    """T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Getter)"""
    function UseActual()::Bool
        return Lib.LoadShapes_Get_UseActual() != 0
    end

    """T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Setter)"""
    function UseActual(Value::Bool)
        Lib.LoadShapes_Set_UseActual(Value ? 1 : 0)
    end

    """Interval of active loadshape in seconds (Getter)"""
    function SInterval()::Float64
        return Lib.LoadShapes_Get_sInterval()
    end

    """Interval of active loadshape in seconds (Setter)"""
    function SInterval(Value::Float64)
        Lib.LoadShapes_Set_Sinterval(Value)
    end


end

