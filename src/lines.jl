module Lines

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Create new Line object"""
    function New(Name::String)::Int
        return Lib.Lines_New(Cstring(pointer(Name)))
    end

    """Names of all Line Objects"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.Lines_Get_AllNames)
    end

    """Name of bus for terminal 1. (Getter)"""
    function Bus1()::String
        return Utils.get_string(Lib.Lines_Get_Bus1())
    end

    """Name of bus for terminal 1. (Setter)"""
    function Bus1(Value::String)
        Lib.Lines_Set_Bus1(Cstring(pointer(Value)))
    end

    """Name of bus for terminal 2. (Getter)"""
    function Bus2()::String
        return Utils.get_string(Lib.Lines_Get_Bus2())
    end

    """Name of bus for terminal 2. (Setter)"""
    function Bus2(Value::String)
        Lib.Lines_Set_Bus2(Cstring(pointer(Value)))
    end

    """Zero Sequence capacitance, nanofarads per unit length. (Getter)"""
    function C0()::Float64
        return Lib.Lines_Get_C0()
    end

    """Zero Sequence capacitance, nanofarads per unit length. (Setter)"""
    function C0(Value::Float64)
        Lib.Lines_Set_C0(Value)
    end

    """Positive Sequence capacitance, nanofarads per unit length. (Getter)"""
    function C1()::Float64
        return Lib.Lines_Get_C1()
    end

    """Positive Sequence capacitance, nanofarads per unit length. (Setter)"""
    function C1(Value::Float64)
        Lib.Lines_Set_C1(Value)
    end

    """Capacitance matrix, nF per unit length (Getter)"""
    function CMatrix()::Matrix{Float64}
        n = Phases()
        if n == 0
            cmatrix = reshape(Float64[], (0, 0))
        else
            cmatrix = reshape(Utils.get_float64_array(Lib.Lines_Get_Cmatrix), (n, n))
        end
        return cmatrix
    end

    """Capacitance matrix, nF per unit length (Setter)"""
    function CMatrix(Value::Matrix{Float64})
        n = Phases()
        CMatrix(Value[:])
    end

    """Capacitance matrix, nF per unit length (Setter)"""
    function CMatrix(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Lines_Set_Cmatrix(ValuePtr, ValueCount)
    end

    """Number of Line objects in Active Circuit."""
    function Count()::Int
        return Lib.Lines_Get_Count()
    end

    """Emergency (maximum) ampere rating of Line. (Getter)"""
    function EmergAmps()::Float64
        return Lib.Lines_Get_EmergAmps()
    end

    """Emergency (maximum) ampere rating of Line. (Setter)"""
    function EmergAmps(Value::Float64)
        Lib.Lines_Set_EmergAmps(Value)
    end

    """Invoking this property sets the first element active.  Returns 0 if no lines.  Otherwise, index of the line element."""
    function First()::Int
        return Lib.Lines_Get_First()
    end

    """Line geometry code (Getter)"""
    function Geometry()::String
        return Utils.get_string(Lib.Lines_Get_Geometry())
    end

    """Line geometry code (Setter)"""
    function Geometry(Value::String)
        Lib.Lines_Set_Geometry(Cstring(pointer(Value)))
    end

    """Length of line section in units compatible with the LineCode definition. (Getter)"""
    function Length()::Float64
        return Lib.Lines_Get_Length()
    end

    """Length of line section in units compatible with the LineCode definition. (Setter)"""
    function Length(Value::Float64)
        Lib.Lines_Set_Length(Value)
    end

    """Name of LineCode object that defines the impedances. (Getter)"""
    function LineCode()::String
        return Utils.get_string(Lib.Lines_Get_LineCode())
    end

    """Name of LineCode object that defines the impedances. (Setter)"""
    function LineCode(Value::String)
        Lib.Lines_Set_LineCode(Cstring(pointer(Value)))
    end

    """Specify the name of the Line element to set it active. (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.Lines_Get_Name())
    end

    """Specify the name of the Line element to set it active. (Setter)"""
    function Name(Value::String)
        Lib.Lines_Set_Name(Cstring(pointer(Value)))
    end

    """Invoking this property advances to the next Line element active.  Returns 0 if no more lines.  Otherwise, index of the line element."""
    function Next()::Int
        return Lib.Lines_Get_Next()
    end

    """Normal ampere rating of Line. (Getter)"""
    function NormAmps()::Float64
        return Lib.Lines_Get_NormAmps()
    end

    """Normal ampere rating of Line. (Setter)"""
    function NormAmps(Value::Float64)
        Lib.Lines_Set_NormAmps(Value)
    end

    """Number of customers on this line section."""
    function NumCust()::Int
        return Lib.Lines_Get_NumCust()
    end

    """Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails."""
    function Parent()::Int
        return Lib.Lines_Get_Parent()
    end

    """Number of Phases, this Line element. (Getter)"""
    function Phases()::Int
        return Lib.Lines_Get_Phases()
    end

    """Number of Phases, this Line element. (Setter)"""
    function Phases(Value::Int)
        Lib.Lines_Set_Phases(Value)
    end

    """Zero Sequence resistance, ohms per unit length. (Getter)"""
    function R0()::Float64
        return Lib.Lines_Get_R0()
    end

    """Zero Sequence resistance, ohms per unit length. (Setter)"""
    function R0(Value::Float64)
        Lib.Lines_Set_R0(Value)
    end

    """Positive Sequence resistance, ohms per unit length. (Getter)"""
    function R1()::Float64
        return Lib.Lines_Get_R1()
    end

    """Positive Sequence resistance, ohms per unit length. (Setter)"""
    function R1(Value::Float64)
        Lib.Lines_Set_R1(Value)
    end

    """Earth return resistance value used to compute line impedances at power frequency (Getter)"""
    function Rg()::Float64
        return Lib.Lines_Get_Rg()
    end

    """Earth return resistance value used to compute line impedances at power frequency (Setter)"""
    function Rg(Value::Float64)
        Lib.Lines_Set_Rg(Value)
    end

    """Earth Resistivity, ohm-m (Getter)"""
    function Rho()::Float64
        return Lib.Lines_Get_Rho()
    end

    """Earth Resistivity, ohm-m (Setter)"""
    function Rho(Value::Float64)
        Lib.Lines_Set_Rho(Value)
    end

    """Resistance matrix (full), ohms per unit length. Matrix of doubles. (Getter)"""
    function RMatrix()::Matrix{Float64}
        n = Phases()
        if n == 0
            rmatrix = reshape(Float64[], (0, 0))
        else
            rmatrix = reshape(Utils.get_float64_array(Lib.Lines_Get_Rmatrix), (n, n))
        end
        return rmatrix
    end

    """Resistance matrix (full), ohms per unit length. Matrix of doubles. (Setter)"""
    function RMatrix(Value::Matrix{Float64})
        n = Phases()
        RMatrix(Value[:])
    end

    """Resistance matrix (full), ohms per unit length. Vector of doubles. (Setter)"""
    function RMatrix(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Lines_Set_Rmatrix(ValuePtr, ValueCount)
    end

    """Line spacing code (Getter)"""
    function Spacing()::String
        return Utils.get_string(Lib.Lines_Get_Spacing())
    end

    """Line spacing code (Getter)"""
    function Spacing(Value::String)
        Lib.Lines_Set_Spacing(Cstring(pointer(Value)))
    end

    """Total Number of customers served from this line section."""
    function TotalCust()::Int
        return Lib.Lines_Get_TotalCust()
    end

    """Units for Line (Getter)"""
    function Units()::Lib.LineUnits
        return Lib.Lines_Get_Units()
    end

    """Units for Line (Setter)"""
    function Units(Value::Union{Int, Lib.LineUnits})
        Value = convert(Lib.LineUnits, Value)
        Lib.Lines_Set_Units(Value)
    end

    """Zero Sequence reactance ohms per unit length. (Getter)"""
    function X0()::Float64
        return Lib.Lines_Get_X0()
    end

    """Zero Sequence reactance ohms per unit length. (Setter)"""
    function X0(Value::Float64)
        Lib.Lines_Set_X0(Value)
    end

    """Positive Sequence reactance, ohms per unit length. (Getter)"""
    function X1()::Float64
        return Lib.Lines_Get_X1()
    end

    """Positive Sequence reactance, ohms per unit length. (Setter)"""
    function X1(Value::Float64)
        Lib.Lines_Set_X1(Value)
    end

    """Earth return reactance value used to compute line impedances at power frequency (Getter)"""
    function Xg()::Float64
        return Lib.Lines_Get_Xg()
    end

    """Earth return reactance value used to compute line impedances at power frequency (Setter)"""
    function Xg(Value::Float64)
        Lib.Lines_Set_Xg(Value)
    end

    """Susceptance matrix, ohms per unit length. Matrix of doubles. (Getter)"""
    function XMatrix()::Matrix{Float64}
        n = Phases()
        if n == 0
            xmatrix = reshape(Float64[], (0, 0))
        else
            xmatrix = reshape(Utils.get_float64_array(Lib.Lines_Get_Xmatrix), (n, n))
        end
        return xmatrix
    end

    """Susceptance matrix, ohms per unit length. Matrix of doubles. (Setter)"""
    function XMatrix(Value::Matrix{Float64})
        n = Phases()
        XMatrix(Value[:])
    end

    """Susceptance matrix, ohms per unit length. Vector of doubles. (Setter)"""
    function XMatrix(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Lines_Set_Xmatrix(ValuePtr, ValueCount)
    end

    """Yprimitive: Does Nothing at present on Put; Dangerous (Getter)"""
    function Yprim()::Matrix{ComplexF64}
        r = Utils.get_complex64_array(Lib.Lines_Get_Yprim)
        return reshape(r, (Int(length(r)/2), Int(length(r)/2)))
    end

    """Yprimitive: Does Nothing at present on Put; Dangerous (Setter)"""
    function Yprim(Value::Matrix{ComplexF64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Lines_Set_Yprim(ValuePtr, ValueCount)
    end

    """Impedance matrix, ohms per unit length. Matrix of doubles. (Getter)"""
    function ZMatrix()::Matrix{ComplexF64}
        zmatrix = RMatrix() + im * XMatrix()
        return zmatrix
    end

    """Impedance matrix, ohms per unit length. Matrix of doubles. (Setter)"""
    function ZMatrix(Value::Matrix{ComplexF64})
        r = real(Value)
        i = imag(Value)
        RMatrix(r)
        XMatrix(i)
    end

end

