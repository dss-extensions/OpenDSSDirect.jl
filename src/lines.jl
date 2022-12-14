module Lines

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Create new Line object"""
function New(Name::String)::Int
    return @checked Lib.Lines_New(C_NULL_CTX, Cstring(pointer(Name)))
end

"""Names of all Line Objects"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Lines_Get_AllNames, C_NULL_CTX)
end

"""Name of bus for terminal 1. (Getter)"""
function Bus1()::String
    return get_string(@checked Lib.Lines_Get_Bus1(C_NULL_CTX))
end

"""Name of bus for terminal 1. (Setter)"""
function Bus1(Value::String)
    @checked Lib.Lines_Set_Bus1(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Name of bus for terminal 2. (Getter)"""
function Bus2()::String
    return get_string(@checked Lib.Lines_Get_Bus2(C_NULL_CTX))
end

"""Name of bus for terminal 2. (Setter)"""
function Bus2(Value::String)
    @checked Lib.Lines_Set_Bus2(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Zero Sequence capacitance, nanofarads per unit length. (Getter)"""
function C0()::Float64
    return @checked Lib.Lines_Get_C0(C_NULL_CTX)
end

"""Zero Sequence capacitance, nanofarads per unit length. (Setter)"""
function C0(Value::Float64)
    @checked Lib.Lines_Set_C0(C_NULL_CTX, Value)
end

"""Positive Sequence capacitance, nanofarads per unit length. (Getter)"""
function C1()::Float64
    return @checked Lib.Lines_Get_C1(C_NULL_CTX)
end

"""Positive Sequence capacitance, nanofarads per unit length. (Setter)"""
function C1(Value::Float64)
    @checked Lib.Lines_Set_C1(C_NULL_CTX, Value)
end

"""Capacitance matrix, nF per unit length (Getter)"""
function CMatrix()::Matrix{Float64}
    n = Phases()
    if n == 0
        cmatrix = reshape(Float64[], (0, 0))
    else
        cmatrix = reshape(get_float64_array(Lib.Lines_Get_Cmatrix, C_NULL_CTX), (n, n))
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
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Cmatrix(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Number of Line objects in Active Circuit."""
function Count()::Int
    return @checked Lib.Lines_Get_Count(C_NULL_CTX)
end

"""Emergency (maximum) ampere rating of Line. (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.Lines_Get_EmergAmps(C_NULL_CTX)
end

"""Emergency (maximum) ampere rating of Line. (Setter)"""
function EmergAmps(Value::Float64)
    @checked Lib.Lines_Set_EmergAmps(C_NULL_CTX, Value)
end

"""Invoking this property sets the first element active.  Returns 0 if no lines.  Otherwise, index of the line element."""
function First()::Int
    return @checked Lib.Lines_Get_First(C_NULL_CTX)
end

"""Line geometry code (Getter)"""
function Geometry()::String
    return get_string(@checked Lib.Lines_Get_Geometry(C_NULL_CTX))
end

"""Line geometry code (Setter)"""
function Geometry(Value::String)
    @checked Lib.Lines_Set_Geometry(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Length of line section in units compatible with the LineCode definition. (Getter)"""
function Length()::Float64
    return @checked Lib.Lines_Get_Length(C_NULL_CTX)
end

"""Length of line section in units compatible with the LineCode definition. (Setter)"""
function Length(Value::Float64)
    @checked Lib.Lines_Set_Length(C_NULL_CTX, Value)
end

"""Name of LineCode object that defines the impedances. (Getter)"""
function LineCode()::String
    return get_string(@checked Lib.Lines_Get_LineCode(C_NULL_CTX))
end

"""Name of LineCode object that defines the impedances. (Setter)"""
function LineCode(Value::String)
    @checked Lib.Lines_Set_LineCode(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Specify the name of the Line element to set it active. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Lines_Get_Name(C_NULL_CTX))
end

"""Specify the name of the Line element to set it active. (Setter)"""
function Name(Value::String)
    @checked Lib.Lines_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Invoking this property advances to the next Line element active.  Returns 0 if no more lines.  Otherwise, index of the line element."""
function Next()::Int
    return @checked Lib.Lines_Get_Next(C_NULL_CTX)
end

"""Normal ampere rating of Line. (Getter)"""
function NormAmps()::Float64
    return @checked Lib.Lines_Get_NormAmps(C_NULL_CTX)
end

"""Normal ampere rating of Line. (Setter)"""
function NormAmps(Value::Float64)
    @checked Lib.Lines_Set_NormAmps(C_NULL_CTX, Value)
end

"""Number of customers on this line section."""
function NumCust()::Int
    return @checked Lib.Lines_Get_NumCust(C_NULL_CTX)
end

"""Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails."""
function Parent()::Int
    return @checked Lib.Lines_Get_Parent(C_NULL_CTX)
end

"""Number of Phases, this Line element. (Getter)"""
function Phases()::Int
    return @checked Lib.Lines_Get_Phases(C_NULL_CTX)
end

"""Number of Phases, this Line element. (Setter)"""
function Phases(Value::Int)
    @checked Lib.Lines_Set_Phases(C_NULL_CTX, Value)
end

"""Zero Sequence resistance, ohms per unit length. (Getter)"""
function R0()::Float64
    return @checked Lib.Lines_Get_R0(C_NULL_CTX)
end

"""Zero Sequence resistance, ohms per unit length. (Setter)"""
function R0(Value::Float64)
    @checked Lib.Lines_Set_R0(C_NULL_CTX, Value)
end

"""Positive Sequence resistance, ohms per unit length. (Getter)"""
function R1()::Float64
    return @checked Lib.Lines_Get_R1(C_NULL_CTX)
end

"""Positive Sequence resistance, ohms per unit length. (Setter)"""
function R1(Value::Float64)
    @checked Lib.Lines_Set_R1(C_NULL_CTX, Value)
end

"""Earth return resistance value used to compute line impedances at power frequency (Getter)"""
function Rg()::Float64
    return @checked Lib.Lines_Get_Rg(C_NULL_CTX)
end

"""Earth return resistance value used to compute line impedances at power frequency (Setter)"""
function Rg(Value::Float64)
    @checked Lib.Lines_Set_Rg(C_NULL_CTX, Value)
end

"""Earth Resistivity, ohm-m (Getter)"""
function Rho()::Float64
    return @checked Lib.Lines_Get_Rho(C_NULL_CTX)
end

"""Earth Resistivity, ohm-m (Setter)"""
function Rho(Value::Float64)
    @checked Lib.Lines_Set_Rho(C_NULL_CTX, Value)
end

"""Resistance matrix (full), ohms per unit length. Matrix of doubles. (Getter)"""
function RMatrix()::Matrix{Float64}
    n = Phases()
    if n == 0
        rmatrix = reshape(Float64[], (0, 0))
    else
        rmatrix = reshape(get_float64_array(Lib.Lines_Get_Rmatrix, C_NULL_CTX), (n, n))
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
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Rmatrix(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Line spacing code (Getter)"""
function Spacing()::String
    return get_string(@checked Lib.Lines_Get_Spacing(C_NULL_CTX))
end

"""Line spacing code (Getter)"""
function Spacing(Value::String)
    @checked Lib.Lines_Set_Spacing(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Total Number of customers served from this line section."""
function TotalCust()::Int
    return @checked Lib.Lines_Get_TotalCust(C_NULL_CTX)
end

"""Units for Line (Getter)"""
function Units()::Lib.LineUnits
    return @checked Lib.Lines_Get_Units(C_NULL_CTX)
end

"""Units for Line (Setter)"""
function Units(Value::Union{Int,Lib.LineUnits})
    Value = convert(Lib.LineUnits, Value)
    @checked Lib.Lines_Set_Units(C_NULL_CTX, Value)
end

"""Zero Sequence reactance ohms per unit length. (Getter)"""
function X0()::Float64
    return @checked Lib.Lines_Get_X0(C_NULL_CTX)
end

"""Zero Sequence reactance ohms per unit length. (Setter)"""
function X0(Value::Float64)
    @checked Lib.Lines_Set_X0(C_NULL_CTX, Value)
end

"""Positive Sequence reactance, ohms per unit length. (Getter)"""
function X1()::Float64
    return @checked Lib.Lines_Get_X1(C_NULL_CTX)
end

"""Positive Sequence reactance, ohms per unit length. (Setter)"""
function X1(Value::Float64)
    @checked Lib.Lines_Set_X1(C_NULL_CTX, Value)
end

"""Earth return reactance value used to compute line impedances at power frequency (Getter)"""
function Xg()::Float64
    return @checked Lib.Lines_Get_Xg(C_NULL_CTX)
end

"""Earth return reactance value used to compute line impedances at power frequency (Setter)"""
function Xg(Value::Float64)
    @checked Lib.Lines_Set_Xg(C_NULL_CTX, Value)
end

"""Susceptance matrix, ohms per unit length. Matrix of doubles. (Getter)"""
function XMatrix()::Matrix{Float64}
    n = Phases()
    if n == 0
        xmatrix = reshape(Float64[], (0, 0))
    else
        xmatrix = reshape(get_float64_array(Lib.Lines_Get_Xmatrix, C_NULL_CTX), (n, n))
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
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Xmatrix(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Yprimitive: Does Nothing at present on Put; Dangerous (Getter)"""
function Yprim()::Matrix{ComplexF64}
    r = get_complex64_array(Lib.Lines_Get_Yprim, C_NULL_CTX)
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end

"""Yprimitive: Does Nothing at present on Put; Dangerous (Setter)"""
function Yprim(Value::Matrix{ComplexF64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Yprim(C_NULL_CTX, ValuePtr, ValueCount)
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

"""Line Index (Getter)"""
function Idx()::Int
    return @checked Lib.Lines_Get_idx(C_NULL_CTX)
end

"""Line Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Lines_Set_idx(C_NULL_CTX, Value)
end

"""Sets/gets the Line element switch status. Setting it has side-effects to the line parameters. (Getter)"""
function IsSwitch()::Bool
    return (@checked Lib.Lines_Get_IsSwitch(C_NULL_CTX)) != 0
end

"""Sets/gets the Line element switch status. Setting it has side-effects to the line parameters. (Setter)"""
function IsSwitch(Value::Bool)
    return @checked Lib.Lines_Set_IsSwitch(C_NULL_CTX, Value)
end

"""Delivers the rating for the current season (in Amps)  if the "SeasonalRatings" option is active"""
function SeasonRating()::Float64
    return @checked Lib.Lines_Get_SeasonRating(C_NULL_CTX)
end

end
