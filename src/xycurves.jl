
module XYCurves

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """(read-only) Number of XYCurve Objects"""
    function Count()::Int
        return Lib.XYCurves_Get_Count()
    end

    """(read-only) Sets first XYcurve object active; returns 0 if none."""
    function First()::Int
        return Lib.XYCurves_Get_First()
    end

    """
    (read) Name of active XYCurve Object
    (write) Get Name of active XYCurve Object
    """
    function Name()::String
        return Utils.get_string(Lib.XYCurves_Get_Name())
    end

    """
    (read) Name of active XYCurve Object
    (write) Get Name of active XYCurve Object
    """
    function Name(Value::String)
        Lib.XYCurves_Set_Name(Value)
    end

    """(read-only) Advances to next XYCurve object; returns 0 if no more objects of this class"""
    function Next()::Int
        return Lib.XYCurves_Get_Next()
    end

    """Get/Set Number of points in X-Y curve"""
    function Npts()::Int
        return Lib.XYCurves_Get_Npts()
    end

    """Get/Set Number of points in X-Y curve"""
    function Npts(Value::Int)
        Lib.XYCurves_Set_Npts(Value)
    end

    """Get/Set X values as a Array of doubles. Set Npts to max number expected if setting"""
    function XArray()::Vector{Float64}
        return Utils.get_float64_array(Lib.XYCurves_Get_Xarray)
    end

    """Get/Set X values as a Array of doubles. Set Npts to max number expected if setting"""
    function XArray(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.XYCurves_Set_Xarray(ValuePtr, ValueCount)
    end

    """Factor to scale X values from original curve"""
    function XScale()::Float64
        return Lib.XYCurves_Get_Xscale()
    end

    """Factor to scale X values from original curve"""
    function XScale(Value::Float64)
        Lib.XYCurves_Set_Xscale(Value)
    end

    """Amount to shift X value from original curve"""
    function XShift()::Float64
        return Lib.XYCurves_Get_Xshift()
    end

    """Amount to shift X value from original curve"""
    function XShift(Value::Float64)
        Lib.XYCurves_Set_Xshift(Value)
    end

    """Get/Set Y values in curve; Set Npts to max number expected if setting"""
    function YArray()::Vector{Float64}
        return Utils.get_float64_array(Lib.XYCurves_Get_Yarray)
    end

    """Get/Set Y values in curve; Set Npts to max number expected if setting"""
    function YArray(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.XYCurves_Set_Yarray(ValuePtr, ValueCount)
    end

    """
    (read) Factor to scale Y values from original curve
    (write) Amount to scale Y values from original curve. Represents a curve shift.
    """
    function YScale()::Float64
        return Lib.XYCurves_Get_Yscale()
    end

    """
    (read) Factor to scale Y values from original curve
    (write) Amount to scale Y values from original curve. Represents a curve shift.
    """
    function YScale(Value::Float64)
        Lib.XYCurves_Set_Yscale(Value)
    end

    """amount to shift Y valiue from original curve"""
    function YShift()::Float64
        return Lib.XYCurves_Get_Yshift()
    end

    """amount to shift Y valiue from original curve"""
    function YShift(Value::Float64)
        Lib.XYCurves_Set_Yshift(Value)
    end

    """Set X value or get interpolated value after setting Y"""
    function X()::Float64
        return Lib.XYCurves_Get_x()
    end

    """Set X value or get interpolated value after setting Y"""
    function X(Value::Float64)
        Lib.XYCurves_Set_x(Value)
    end

    """
    (read) Y value for present X or set this value then get corresponding X
    (write) Set Y value or get interpolated Y value after setting X
    """
    function Y()::Float64
        return Lib.XYCurves_Get_y()
    end

    """
    (read) Y value for present X or set this value then get corresponding X
    (write) Set Y value or get interpolated Y value after setting X
    """
    function Y(Value::Float64)
        Lib.XYCurves_Set_y(Value)
    end

end

