module Lines

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Line objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Lines_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Line object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Lines_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Line object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Lines_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Line Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Line to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Line to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Line (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Line by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Lines_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Create new Line object with the given `Name`"""
function New(dss::DSSContext, Name::String)::Int
    return @checked dss_ccall(dss.capi.Lines_New, dss.ctx, Name)
end
New(Name::String) = New(DSS_DEFAULT_CTX, Name)

"""
Name of bus for terminal 1.

Original COM help: <https://opendss.epri.com/Bus1.html>

(Getter)
"""
function Bus1(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Lines_Get_Bus1, dss.ctx))
end
Bus1() = Bus1(DSS_DEFAULT_CTX)

"""
Name of bus for terminal 1.

Original COM help: <https://opendss.epri.com/Bus1.html>

(Setter)
"""
function Bus1(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Lines_Set_Bus1, dss.ctx, Value)
end
Bus1(Value::String) = Bus1(DSS_DEFAULT_CTX, Value)

"""
Name of bus for terminal 2.

Original COM help: <https://opendss.epri.com/Bus2.html>

(Getter)
"""
function Bus2(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Lines_Get_Bus2, dss.ctx))
end
Bus2() = Bus2(DSS_DEFAULT_CTX)

"""
Name of bus for terminal 2.

Original COM help: <https://opendss.epri.com/Bus2.html>

(Setter)
"""
function Bus2(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Lines_Set_Bus2, dss.ctx, Value)
end
Bus2(Value::String) = Bus2(DSS_DEFAULT_CTX, Value)

"""
Zero Sequence capacitance, nanofarads per unit length.

Original COM help: <https://opendss.epri.com/C0.html>

(Getter)
"""
function C0(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_C0, dss.ctx)
end
C0() = C0(DSS_DEFAULT_CTX)

"""
Zero Sequence capacitance, nanofarads per unit length.

Original COM help: <https://opendss.epri.com/C0.html>

(Setter)
"""
function C0(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_C0, dss.ctx, Value)
end
C0(Value::Float64) = C0(DSS_DEFAULT_CTX, Value)

"""
Positive Sequence capacitance, nanofarads per unit length.

Original COM help: <https://opendss.epri.com/C1.html>

(Getter)
"""
function C1(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_C1, dss.ctx)
end
C1() = C1(DSS_DEFAULT_CTX)

"""
Positive Sequence capacitance, nanofarads per unit length.

Original COM help: <https://opendss.epri.com/C1.html>

(Setter)
"""
function C1(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_C1, dss.ctx, Value)
end
C1(Value::Float64) = C1(DSS_DEFAULT_CTX, Value)

"""
Capacitance matrix, nF per unit length

(Getter)
"""
function CMatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases(dss)
    if n == 0
        cmatrix = reshape(Float64[], (0, 0))
    else
        cmatrix = reshape(get_float64_array(dss.capi.Lines_Get_Cmatrix, dss), (n, n))
    end
    return cmatrix
end
CMatrix() = CMatrix(DSS_DEFAULT_CTX)

"""
Capacitance matrix, nF per unit length

(Setter)
"""
function CMatrix(Value::Matrix{Float64})
    CMatrix(Value[:])
end

"""
Capacitance matrix, nF per unit length

(Setter)
"""
function CMatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Lines_Set_Cmatrix, dss.ctx, ValuePtr, ValueCount)
end
CMatrix(Value::Vector{Float64}) = CMatrix(DSS_DEFAULT_CTX, Value)

"""
Emergency (maximum) ampere rating of Line.

Original COM help: <https://opendss.epri.com/EmergAmps1.html>

(Getter)
"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_EmergAmps, dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""
Emergency (maximum) ampere rating of Line.

Original COM help: <https://opendss.epri.com/EmergAmps1.html>

(Setter)
"""
function EmergAmps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_EmergAmps, dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""
Line geometry code

Original COM help: <https://opendss.epri.com/Geometry.html>

(Getter)
"""
function Geometry(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Lines_Get_Geometry, dss.ctx))
end
Geometry() = Geometry(DSS_DEFAULT_CTX)

"""
Line geometry code

Original COM help: <https://opendss.epri.com/Geometry.html>

(Setter)
"""
function Geometry(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Lines_Set_Geometry, dss.ctx, Value)
end
Geometry(Value::String) = Geometry(DSS_DEFAULT_CTX, Value)

