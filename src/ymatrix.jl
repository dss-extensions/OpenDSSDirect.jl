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
    @checked Lib.YMatrix_ZeroInjCurr()
end

"""Get Source Current Injections"""
function GetSourceInjCurrents()
    @checked Lib.YMatrix_GetSourceInjCurrents()
end

"""Get PC Current Injections"""
function GetPCInjCurr()
    @checked Lib.YMatrix_GetPCInjCurr()
end

"""Build Y MatrixD"""
function BuildYMatrixD(BuildOps::Int, AllocateVI::Bool)
    @checked Lib.YMatrix_BuildYMatrixD(BuildOps, AllocateVI ? 1 : 0)
end

"""Add in auxiliary currents"""
function AddInAuxCurrents(SType::Int)
    @checked Lib.YMatrix_AddInAuxCurrents(SType)
end

"""Get access to the internal Current pointer"""
function IVector()
    IvectorPtr = Ref{Ptr{Float64}}()
    @checked Lib.YMatrix_getIpointer(IvectorPtr)
    return convert(Ptr{ComplexF64}, IvectorPtr[])
end

"""Get access to the internal Voltage pointer"""
function VVector()
    VvectorPtr = Ref{Ptr{Float64}}()
    @checked Lib.YMatrix_getVpointer(VvectorPtr)
    return convert(Ptr{ComplexF64}, VvectorPtr[])
end

"""Get the data from the internal Current pointer"""
function getI()::Vector{ComplexF64}
    IvectorPtr = IVector()
    return unsafe_wrap(Array, IvectorPtr, @checked(Lib.Circuit_Get_NumNodes()) + 1)
end

"""Get the data from the internal Voltage pointer"""
function getV()::Vector{ComplexF64}
    VvectorPtr = VVector()
    return unsafe_wrap(Array, VvectorPtr, @checked(Lib.Circuit_Get_NumNodes()) + 1)
end

"""Solve System for a given V vector"""
function SolveSystem(NodeV::Vector{ComplexF64})::Int
    NodeV = pointer(NodeV)
    return @checked Lib.YMatrix_SolveSystem(NodeV)
end

"""Solve System for the internal V vector"""
function SolveSystem()::Int
    return @checked Lib.YMatrix_SolveSystem(C_NULL)
end

"""SystemY has changed (Getter)"""
function SystemYChanged()::Bool
    return @checked(Lib.YMatrix_Get_SystemYChanged()) != 0
end

"""SystemY has changed (Setter)"""
function SystemYChanged(Value::Bool)
    @checked Lib.YMatrix_Set_SystemYChanged(Value ? 1 : 0)
end

"""Use auxiliary currents (Getter)"""
function UseAuxCurrents()::Bool
    return @checked(Lib.YMatrix_Get_UseAuxCurrents()) != 0
end

"""Use auxiliary currents (Setter)"""
function UseAuxCurrents(Value::Bool)
    @checked Lib.YMatrix_Set_UseAuxCurrents(Value ? 1 : 0)
end

end
