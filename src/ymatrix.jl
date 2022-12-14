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
function getYsparse(factor::Bool = true)::SparseMatrixCSC{Complex{Float64},Int}
    nBus = Ref(UInt32(0))
    nNz = Ref(UInt32(0))

    ColPtr = Ref{Ptr{Int32}}(0)
    RowIdxPtr = Ref{Ptr{Int32}}(0)
    cValsPtr = Ref{Ptr{Cdouble}}(0)

    @checked Lib.YMatrix_GetCompressedYMatrix(
        C_NULL_CTX,
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

"""Zero Current Injections"""
function ZeroInjCurr()
    @checked Lib.YMatrix_ZeroInjCurr(C_NULL_CTX)
end

"""Get Source Current Injections"""
function GetSourceInjCurrents()
    @checked Lib.YMatrix_GetSourceInjCurrents(C_NULL_CTX)
end

"""Get PC Current Injections"""
function GetPCInjCurr()
    @checked Lib.YMatrix_GetPCInjCurr(C_NULL_CTX)
end

"""Build Y MatrixD"""
function BuildYMatrixD(BuildOps::Int, AllocateVI::Bool)
    @checked Lib.YMatrix_BuildYMatrixD(C_NULL_CTX, BuildOps, AllocateVI ? 1 : 0)
end

"""Add in auxiliary currents"""
function AddInAuxCurrents(SType::Int)
    @checked Lib.YMatrix_AddInAuxCurrents(C_NULL_CTX, SType)
end

"""Get access to the internal Current pointer"""
function IVector()
    IvectorPtr = Ref{Ptr{Float64}}()
    @checked Lib.YMatrix_getIpointer(C_NULL_CTX, IvectorPtr)
    return convert(Ptr{ComplexF64}, IvectorPtr[])
end

"""Get access to the internal Voltage pointer"""
function VVector()
    VvectorPtr = Ref{Ptr{Float64}}()
    @checked Lib.YMatrix_getVpointer(C_NULL_CTX, VvectorPtr)
    return convert(Ptr{ComplexF64}, VvectorPtr[])
end

"""Get the data from the internal Current pointer"""
function getI()::Vector{ComplexF64}
    IvectorPtr = IVector()
    return unsafe_wrap(Array, IvectorPtr, @checked(Lib.Circuit_Get_NumNodes(C_NULL_CTX)) + 1)
end

"""Get the data from the internal Voltage pointer"""
function getV()::Vector{ComplexF64}
    VvectorPtr = VVector()
    return unsafe_wrap(Array, VvectorPtr, @checked(Lib.Circuit_Get_NumNodes(C_NULL_CTX)) + 1)
end

"""Solve System for a given V vector"""
function SolveSystem(NodeV::Vector{ComplexF64})::Int
    NodeV = pointer(NodeV)
    return @checked Lib.YMatrix_SolveSystem(C_NULL_CTX, NodeV)
end

"""Solve System for the internal V vector"""
function SolveSystem()::Int
    return @checked Lib.YMatrix_SolveSystem(C_NULL_CTX, C_NULL)
end

"""SystemY has changed (Getter)"""
function SystemYChanged()::Bool
    return @checked(Lib.YMatrix_Get_SystemYChanged(C_NULL_CTX)) != 0
end

"""SystemY has changed (Setter)"""
function SystemYChanged(Value::Bool)
    @checked Lib.YMatrix_Set_SystemYChanged(C_NULL_CTX, Value ? 1 : 0)
end

"""Use auxiliary currents (Getter)"""
function UseAuxCurrents()::Bool
    return @checked(Lib.YMatrix_Get_UseAuxCurrents(C_NULL_CTX)) != 0
end

"""Use auxiliary currents (Setter)"""
function UseAuxCurrents(Value::Bool)
    @checked Lib.YMatrix_Set_UseAuxCurrents(C_NULL_CTX, Value ? 1 : 0)
end

"""Iteration (Getter) (API Extension)"""
function Iteration()::Int
    return @checked Lib.YMatrix_Get_Iteration(C_NULL_CTX)
end

"""Iteration (Setter) (API Extension)"""
function Iteration(Value::Int)
    return @checked Lib.YMatrix_Set_Iteration(C_NULL_CTX, Value)
end

"""LoadsNeedUpdating (Getter) (API Extension)"""
function LoadsNeedUpdating()::Bool
    return (@checked Lib.YMatrix_Get_LoadsNeedUpdating(C_NULL_CTX)) != 0
end

"""LoadsNeedUpdating (Setter) (API Extension)"""
function LoadsNeedUpdating(Value::Bool)
    return @checked Lib.YMatrix_Set_LoadsNeedUpdating(C_NULL_CTX, Value)
end

"""SolutionInitialized (Getter) (API Extension)"""
function SolutionInitialized()::Bool
    return (@checked Lib.YMatrix_Get_SolutionInitialized(C_NULL_CTX)) != 0
end

"""SolutionInitialized (Setter) (API Extension)"""
function SolutionInitialized(Value::Bool)
    return @checked Lib.YMatrix_Set_SolutionInitialized(C_NULL_CTX, Value)
end

"""SolverOptions (Getter) (API Extension)"""
function SolverOptions()::Int
    return @checked Lib.YMatrix_Get_SolverOptions(C_NULL_CTX)
end

"""SolverOptions (Setter) (API Extension)"""
function SolverOptions(Value::Int)
    return @checked Lib.YMatrix_Set_SolverOptions(C_NULL_CTX, Value)
end

# """Handle (API Extension)"""
# function Handle()::UInt64
#     return @checked Lib.YMatrix_Get_Handle(C_NULL_CTX)
# end

"""Update and return the convergence flag. Used for external solver loops.

(API Extension)"""
function CheckConvergence()::Bool
    return @checked Lib.YMatrix_CheckConvergence(C_NULL_CTX)
end

"""SetGeneratordQdV (API Extension)"""
function SetGeneratordQdV()
    @checked Lib.YMatrix_SetGeneratordQdV(C_NULL_CTX)
end

end