"""
Length of line in units compatible with the LineCode definition.

Original COM help: <https://opendss.epri.com/Length.html>

(Getter)
"""
function Length(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_Length, dss.ctx)
end
Length() = Length(DSS_DEFAULT_CTX)

"""
Length of line in units compatible with the LineCode definition.

Original COM help: <https://opendss.epri.com/Length.html>

(Setter)
"""
function Length(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_Length, dss.ctx, Value)
end
Length(Value::Float64) = Length(DSS_DEFAULT_CTX, Value)

"""
Name of LineCode object that defines the impedances.

Original COM help: <https://opendss.epri.com/LineCode.html>

(Getter)
"""
function LineCode(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Lines_Get_LineCode, dss.ctx))
end
LineCode() = LineCode(DSS_DEFAULT_CTX)

"""
Name of LineCode object that defines the impedances.

Original COM help: <https://opendss.epri.com/LineCode.html>

(Setter)
"""
function LineCode(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Lines_Set_LineCode, dss.ctx, Value)
end
LineCode(Value::String) = LineCode(DSS_DEFAULT_CTX, Value)

"""
Normal ampere rating of Line.

Original COM help: <https://opendss.epri.com/NormAmps.html>

(Getter)
"""
function NormAmps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_NormAmps, dss.ctx)
end
NormAmps() = NormAmps(DSS_DEFAULT_CTX)

"""
Normal ampere rating of Line.

Original COM help: <https://opendss.epri.com/NormAmps.html>

(Setter)
"""
function NormAmps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_NormAmps, dss.ctx, Value)
end
NormAmps(Value::Float64) = NormAmps(DSS_DEFAULT_CTX, Value)

"""
Number of customers on this line.

*Requires an energy meter with an updated zone.*

Original COM help: <https://opendss.epri.com/NumCust.html>
"""
function NumCust(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_NumCust, dss.ctx)
end
NumCust() = NumCust(DSS_DEFAULT_CTX)

"""
Sets Parent of the active Line to be the active line. Returns 0 if no parent or action fails.

*Requires an energy meter with an updated zone.*

Original COM help: <https://opendss.epri.com/Parent.html>
"""
function Parent(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_Parent, dss.ctx)
end
Parent() = Parent(DSS_DEFAULT_CTX)

"""
Number of Phases, this Line element.

Original COM help: <https://opendss.epri.com/Phases1.html>

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_Phases, dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of Phases, this Line element.

Original COM help: <https://opendss.epri.com/Phases1.html>

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Lines_Set_Phases, dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
Zero Sequence resistance, ohms per unit length.

Original COM help: <https://opendss.epri.com/R0.html>

(Getter)
"""
function R0(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_R0, dss.ctx)
end
R0() = R0(DSS_DEFAULT_CTX)

"""
Zero Sequence resistance, ohms per unit length.

Original COM help: <https://opendss.epri.com/R0.html>

(Setter)
"""
function R0(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_R0, dss.ctx, Value)
end
R0(Value::Float64) = R0(DSS_DEFAULT_CTX, Value)

"""
Positive Sequence resistance, ohms per unit length.

Original COM help: <https://opendss.epri.com/R1.html>

(Getter)
"""
function R1(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_R1, dss.ctx)
end
R1() = R1(DSS_DEFAULT_CTX)

"""
Positive Sequence resistance, ohms per unit length.

Original COM help: <https://opendss.epri.com/R1.html>

(Setter)
"""
function R1(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_R1, dss.ctx, Value)
end
R1(Value::Float64) = R1(DSS_DEFAULT_CTX, Value)

"""
Earth return resistance value used to compute line impedances at power frequency

Original COM help: <https://opendss.epri.com/Rg.html>

(Getter)
"""
function Rg(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_Rg, dss.ctx)
end
Rg() = Rg(DSS_DEFAULT_CTX)

"""
Earth return resistance value used to compute line impedances at power frequency

Original COM help: <https://opendss.epri.com/Rg.html>

(Setter)
"""
function Rg(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_Rg, dss.ctx, Value)
end
Rg(Value::Float64) = Rg(DSS_DEFAULT_CTX, Value)

