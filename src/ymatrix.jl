module YMatrix

using SparseArrays
using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Return SparseMatrixCSC of ComplexF64"""
function getYsparse(dss::DSSContext, factor::Bool = true)::SparseMatrixCSC{Complex{Float64},Int}
    nBus = Ref(UInt32(0))
    nNz = Ref(UInt32(0))

    ColPtr = Ref{Ptr{Int32}}(0)
    RowIdxPtr = Ref{Ptr{Int32}}(0)
    cValsPtr = Ref{Ptr{Cdouble}}(0)

    @checked Lib.YMatrix_GetCompressedYMatrix(
        dss.ctx,
        factor ? 1 : 0,
        nBus,
        nNz,
        ColPtr,
        RowIdxPtr,
        cValsPtr,
    )

    if Int(nBus[]) == 0 || Int(nNz[]) == 0
        res = sparse(ComplexF64[], ComplexF64[], ComplexF64[])
    else
        # return as (data, indices, indptr) that can fed into scipy.sparse.csc_matrix
        data = Array(reinterpret(
            ComplexF64,
            copy(unsafe_wrap(Array, cValsPtr[], Int(nNz[]) * 2)),
        ))
        indices = copy(unsafe_wrap(Array, RowIdxPtr[], Int(nNz[])))
        indptr = copy(unsafe_wrap(Array, ColPtr[], (Int(nBus[]) + 1)))
        res = SparseMatrixCSC(nBus[], nBus[], indptr .+ 1, indices .+ 1, data)
    end

    Lib.DSS_Dispose_PInteger(ColPtr)
    Lib.DSS_Dispose_PInteger(RowIdxPtr)
    Lib.DSS_Dispose_PDouble(cValsPtr)

    return res
end
getYsparse(factor::Bool = true) = getYsparse(DSS_DEFAULT_CTX, factor)

"""
Zero Current Injections
"""
function ZeroInjCurr(dss::DSSContext)
    @checked Lib.YMatrix_ZeroInjCurr(dss.ctx)
end
ZeroInjCurr() = ZeroInjCurr(DSS_DEFAULT_CTX)

"""
Get Source Current Injections
"""
function GetSourceInjCurrents(dss::DSSContext)
    @checked Lib.YMatrix_GetSourceInjCurrents(dss.ctx)
end
GetSourceInjCurrents() = GetSourceInjCurrents(DSS_DEFAULT_CTX)

"""
Get PC Current Injections
"""
function GetPCInjCurr(dss::DSSContext)
    @checked Lib.YMatrix_GetPCInjCurr(dss.ctx)
end
GetPCInjCurr() = GetPCInjCurr(DSS_DEFAULT_CTX)

"""
Rebuild the circuit's YMatrix
"""
function BuildYMatrixD(dss::DSSContext, BuildOps::Int, AllocateVI::Bool)
    @checked Lib.YMatrix_BuildYMatrixD(dss.ctx, BuildOps, AllocateVI ? 1 : 0)
end
BuildYMatrixD(BuildOps::Int, AllocateVI::Bool) = BuildYMatrixD(DSS_DEFAULT_CTX, BuildOps, AllocateVI)

"""
Add in auxiliary currents
"""
function AddInAuxCurrents(dss::DSSContext, SType::Int)
    @checked Lib.YMatrix_AddInAuxCurrents(dss.ctx, SType)
end
AddInAuxCurrents(SType::Int) = AddInAuxCurrents(DSS_DEFAULT_CTX, SType)

"""
Get access to the internal Current pointer
"""
function IVector(dss::DSSContext)
    IvectorPtr = Ref{Ptr{Float64}}()
    @checked Lib.YMatrix_getIpointer(dss.ctx, IvectorPtr)
    return convert(Ptr{ComplexF64}, IvectorPtr[])
end
IVector() = IVector(DSS_DEFAULT_CTX)

"""
Get access to the internal Voltage pointer
"""
function VVector(dss::DSSContext)
    VvectorPtr = Ref{Ptr{Float64}}()
    @checked Lib.YMatrix_getVpointer(dss.ctx, VvectorPtr)
    return convert(Ptr{ComplexF64}, VvectorPtr[])
end
VVector() = VVector(DSS_DEFAULT_CTX)

"""
Get the data from the internal Current pointer
"""
function getI(dss::DSSContext)::Vector{ComplexF64}
    IvectorPtr = IVector()
    return unsafe_wrap(Array, IvectorPtr, @checked(Lib.Circuit_Get_NumNodes(dss.ctx)) + 1)
end
getI() = getI(DSS_DEFAULT_CTX)

"""
Get the data from the internal Voltage pointer
"""
function getV(dss::DSSContext)::Vector{ComplexF64}
    VvectorPtr = VVector()
    return unsafe_wrap(Array, VvectorPtr, @checked(Lib.Circuit_Get_NumNodes(dss.ctx)) + 1)
end
getV() = getV(DSS_DEFAULT_CTX)

"""
Solve System for a given V vector
    """
function SolveSystem(dss::DSSContext, NodeV::Vector{ComplexF64})::Int
    NodeV = pointer(NodeV)
    return @checked Lib.YMatrix_SolveSystem(dss.ctx, NodeV)
end
SolveSystem(NodeV::Vector{ComplexF64}) = SolveSystem(DSS_DEFAULT_CTX, NodeV)

"""
Solve System for the internal V vector
    """
function SolveSystem(dss::DSSContext)::Int
    return @checked Lib.YMatrix_SolveSystem(dss.ctx, C_NULL)
end
SolveSystem() = SolveSystem(DSS_DEFAULT_CTX)

"""
SystemY has changed

