module Lines

    using ..Lib
    using ..Utils

    function New(Name::String)
        return Lib.Lines_New(Cstring(pointer(Name)))
    end

    """(read-only) Names of all Line Objects"""
    function AllNames()::Vector{String}
        return get_string_array(Lib.Lines_Get_AllNames)
    end

    """Name of bus for terminal 1."""
    function Bus1()::String
        return get_string(Lib.Lines_Get_Bus1())
    end

    """Name of bus for terminal 1."""
    function Bus1(Value::String)
        Lib.Lines_Set_Bus1(Cstring(pointer(Value)))
    end

    """Name of bus for terminal 2."""
    function Bus2()::String
        return get_string(Lib.Lines_Get_Bus2())
    end

    """Name of bus for terminal 2."""
    function Bus2(Value::String)
        Lib.Lines_Set_Bus2(Cstring(pointer(Value)))
    end

    """Zero Sequence capacitance, nanofarads per unit length."""
    function C0()::Float64
        return Lib.Lines_Get_C0()
    end

    """Zero Sequence capacitance, nanofarads per unit length."""
    function C0(Value::Float64)
        Lib.Lines_Set_C0(Value)
    end

    """Positive Sequence capacitance, nanofarads per unit length."""
    function C1()::Float64
        return Lib.Lines_Get_C1()
    end

    """Positive Sequence capacitance, nanofarads per unit length."""
    function C1(Value::Float64)
        Lib.Lines_Set_C1(Value)
    end

    function CMatrix()::Vector{Float64}
        return get_float64_array(Lib.Lines_Get_Cmatrix)
    end

    function CMatrix(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Lines_Set_Cmatrix(ValuePtr, ValueCount)
    end

    """(read-only) Number of Line objects in Active Circuit."""
    function Count()::Int
        return Lib.Lines_Get_Count()
    end

    """Emergency (maximum) ampere rating of Line."""
    function EmergAmps()::Float64
        return Lib.Lines_Get_EmergAmps()
    end

    """Emergency (maximum) ampere rating of Line."""
    function EmergAmps(Value::Float64)
        Lib.Lines_Set_EmergAmps(Value)
    end

    """(read-only) Invoking this property sets the first element active.  Returns 0 if no lines.  Otherwise, index of the line element."""
    function First()::Int
        return Lib.Lines_Get_First()
    end

    """Line geometry code"""
    function Geometry()::String
        return get_string(Lib.Lines_Get_Geometry())
    end

    """Line geometry code"""
    function Geometry(Value::String)
        Lib.Lines_Set_Geometry(Cstring(pointer(Value)))
    end

    """Length of line section in units compatible with the LineCode definition."""
    function Length()::Float64
        return Lib.Lines_Get_Length()
    end

    """Length of line section in units compatible with the LineCode definition."""
    function Length(Value::Float64)
        Lib.Lines_Set_Length(Value)
    end

    """Name of LineCode object that defines the impedances."""
    function LineCode()::String
        return get_string(Lib.Lines_Get_LineCode())
    end

    """Name of LineCode object that defines the impedances."""
    function LineCode(Value::String)
        Lib.Lines_Set_LineCode(Cstring(pointer(Value)))
    end

    """Specify the name of the Line element to set it active."""
    function Name()::String
        return get_string(Lib.Lines_Get_Name())
    end

    """Specify the name of the Line element to set it active."""
    function Name(Value::String)
        Lib.Lines_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Invoking this property advances to the next Line element active.  Returns 0 if no more lines.  Otherwise, index of the line element."""
    function Next()::Int
        return Lib.Lines_Get_Next()
    end

    """Normal ampere rating of Line."""
    function NormAmps()::Float64
        return Lib.Lines_Get_NormAmps()
    end

    """Normal ampere rating of Line."""
    function NormAmps(Value::Float64)
        Lib.Lines_Set_NormAmps(Value)
    end

    """(read-only) Number of customers on this line section."""
    function NumCust()::Int
        return Lib.Lines_Get_NumCust()
    end

    """(read-only) Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails."""
    function Parent()::Int
        return Lib.Lines_Get_Parent()
    end

    """Number of Phases, this Line element."""
    function Phases()::Int
        return Lib.Lines_Get_Phases()
    end

    """Number of Phases, this Line element."""
    function Phases(Value::Int)
        Lib.Lines_Set_Phases(Value)
    end

    """Zero Sequence resistance, ohms per unit length."""
    function R0()::Float64
        return Lib.Lines_Get_R0()
    end

    """Zero Sequence resistance, ohms per unit length."""
    function R0(Value::Float64)
        Lib.Lines_Set_R0(Value)
    end

    """Positive Sequence resistance, ohms per unit length."""
    function R1()::Float64
        return Lib.Lines_Get_R1()
    end

    """Positive Sequence resistance, ohms per unit length."""
    function R1(Value::Float64)
        Lib.Lines_Set_R1(Value)
    end

    """Earth return resistance value used to compute line impedances at power frequency"""
    function Rg()::Float64
        return Lib.Lines_Get_Rg()
    end

    """Earth return resistance value used to compute line impedances at power frequency"""
    function Rg(Value::Float64)
        Lib.Lines_Set_Rg(Value)
    end

    """Earth Resistivity, m-ohms"""
    function Rho()::Float64
        return Lib.Lines_Get_Rho()
    end

    """Earth Resistivity, m-ohms"""
    function Rho(Value::Float64)
        Lib.Lines_Set_Rho(Value)
    end

    """Resistance matrix (full), ohms per unit length. Array of doubles."""
    function RMatrix()::Vector{Float64}
        return get_float64_array(Lib.Lines_Get_Rmatrix)
    end

    """Resistance matrix (full), ohms per unit length. Array of doubles."""
    function RMatrix(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Lines_Set_Rmatrix(ValuePtr, ValueCount)
    end

    """Line spacing code"""
    function Spacing()::String
        return get_string(Lib.Lines_Get_Spacing())
    end

    """Line spacing code"""
    function Spacing(Value::String)
        Lib.Lines_Set_Spacing(Cstring(pointer(Value)))
    end

    """(read-only) Total Number of customers served from this line section."""
    function TotalCust()::Int
        return Lib.Lines_Get_TotalCust()
    end

    function Units()::Int
        return Lib.Lines_Get_Units()
    end

    function Units(Value::Int)
        Lib.Lines_Set_Units(Value)
    end

    """Zero Sequence reactance ohms per unit length."""
    function X0()::Float64
        return Lib.Lines_Get_X0()
    end

    """Zero Sequence reactance ohms per unit length."""
    function X0(Value::Float64)
        Lib.Lines_Set_X0(Value)
    end

    """Positive Sequence reactance, ohms per unit length."""
    function X1()::Float64
        return Lib.Lines_Get_X1()
    end

    """Positive Sequence reactance, ohms per unit length."""
    function X1(Value::Float64)
        Lib.Lines_Set_X1(Value)
    end

    """Earth return reactance value used to compute line impedances at power frequency"""
    function Xg()::Float64
        return Lib.Lines_Get_Xg()
    end

    """Earth return reactance value used to compute line impedances at power frequency"""
    function Xg(Value::Float64)
        Lib.Lines_Set_Xg(Value)
    end

    function XMatrix()::Vector{Float64}
        return get_float64_array(Lib.Lines_Get_Xmatrix)
    end

    function XMatrix(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Lines_Set_Xmatrix(ValuePtr, ValueCount)
    end

    """Yprimitive: Does Nothing at present on Put; Dangerous"""
    function Yprim()::Array{ComplexF64, 2}
        r = get_complex64_array(Lib.Lines_Get_Yprim)
        return reshape(r, (Int(length(r)/2), Int(length(r)/2)))
    end

    """Yprimitive: Does Nothing at present on Put; Dangerous"""
    function Yprim(Value::Array{ComplexF64, 2})
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Lines_Set_Yprim(ValuePtr, ValueCount)
    end

end

