
module XYCurves

    using ..lib
    using ..utils

    """(read-only) Number of XYCurve Objects"""
    function Count()
        return lib.XYCurves_Get_Count()
    end

    """(read-only) Sets first XYcurve object active; returns 0 if none."""
    function First()
        return lib.XYCurves_Get_First()
    end

    """
    (read) Name of active XYCurve Object
    (write) Get Name of active XYCurve Object
    """
    function Name(*args)
        return get_string(lib.XYCurves_Get_Name())
    end

    """
    (read) Name of active XYCurve Object
    (write) Get Name of active XYCurve Object
    """
    function Name(Value::String)
        lib.XYCurves_Set_Name(Value)
    end

    """(read-only) Advances to next XYCurve object; returns 0 if no more objects of this class"""
    function Next()
        return lib.XYCurves_Get_Next()
    end

    """Get/Set Number of points in X-Y curve"""
    function Npts(*args)
        return lib.XYCurves_Get_Npts()
    end

    """Get/Set Number of points in X-Y curve"""
    function Npts(Value)
        lib.XYCurves_Set_Npts(Value)
    end

    """Get/Set X values as a Array of doubles. Set Npts to max number expected if setting"""
    function XArray(*args)
        return get_float64_array(lib.XYCurves_Get_Xarray)
    end

    """Get/Set X values as a Array of doubles. Set Npts to max number expected if setting"""
    function XArray(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.XYCurves_Set_Xarray(ValuePtr, ValueCount)
    end

    """Factor to scale X values from original curve"""
    function XScale(*args)
        return lib.XYCurves_Get_Xscale()
    end

    """Factor to scale X values from original curve"""
    function XScale(Value)
        lib.XYCurves_Set_Xscale(Value)
    end

    """Amount to shift X value from original curve"""
    function XShift(*args)
        return lib.XYCurves_Get_Xshift()
    end

    """Amount to shift X value from original curve"""
    function XShift(Value)
        lib.XYCurves_Set_Xshift(Value)
    end

    """Get/Set Y values in curve; Set Npts to max number expected if setting"""
    function YArray(*args)
        return get_float64_array(lib.XYCurves_Get_Yarray)
    end

    """Get/Set Y values in curve; Set Npts to max number expected if setting"""
    function YArray(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.XYCurves_Set_Yarray(ValuePtr, ValueCount)
    end

    """
    (read) Factor to scale Y values from original curve
    (write) Amount to scale Y values from original curve. Represents a curve shift.
    """
    function YScale(*args)
        return lib.XYCurves_Get_Yscale()
    end

    """
    (read) Factor to scale Y values from original curve
    (write) Amount to scale Y values from original curve. Represents a curve shift.
    """
    function YScale(Value)
        lib.XYCurves_Set_Yscale(Value)
    end

    """amount to shift Y valiue from original curve"""
    function YShift(*args)
        return lib.XYCurves_Get_Yshift()
    end

    """amount to shift Y valiue from original curve"""
    function YShift(Value)
        lib.XYCurves_Set_Yshift(Value)
    end

    """Set X value or get interpolated value after setting Y"""
    function X(*args)
        return lib.XYCurves_Get_x()
    end

    """Set X value or get interpolated value after setting Y"""
    function X(Value)
        lib.XYCurves_Set_x(Value)
    end

    """
    (read) Y value for present X or set this value then get corresponding X
    (write) Set Y value or get interpolated Y value after setting X
    """
    function Y(*args)
        return lib.XYCurves_Get_y()
    end

    """
    (read) Y value for present X or set this value then get corresponding X
    (write) Set Y value or get interpolated Y value after setting X
    """
    function Y(Value)
        lib.XYCurves_Set_y(Value)
    end

end