(Getter)
"""
function SystemYChanged(dss::DSSContext)::Bool
    return @checked(Lib.YMatrix_Get_SystemYChanged(dss.ctx)) != 0
end
SystemYChanged() = SystemYChanged(DSS_DEFAULT_CTX)

"""
SystemY has changed 

(Setter)
"""
function SystemYChanged(dss::DSSContext, Value::Bool)
    @checked Lib.YMatrix_Set_SystemYChanged(dss.ctx, Value ? 1 : 0)
end
SystemYChanged(Value::Bool) = SystemYChanged(DSS_DEFAULT_CTX, Value)

"""
Use auxiliary currents

(Getter)
"""
function UseAuxCurrents(dss::DSSContext)::Bool
    return @checked(Lib.YMatrix_Get_UseAuxCurrents(dss.ctx)) != 0
end
UseAuxCurrents() = UseAuxCurrents(DSS_DEFAULT_CTX)

"""
Use auxiliary currents

(Setter)
"""
function UseAuxCurrents(dss::DSSContext, Value::Bool)
    @checked Lib.YMatrix_Set_UseAuxCurrents(dss.ctx, Value ? 1 : 0)
end
UseAuxCurrents(Value::Bool) = UseAuxCurrents(DSS_DEFAULT_CTX, Value)

"""
Iteration

**(API Extension)**

(Getter)
"""
function Iteration(dss::DSSContext)::Int
    return @checked Lib.YMatrix_Get_Iteration(dss.ctx)
end
Iteration() = Iteration(DSS_DEFAULT_CTX)

"""
Iteration

**(API Extension)**

(Setter)
"""
function Iteration(dss::DSSContext, Value::Int)
    return @checked Lib.YMatrix_Set_Iteration(dss.ctx, Value)
end
Iteration(Value::Int) = Iteration(DSS_DEFAULT_CTX, Value)

"""
LoadsNeedUpdating

**(API Extension)**

(Getter)
"""
function LoadsNeedUpdating(dss::DSSContext)::Bool
    return (@checked Lib.YMatrix_Get_LoadsNeedUpdating(dss.ctx)) != 0
end
LoadsNeedUpdating() = LoadsNeedUpdating(DSS_DEFAULT_CTX)

"""
LoadsNeedUpdating

**(API Extension)**

(Setter)
"""
function LoadsNeedUpdating(dss::DSSContext, Value::Bool)
    return @checked Lib.YMatrix_Set_LoadsNeedUpdating(dss.ctx, Value)
end
LoadsNeedUpdating(Value::Bool) = LoadsNeedUpdating(DSS_DEFAULT_CTX, Value)

"""
SolutionInitialized

**(API Extension)**

(Getter)
"""
function SolutionInitialized(dss::DSSContext)::Bool
    return (@checked Lib.YMatrix_Get_SolutionInitialized(dss.ctx)) != 0
end
SolutionInitialized() = SolutionInitialized(DSS_DEFAULT_CTX)

"""
SolutionInitialized

**(API Extension)**

(Setter)
"""
function SolutionInitialized(dss::DSSContext, Value::Bool)
    return @checked Lib.YMatrix_Set_SolutionInitialized(dss.ctx, Value)
end
SolutionInitialized(Value::Bool) = SolutionInitialized(DSS_DEFAULT_CTX, Value)

"""
SolverOptions

**(API Extension)**

(Getter)
"""
function SolverOptions(dss::DSSContext)::Int
    return @checked Lib.YMatrix_Get_SolverOptions(dss.ctx)
end
SolverOptions() = SolverOptions(DSS_DEFAULT_CTX)

"""
SolverOptions

**(API Extension)**

(Setter)
"""
function SolverOptions(dss::DSSContext, Value::Int)
    return @checked Lib.YMatrix_Set_SolverOptions(dss.ctx, Value)
end
SolverOptions(Value::Int) = SolverOptions(DSS_DEFAULT_CTX, Value)

# """Handle **(API Extension)**"""
# function Handle()::UInt64
#     return @checked Lib.YMatrix_Get_Handle()
# end

"""
Update and return the convergence flag. Used for external solver loops.

**(API Extension)**
"""
function CheckConvergence(dss::DSSContext)::Bool
    return @checked Lib.YMatrix_CheckConvergence(dss.ctx)
end
CheckConvergence() = CheckConvergence(DSS_DEFAULT_CTX)

"""
SetGeneratordQdV

**(API Extension)**
"""
function SetGeneratordQdV(dss::DSSContext)
    @checked Lib.YMatrix_SetGeneratordQdV(dss.ctx)
end
SetGeneratordQdV() = SetGeneratordQdV(DSS_DEFAULT_CTX)

end