"""
Earth Resistivity, m-ohms

Original COM help: <https://opendss.epri.com/Rho.html>

(Getter)
"""
function Rho(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_Rho, dss.ctx)
end
Rho() = Rho(DSS_DEFAULT_CTX)

"""
Earth Resistivity, m-ohms

Original COM help: <https://opendss.epri.com/Rho.html>

(Setter)
"""
function Rho(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_Rho, dss.ctx, Value)
end
Rho(Value::Float64) = Rho(DSS_DEFAULT_CTX, Value)

"""
Resistance matrix (full), ohms per unit length.

Original COM help: <https://opendss.epri.com/Rmatrix.html>

(Getter)
"""
function RMatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases(dss)
    if n == 0
        rmatrix = reshape(Float64[], (0, 0))
    else
        rmatrix = reshape(get_float64_array(dss.capi.Lines_Get_Rmatrix, dss), (n, n))
    end
    return rmatrix
end
RMatrix() = RMatrix(DSS_DEFAULT_CTX)

"""
Resistance matrix (full), ohms per unit length. Array of doubles.

Original COM help: <https://opendss.epri.com/Rmatrix.html>

(Setter)
"""
function RMatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Lines_Set_Rmatrix, dss.ctx, ValuePtr, ValueCount)
end
RMatrix(Value::Vector{Float64}) = RMatrix(DSS_DEFAULT_CTX, Value)

"""
Resistance matrix (full), ohms per unit length. Array of doubles.

Original COM help: <https://opendss.epri.com/Rmatrix.html>

(Setter)
"""
function RMatrix(dss::DSSContext, Value::Matrix{Float64})
    RMatrix(dss, Value[:])
end
RMatrix(Value::Matrix{Float64}) = RMatrix(DSS_DEFAULT_CTX, Value)

"""
Line spacing code

Original COM help: <https://opendss.epri.com/Spacing.html>

(Getter)
"""
function Spacing(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Lines_Get_Spacing, dss.ctx))
end
Spacing() = Spacing(DSS_DEFAULT_CTX)

"""
Line spacing code

Original COM help: <https://opendss.epri.com/Spacing.html>

(Setter)
"""
function Spacing(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Lines_Set_Spacing, dss.ctx, Value)
end
Spacing(Value::String) = Spacing(DSS_DEFAULT_CTX, Value)

"""
Total Number of customers served from this line.

Original COM help: <https://opendss.epri.com/TotalCust.html>
"""
function TotalCust(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Lines_Get_TotalCust, dss.ctx)
end
TotalCust() = TotalCust(DSS_DEFAULT_CTX)

"""
Length units for the active line.

Original COM help: https://opendss.epri.com/Units.html

(Getter)
"""
function Units(dss::DSSContext)::Lib.LineUnits
    return @checked dss_ccall(dss.capi.Lines_Get_Units, dss.ctx)
end
Units() = Units(DSS_DEFAULT_CTX)

