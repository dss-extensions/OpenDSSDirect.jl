module Lines

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Create new Line object"""
function New(dss::DSSContext, Name::String)::Int
    return @checked Lib.Lines_New(dss.ctx, Cstring(pointer(Name)))
end
New(Name::String) = New(DSS_DEFAULT_CTX, Name)

"""Names of all Line Objects"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Lines_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Name of bus for terminal 1. (Getter)"""
function Bus1(dss::DSSContext)::String
    return get_string(@checked Lib.Lines_Get_Bus1(dss.ctx))
end
Bus1() = Bus1(DSS_DEFAULT_CTX)

"""Name of bus for terminal 1. (Setter)"""
function Bus1(dss::DSSContext, Value::String)
    @checked Lib.Lines_Set_Bus1(dss.ctx, Cstring(pointer(Value)))
end
Bus1(Value::String) = Bus1(DSS_DEFAULT_CTX, Value)

"""Name of bus for terminal 2. (Getter)"""
function Bus2(dss::DSSContext)::String
    return get_string(@checked Lib.Lines_Get_Bus2(dss.ctx))
end
Bus2() = Bus2(DSS_DEFAULT_CTX)

"""Name of bus for terminal 2. (Setter)"""
function Bus2(dss::DSSContext, Value::String)
    @checked Lib.Lines_Set_Bus2(dss.ctx, Cstring(pointer(Value)))
end
Bus2(Value::String) = Bus2(DSS_DEFAULT_CTX, Value)

