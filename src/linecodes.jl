module LineCodes

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all LineCode objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.LineCodes_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active LineCode object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.LineCodes_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a LineCode object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.LineCodes_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of LineCode Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.LineCodes_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first LineCode to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.LineCodes_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next LineCode to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.LineCodes_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the current active LineCode index (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.LineCodes_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate LineCode by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.LineCodes_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Zero-sequence capacitance, nF per unit length

Original COM help: https://opendss.epri.com/C2.html

(Getter)
"""
function C0(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_C0, dss.ctx)
end
C0() = C0(DSS_DEFAULT_CTX)

"""
Zero-sequence capacitance, nF per unit length

Original COM help: https://opendss.epri.com/C2.html

(Setter)
"""
function C0(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_C0, dss.ctx, Value)
end
C0(Value::Float64) = C0(DSS_DEFAULT_CTX, Value)

"""
Positive-sequence capacitance, nF per unit length

Original COM help: https://opendss.epri.com/C3.html

(Getter)
"""
function C1(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_C1, dss.ctx)
end
C1() = C1(DSS_DEFAULT_CTX)

"""
Positive-sequence capacitance, nF per unit length

Original COM help: https://opendss.epri.com/C3.html

(Setter)
"""
function C1(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_C1, dss.ctx, Value)
end
C1(Value::Float64) = C1(DSS_DEFAULT_CTX, Value)

"""
Capacitance matrix, nF per unit length

Original COM help: https://opendss.epri.com/Cmatrix1.html

(Getter)
"""
function Cmatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases()
    if n == 0
        cmatrix = reshape(Float64[], (0, 0))
    else
        cmatrix = reshape(get_float64_array(dss.capi.LineCodes_Get_Cmatrix, dss), (n, n))
    end
    return cmatrix
end
Cmatrix() = Cmatrix(DSS_DEFAULT_CTX)

"""
Capacitance matrix, nF per unit length

Original COM help: https://opendss.epri.com/Cmatrix1.html

(Setter)
"""
function Cmatrix(Value::Matrix{Float64})
    n = Phases()
    Cmatrix(Value[:])
end

"""
Capacitance matrix, nF per unit length

Original COM help: https://opendss.epri.com/Cmatrix1.html

(Setter)
"""
function Cmatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.LineCodes_Set_Cmatrix, dss.ctx, ValuePtr, ValueCount)
end
Cmatrix(Value::Vector{Float64}) = Cmatrix(DSS_DEFAULT_CTX, Value)

"""
Emergency ampere rating

Original COM help: https://opendss.epri.com/EmergAmps2.html

(Getter)
"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_EmergAmps, dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""
Emergency ampere rating

Original COM help: https://opendss.epri.com/EmergAmps2.html

(Setter)
"""
function EmergAmps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_EmergAmps, dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""
Flag denoting whether impedance data were entered in symmetrical components

Original COM help: https://opendss.epri.com/IsZ1Z0.html
"""
function IsZ1Z0(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.LineCodes_Get_IsZ1Z0, dss.ctx)) != 0
end
IsZ1Z0() = IsZ1Z0(DSS_DEFAULT_CTX)

"""
Normal Ampere rating

Original COM help: https://opendss.epri.com/NormAmps1.html

(Getter)
"""
function NormAmps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_NormAmps, dss.ctx)
end
NormAmps() = NormAmps(DSS_DEFAULT_CTX)

"""
Normal Ampere rating

Original COM help: https://opendss.epri.com/NormAmps1.html

(Setter)
"""
function NormAmps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_NormAmps, dss.ctx, Value)
end
NormAmps(Value::Float64) = NormAmps(DSS_DEFAULT_CTX, Value)

"""
Number of Phases

Original COM help: https://opendss.epri.com/Phases2.html

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.LineCodes_Get_Phases, dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of Phases

Original COM help: https://opendss.epri.com/Phases2.html

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.LineCodes_Set_Phases, dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
Zero-Sequence Resistance, ohms per unit length

Original COM help: https://opendss.epri.com/R2.html

(Getter)
"""
function R0(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_R0, dss.ctx)
end
R0() = R0(DSS_DEFAULT_CTX)

"""
Zero-Sequence Resistance, ohms per unit length

Original COM help: https://opendss.epri.com/R2.html

(Setter)
"""
function R0(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_R0, dss.ctx, Value)
end
R0(Value::Float64) = R0(DSS_DEFAULT_CTX, Value)

"""
Positive-sequence resistance ohms per unit length

Original COM help: https://opendss.epri.com/R3.html

(Getter)
"""
function R1(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_R1, dss.ctx)
end
R1() = R1(DSS_DEFAULT_CTX)