"""
Length units for the active line.

Original COM help: https://opendss.epri.com/Units.html

(Setter)
"""
function Units(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    Value = convert(Lib.LineUnits, Value)
    @checked dss_ccall(dss.capi.Lines_Set_Units, dss.ctx, Value)
end
Units(Value::Union{Int,Lib.LineUnits}) = Units(DSS_DEFAULT_CTX, Value)

"""
Zero Sequence reactance ohms per unit length.

Original COM help: <https://opendss.epri.com/X0.html>

(Getter)
"""
function X0(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_X0, dss.ctx)
end
X0() = X0(DSS_DEFAULT_CTX)

"""
Zero Sequence reactance ohms per unit length.

Original COM help: <https://opendss.epri.com/X0.html>

(Setter)
"""
function X0(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_X0, dss.ctx, Value)
end
X0(Value::Float64) = X0(DSS_DEFAULT_CTX, Value)

"""
Positive Sequence reactance, ohms per unit length.

Original COM help: <https://opendss.epri.com/X1.html>

(Getter)
"""
function X1(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_X1, dss.ctx)
end
X1() = X1(DSS_DEFAULT_CTX)

"""
Positive Sequence reactance, ohms per unit length.

Original COM help: <https://opendss.epri.com/X1.html>

(Setter)
"""
function X1(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_X1, dss.ctx, Value)
end
X1(Value::Float64) = X1(DSS_DEFAULT_CTX, Value)

"""
Earth return reactance value used to compute line impedances at power frequency

Original COM help: <https://opendss.epri.com/Xg.html>

(Getter)
"""
function Xg(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_Xg, dss.ctx)
end
Xg() = Xg(DSS_DEFAULT_CTX)

"""
Earth return reactance value used to compute line impedances at power frequency

Original COM help: <https://opendss.epri.com/Xg.html>

(Setter)
"""
function Xg(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Lines_Set_Xg, dss.ctx, Value)
end
Xg(Value::Float64) = Xg(DSS_DEFAULT_CTX, Value)

"""
Reactance matrix (full), ohms per unit length.

Original COM help: <https://opendss.epri.com/Xmatrix.html>

(Getter)
"""
function XMatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases(dss)
    if n == 0
        xmatrix = reshape(Float64[], (0, 0))
    else
        xmatrix = reshape(get_float64_array(dss.capi.Lines_Get_Xmatrix, dss), (n, n))
    end
    return xmatrix
end
XMatrix() = XMatrix(DSS_DEFAULT_CTX)

"""
Reactance matrix (full), ohms per unit length.

Original COM help: <https://opendss.epri.com/Xmatrix.html>

(Setter)
"""
function XMatrix(dss::DSSContext, Value::Matrix{Float64})
    XMatrix(dss, Value[:])
end
XMatrix(Value::Matrix{Float64}) = XMatrix(DSS_DEFAULT_CTX, Value)

"""
Reactance matrix (full), ohms per unit length.

Original COM help: <https://opendss.epri.com/Xmatrix.html>

(Setter)
"""
function XMatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Lines_Set_Xmatrix, dss.ctx, ValuePtr, ValueCount)
end
XMatrix(Value::Vector{Float64}) = XMatrix(DSS_DEFAULT_CTX, Value)

"""
Yprimitive for the active line object (complex array).

Original COM help: <https://opendss.epri.com/Yprim1.html>

(Getter)
"""
function Yprim(dss::DSSContext)::Matrix{ComplexF64}
    r = get_complex64_array(dss.capi.Lines_Get_Yprim, dss)
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end
Yprim() = Yprim(DSS_DEFAULT_CTX)

"""
Yprimitive for the active line object (complex array).

Original COM help: <https://opendss.epri.com/Yprim1.html>

(Setter)
"""
function Yprim(dss::DSSContext, Value::Matrix{ComplexF64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.Lines_Set_Yprim, dss.ctx, ValuePtr, ValueCount)
end
Yprim(Value::Matrix{ComplexF64}) = Yprim(DSS_DEFAULT_CTX, Value)

"""
Complex impedance matrix, ohms per unit length.

(Getter)
"""
function ZMatrix()::Matrix{ComplexF64}
    zmatrix = RMatrix() + im * XMatrix()
    return zmatrix
end

"""
Complex impedance matrix, ohms per unit length.

(Setter)
"""
function ZMatrix(Value::Matrix{ComplexF64})
    r = real(Value)
    i = imag(Value)
    RMatrix(r)
    XMatrix(i)
end

"""
Line element switch status. Setting it has side-effects to the line parameters.

**(API Extension)**

(Getter)
"""
function IsSwitch(dss::DSSContext)::Bool
    return (@checked dss_ccall(dss.capi.Lines_Get_IsSwitch, dss.ctx)) != 0
end
IsSwitch() = IsSwitch(DSS_DEFAULT_CTX)

"""
Line element switch status. Setting it has side-effects to the line parameters.

**(API Extension)**

(Setter)
"""
function IsSwitch(dss::DSSContext, Value::Bool)
    return @checked dss_ccall(dss.capi.Lines_Set_IsSwitch, dss.ctx, Value)
end
IsSwitch(Value::Bool) = IsSwitch(DSS_DEFAULT_CTX, Value)

"""
Delivers the rating for the current season (in Amps)  if the "SeasonalRatings" option is active

Original COM help: <https://opendss.epri.com/SeasonRating.html>
"""
function SeasonRating(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Lines_Get_SeasonRating, dss.ctx)
end
SeasonRating() = SeasonRating(DSS_DEFAULT_CTX)

end
