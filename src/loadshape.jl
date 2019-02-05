
module LoadShape

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    function New(Name)
        return Lib.LoadShapes_New(Cstring(pointer(Name)))
    end

    function Normalize()
        Lib.LoadShapes_Normalize()
    end

    """(read-only) Array of strings containing names of all Loadshape objects currently defined."""
    function AllNames()
        return Utils.get_string_array(Lib.LoadShapes_Get_AllNames)
    end

    """(read-only) Number of Loadshape objects currently defined in Loadshape collection"""
    function Count()
        return Lib.LoadShapes_Get_Count()
    end

    """(read-only) Set the first loadshape active and return integer index of the loadshape. Returns 0 if none."""
    function First()
        return Lib.LoadShapes_Get_First()
    end

    """Fixed interval time value, hours."""
    function HrInterval()
        return Lib.LoadShapes_Get_HrInterval()
    end

    """Fixed interval time value, hours."""
    function HrInterval(Value)
        Lib.LoadShapes_Set_HrInterval(Value)
    end

    """Fixed Interval time value, in minutes"""
    function MinInterval()
        return Lib.LoadShapes_Get_MinInterval()
    end

    """Fixed Interval time value, in minutes"""
    function MinInterval(Value)
        Lib.LoadShapes_Set_MinInterval(Value)
    end

    """
    (read) Get the Name of the active Loadshape
    (write) Set the active Loadshape by name
    """
    function Name()
        return Utils.get_string(Lib.LoadShapes_Get_Name())
    end

    """
    (read) Get the Name of the active Loadshape
    (write) Set the active Loadshape by name
    """
    function Name(Value)
        Lib.LoadShapes_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Advance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes."""
    function Next()
        return Lib.LoadShapes_Get_Next()
    end

    """
    (read) Get Number of points in active Loadshape.
    (write) Set number of points to allocate for active Loadshape.
    """
    function Npts()
        return Lib.LoadShapes_Get_Npts()
    end

    """
    (read) Get Number of points in active Loadshape.
    (write) Set number of points to allocate for active Loadshape.
    """
    function Npts(Value)
        Lib.LoadShapes_Set_Npts(Value)
    end

    function PBase()
        return Lib.LoadShapes_Get_PBase()
    end

    function PBase(Value)
        Lib.LoadShapes_Set_PBase(Value)
    end

    """
    (read) Array of Doubles for the P multiplier in the Loadshape.
    (write) Array of doubles containing the P array for the Loadshape.
    """
    function PMult()
        return Utils.get_float64_array(Lib.LoadShapes_Get_Pmult)
    end

    """
    (read) Array of Doubles for the P multiplier in the Loadshape.
    (write) Array of doubles containing the P array for the Loadshape.
    """
    function PMult(Value)
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.LoadShapes_Set_Pmult(ValuePtr, ValueCount)
    end

    """Base for normalizing Q curve. If left at zero, the peak value is used."""
    function QBase()
        return Lib.LoadShapes_Get_Qbase()
    end

    """Base for normalizing Q curve. If left at zero, the peak value is used."""
    function QBase(Value)
        Lib.LoadShapes_Set_Qbase(Value)
    end

    """Array of doubles containing the Q multipliers."""
    function QMult()
        return Utils.get_float64_array(Lib.LoadShapes_Get_Qmult)
    end

    """Array of doubles containing the Q multipliers."""
    function QMult(Value)
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.LoadShapes_Set_Qmult(ValuePtr, ValueCount)
    end

    """Time array in hours correscponding to P and Q multipliers when the Interval=0."""
    function TimeArray()
        return Utils.get_float64_array(Lib.LoadShapes_Get_TimeArray)
    end

    """Time array in hours correscponding to P and Q multipliers when the Interval=0."""
    function TimeArray(Value)
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.LoadShapes_Set_TimeArray(ValuePtr, ValueCount)
    end

    """T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier."""
    function UseActual()
        return Lib.LoadShapes_Get_UseActual() != 0
    end

    """T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier."""
    function UseActual(Value)
        Lib.LoadShapes_Set_UseActual(Value)
    end

    function SInterval()
        return Lib.LoadShapes_Get_sInterval()
    end

    function SInterval(Value)
        Lib.LoadShapes_Set_Sinterval(Value)
    end


end