"""
Positive-sequence resistance ohms per unit length

Original COM help: https://opendss.epri.com/R3.html

(Setter)
"""
function R1(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_R1, dss.ctx, Value)
end
R1(Value::Float64) = R1(DSS_DEFAULT_CTX, Value)

"""
Resistance matrix, ohms per unit length

Original COM help: https://opendss.epri.com/Rmatrix1.html

(Getter)
"""
function Rmatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases()
    if n == 0
        rmatrix = reshape(Float64[], (0, 0))
    else
        rmatrix = reshape(get_float64_array(dss.capi.LineCodes_Get_Rmatrix, dss), (n, n))
    end
    return rmatrix
end
Rmatrix() = Rmatrix(DSS_DEFAULT_CTX)

"""
Resistance matrix, ohms per unit length

Original COM help: https://opendss.epri.com/Rmatrix1.html

(Setter)
"""
function Rmatrix(Value::Matrix{Float64})
    n = Phases()
    Rmatrix(Value[:])
end

"""
Resistance matrix, ohms per unit length

Original COM help: https://opendss.epri.com/Rmatrix1.html

(Setter)
"""
function Rmatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.LineCodes_Set_Rmatrix, dss.ctx, ValuePtr, ValueCount)
end
Rmatrix(Value::Vector{Float64}) = Rmatrix(DSS_DEFAULT_CTX, Value)

"""
Units of Line Code

(Getter)
"""
function Units(dss::DSSContext)::Lib.LineUnits
    return @checked dss_ccall(dss.capi.LineCodes_Get_Units, dss.ctx)
end
Units() = Units(DSS_DEFAULT_CTX)

"""
Units of Line Code

(Setter)
"""
function Units(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    Value = convert(Lib.LineUnits, Value)
    @checked dss_ccall(dss.capi.LineCodes_Set_Units, dss.ctx, Value)
end
Units(Value::Union{Int,Lib.LineUnits}) = Units(DSS_DEFAULT_CTX, Value)

"""
Zero Sequence Reactance, Ohms per unit length

Original COM help: https://opendss.epri.com/X2.html

(Getter)
"""
function X0(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_X0, dss.ctx)
end
X0() = X0(DSS_DEFAULT_CTX)

"""
Zero Sequence Reactance, Ohms per unit length

Original COM help: https://opendss.epri.com/X2.html

(Setter)
"""
function X0(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_X0, dss.ctx, Value)
end
X0(Value::Float64) = X0(DSS_DEFAULT_CTX, Value)

"""
Positive-sequence reactance, ohms per unit length

Original COM help: https://opendss.epri.com/X3.html

(Getter)
"""
function X1(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.LineCodes_Get_X1, dss.ctx)
end
X1() = X1(DSS_DEFAULT_CTX)

"""
Positive-sequence reactance, ohms per unit length

Original COM help: https://opendss.epri.com/X3.html

(Setter)
"""
function X1(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.LineCodes_Set_X1, dss.ctx, Value)
end
X1(Value::Float64) = X1(DSS_DEFAULT_CTX, Value)

"""
Reactance matrix, ohms per unit length

Original COM help: https://opendss.epri.com/Xmatrix1.html

(Getter)
"""
function Xmatrix(dss::DSSContext)::Matrix{Float64}
    n = Phases()
    if n == 0
        xmatrix = reshape(Float64[], (0, 0))
    else
        xmatrix = reshape(get_float64_array(dss.capi.LineCodes_Get_Xmatrix, dss), (n, n))
    end
    return xmatrix
end
Xmatrix() = Xmatrix(DSS_DEFAULT_CTX)

"""
Reactance matrix, ohms per unit length

Original COM help: https://opendss.epri.com/Xmatrix1.html

(Setter)
"""
function Xmatrix(Value::Matrix{Float64})
    n = Phases()
    Xmatrix(Value[:])
end

"""
Reactance matrix, ohms per unit length

Original COM help: https://opendss.epri.com/Xmatrix1.html

(Setter)
"""
function Xmatrix(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked dss_ccall(dss.capi.LineCodes_Set_Xmatrix, dss.ctx, ValuePtr, ValueCount)
end
Xmatrix(Value::Vector{Float64}) = Xmatrix(DSS_DEFAULT_CTX, Value)

"""
Complex impedance matrix, ohms per unit length

(Getter)
"""
function Zmatrix()::Matrix{ComplexF64}
    zmatrix = Rmatrix() + im * Xmatrix()
    return zmatrix
end

"""
Complex impedance matrix, ohms per unit length

(Setter)
"""
function Zmatrix(Value::Matrix{ComplexF64})
    r = real(Value)
    i = imag(Value)
    Rmatrix(r)
    Xmatrix(i)
end

end