"""Zero Sequence capacitance, nanofarads per unit length. (Getter)"""
function C0(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_C0(dss.ctx)
end
C0() = C0(DSS_DEFAULT_CTX)

"""Zero Sequence capacitance, nanofarads per unit length. (Setter)"""
function C0(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_C0(dss.ctx, Value)
end
C0(Value::Float64) = C0(DSS_DEFAULT_CTX, Value)

"""Positive Sequence capacitance, nanofarads per unit length. (Getter)"""
function C1(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_C1(dss.ctx)
end
C1() = C1(DSS_DEFAULT_CTX)

"""Positive Sequence capacitance, nanofarads per unit length. (Setter)"""
function C1(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_C1(dss.ctx, Value)
end
C1(Value::Float64) = C1(DSS_DEFAULT_CTX, Value)

"""Capacitance matrix, nF per unit length (Getter)"""
function CMatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases()
    if n == 0
        cmatrix = reshape(Float64[], (0, 0))
    else
        cmatrix = reshape(get_float64_array(Lib.Lines_Get_Cmatrix, dss.ctx), (n, n))
    end
    return cmatrix
end
CMatrix() = CMatrix(DSS_DEFAULT_CTX)

"""Capacitance matrix, nF per unit length (Setter)"""
function CMatrix(Value::Matrix{Float64})
    n = Phases()
    CMatrix(Value[:])
end

"""Capacitance matrix, nF per unit length (Setter)"""
function CMatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Cmatrix(dss.ctx, ValuePtr, ValueCount)
end
CMatrix(Value::Vector{Float64}) = CMatrix(DSS_DEFAULT_CTX, Value)

"""Number of Line objects in Active Circuit."""
function Count(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Emergency (maximum) ampere rating of Line. (Getter)"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_EmergAmps(dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""Emergency (maximum) ampere rating of Line. (Setter)"""
function EmergAmps(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_EmergAmps(dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""Invoking this property sets the first element active.  Returns 0 if no lines.  Otherwise, index of the line element."""
function First(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Line geometry code (Getter)"""
function Geometry(dss::DSSContext)::String
    return get_string(@checked Lib.Lines_Get_Geometry(dss.ctx))
end
Geometry() = Geometry(DSS_DEFAULT_CTX)

"""Line geometry code (Setter)"""
function Geometry(dss::DSSContext, Value::String)
    @checked Lib.Lines_Set_Geometry(dss.ctx, Cstring(pointer(Value)))
end
Geometry(Value::String) = Geometry(DSS_DEFAULT_CTX, Value)

"""Length of line section in units compatible with the LineCode definition. (Getter)"""
function Length(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_Length(dss.ctx)
end
Length() = Length(DSS_DEFAULT_CTX)

"""Length of line section in units compatible with the LineCode definition. (Setter)"""
function Length(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_Length(dss.ctx, Value)
end
Length(Value::Float64) = Length(DSS_DEFAULT_CTX, Value)

"""Name of LineCode object that defines the impedances. (Getter)"""
function LineCode(dss::DSSContext)::String
    return get_string(@checked Lib.Lines_Get_LineCode(dss.ctx))
end
LineCode() = LineCode(DSS_DEFAULT_CTX)

"""Name of LineCode object that defines the impedances. (Setter)"""
function LineCode(dss::DSSContext, Value::String)
    @checked Lib.Lines_Set_LineCode(dss.ctx, Cstring(pointer(Value)))
end
LineCode(Value::String) = LineCode(DSS_DEFAULT_CTX, Value)

"""Specify the name of the Line element to set it active. (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Lines_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Specify the name of the Line element to set it active. (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Lines_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Invoking this property advances to the next Line element active.  Returns 0 if no more lines.  Otherwise, index of the line element."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Normal ampere rating of Line. (Getter)"""
function NormAmps(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_NormAmps(dss.ctx)
end
NormAmps() = NormAmps(DSS_DEFAULT_CTX)

"""Normal ampere rating of Line. (Setter)"""
function NormAmps(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_NormAmps(dss.ctx, Value)
end
NormAmps(Value::Float64) = NormAmps(DSS_DEFAULT_CTX, Value)

"""Number of customers on this line section."""
function NumCust(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_NumCust(dss.ctx)
end
NumCust() = NumCust(DSS_DEFAULT_CTX)

"""Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails."""
function Parent(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_Parent(dss.ctx)
end
Parent() = Parent(DSS_DEFAULT_CTX)

"""Number of Phases, this Line element. (Getter)"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""Number of Phases, this Line element. (Setter)"""
function Phases(dss::DSSContext, Value::Int)
    @checked Lib.Lines_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""Zero Sequence resistance, ohms per unit length. (Getter)"""
function R0(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_R0(dss.ctx)
end
R0() = R0(DSS_DEFAULT_CTX)

"""Zero Sequence resistance, ohms per unit length. (Setter)"""
function R0(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_R0(dss.ctx, Value)
end
R0(Value::Float64) = R0(DSS_DEFAULT_CTX, Value)

"""Positive Sequence resistance, ohms per unit length. (Getter)"""
function R1(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_R1(dss.ctx)
end
R1() = R1(DSS_DEFAULT_CTX)

"""Positive Sequence resistance, ohms per unit length. (Setter)"""
function R1(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_R1(dss.ctx, Value)
end
R1(Value::Float64) = R1(DSS_DEFAULT_CTX, Value)

"""Earth return resistance value used to compute line impedances at power frequency (Getter)"""
function Rg(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_Rg(dss.ctx)
end
Rg() = Rg(DSS_DEFAULT_CTX)

"""Earth return resistance value used to compute line impedances at power frequency (Setter)"""
function Rg(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_Rg(dss.ctx, Value)
end
Rg(Value::Float64) = Rg(DSS_DEFAULT_CTX, Value)

"""Earth Resistivity, ohm-m (Getter)"""
function Rho(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_Rho(dss.ctx)
end
Rho() = Rho(DSS_DEFAULT_CTX)

"""Earth Resistivity, ohm-m (Setter)"""
function Rho(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_Rho(dss.ctx, Value)
end
Rho(Value::Float64) = Rho(DSS_DEFAULT_CTX, Value)

"""Resistance matrix (full), ohms per unit length. Matrix of doubles. (Getter)"""
function RMatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases()
    if n == 0
        rmatrix = reshape(Float64[], (0, 0))
    else
        rmatrix = reshape(get_float64_array(Lib.Lines_Get_Rmatrix, dss.ctx), (n, n))
    end
    return rmatrix
end
RMatrix() = RMatrix(DSS_DEFAULT_CTX)

"""Resistance matrix (full), ohms per unit length. Matrix of doubles. (Setter)"""
function RMatrix(Value::Matrix{Float64})
    n = Phases()
    RMatrix(Value[:])
end

"""Resistance matrix (full), ohms per unit length. Vector of doubles. (Setter)"""
function RMatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Rmatrix(dss.ctx, ValuePtr, ValueCount)
end
RMatrix(Value::Vector{Float64}) = RMatrix(DSS_DEFAULT_CTX, Value)

"""Line spacing code (Getter)"""
function Spacing(dss::DSSContext)::String
    return get_string(@checked Lib.Lines_Get_Spacing(dss.ctx))
end
Spacing() = Spacing(DSS_DEFAULT_CTX)

"""Line spacing code (Getter)"""
function Spacing(dss::DSSContext, Value::String)
    @checked Lib.Lines_Set_Spacing(dss.ctx, Cstring(pointer(Value)))
end
Spacing(Value::String) = Spacing(DSS_DEFAULT_CTX, Value)

"""Total Number of customers served from this line section."""
function TotalCust(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_TotalCust(dss.ctx)
end
TotalCust() = TotalCust(DSS_DEFAULT_CTX)

"""Units for Line (Getter)"""
function Units(dss::DSSContext)::Lib.LineUnits
    return @checked Lib.Lines_Get_Units(dss.ctx)
end
Units() = Units(DSS_DEFAULT_CTX)

"""Units for Line (Setter)"""
function Units(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    Value = convert(Lib.LineUnits, Value)
    @checked Lib.Lines_Set_Units(dss.ctx, Value)
end
Units(Value::Union{Int,Lib.LineUnits}) = Units(DSS_DEFAULT_CTX, Value)

"""Zero Sequence reactance ohms per unit length. (Getter)"""
function X0(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_X0(dss.ctx)
end
X0() = X0(DSS_DEFAULT_CTX)

"""Zero Sequence reactance ohms per unit length. (Setter)"""
function X0(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_X0(dss.ctx, Value)
end
X0(Value::Float64) = X0(DSS_DEFAULT_CTX, Value)

"""Positive Sequence reactance, ohms per unit length. (Getter)"""
function X1(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_X1(dss.ctx)
end
X1() = X1(DSS_DEFAULT_CTX)

"""Positive Sequence reactance, ohms per unit length. (Setter)"""
function X1(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_X1(dss.ctx, Value)
end
X1(Value::Float64) = X1(DSS_DEFAULT_CTX, Value)

"""Earth return reactance value used to compute line impedances at power frequency (Getter)"""
function Xg(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_Xg(dss.ctx)
end
Xg() = Xg(DSS_DEFAULT_CTX)

"""Earth return reactance value used to compute line impedances at power frequency (Setter)"""
function Xg(dss::DSSContext, Value::Float64)
    @checked Lib.Lines_Set_Xg(dss.ctx, Value)
end
Xg(Value::Float64) = Xg(DSS_DEFAULT_CTX, Value)

"""Susceptance matrix, ohms per unit length. Matrix of doubles. (Getter)"""
function XMatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases()
    if n == 0
        xmatrix = reshape(Float64[], (0, 0))
    else
        xmatrix = reshape(get_float64_array(Lib.Lines_Get_Xmatrix, dss.ctx), (n, n))
    end
    return xmatrix
end
XMatrix() = XMatrix(DSS_DEFAULT_CTX)

"""Susceptance matrix, ohms per unit length. Matrix of doubles. (Setter)"""
function XMatrix(Value::Matrix{Float64})
    n = Phases()
    XMatrix(Value[:])
end

"""Susceptance matrix, ohms per unit length. Vector of doubles. (Setter)"""
function XMatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Xmatrix(dss.ctx, ValuePtr, ValueCount)
end
XMatrix(Value::Vector{Float64}) = XMatrix(DSS_DEFAULT_CTX, Value)

"""Yprimitive: Does Nothing at present on Put; Dangerous (Getter)"""
function Yprim(dss::DSSContext)::Matrix{ComplexF64}
    r = get_complex64_array(Lib.Lines_Get_Yprim, dss.ctx)
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end
Yprim() = Yprim(DSS_DEFAULT_CTX)

"""Yprimitive: Does Nothing at present on Put; Dangerous (Setter)"""
function Yprim(dss::DSSContext, Value::Matrix{ComplexF64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Lines_Set_Yprim(dss.ctx, ValuePtr, ValueCount)
end
Yprim(Value::Matrix{ComplexF64}) = Yprim(DSS_DEFAULT_CTX, Value)

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
function Idx(dss::DSSContext)::Int
    return @checked Lib.Lines_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Line Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Lines_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Sets/gets the Line element switch status. Setting it has side-effects to the line parameters. (Getter)"""
function IsSwitch(dss::DSSContext)::Bool
    return (@checked Lib.Lines_Get_IsSwitch(dss.ctx)) != 0
end
IsSwitch() = IsSwitch(DSS_DEFAULT_CTX)

"""Sets/gets the Line element switch status. Setting it has side-effects to the line parameters. (Setter)"""
function IsSwitch(dss::DSSContext, Value::Bool)
    return @checked Lib.Lines_Set_IsSwitch(dss.ctx, Value)
end
IsSwitch(Value::Bool) = IsSwitch(DSS_DEFAULT_CTX, Value)

"""Delivers the rating for the current season (in Amps)  if the "SeasonalRatings" option is active"""
function SeasonRating(dss::DSSContext)::Float64
    return @checked Lib.Lines_Get_SeasonRating(dss.ctx)
end
SeasonRating() = SeasonRating(DSS_DEFAULT_CTX)

end
