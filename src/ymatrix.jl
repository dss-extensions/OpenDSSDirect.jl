module YMatrix

    using ..Lib
    using ..Utils
    using SparseArrays

    """Return as (data, indices, indptr) that can fed into scipy.sparse.csc_matrix"""
    function getYsparse(factor=true)::SparseArrays.SparseMatrixCSC{Complex{Float64},Int64}
        nBus = Ref(UInt32(0))
        nNz = Ref(UInt32(0))

        ColPtr = Ref{Ptr{Int32}}(0)
        RowIdxPtr = Ref{Ptr{Int32}}(0)
        cValsPtr = Ref{Ptr{Cdouble}}(0)

        Lib.YMatrix_GetCompressedYMatrix(factor ? 1 : 0, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)

        if Int(nBus[]) == 0 || Int(nNz[]) == 0
            res = nothing
        else
            # return as (data, indices, indptr) that can fed into scipy.sparse.csc_matrix
            data = Array(reinterpret(ComplexF64, unsafe_wrap(Array, cValsPtr[], Int(nNz[]) * 2) |> copy))
            indices = unsafe_wrap(Array, RowIdxPtr[], Int(nNz[])) |> copy
            indptr = unsafe_wrap(Array, ColPtr[], (Int(nBus[]) + 1)) |> copy
            res = SparseMatrixCSC(nBus[], nBus[], indptr .+ 1, indices .+ 1, data)
        end
        Lib.DSS_Dispose_PInteger(ColPtr)
        Lib.DSS_Dispose_PInteger(RowIdxPtr)
        Lib.DSS_Dispose_PDouble(cValsPtr)

        return res
    end

    function ZeroInjCurr()
        Lib.YMatrix_ZeroInjCurr()
    end

    function GetSourceInjCurrents()
        Lib.YMatrix_GetSourceInjCurrents()
    end

    function GetPCInjCurr()
        Lib.YMatrix_GetPCInjCurr()
    end

    function BuildYMatrixD(BuildOps::Int, AllocateVI::Bool)
        Lib.YMatrix_BuildYMatrixD(BuildOps, AllocateVI ? 1 : 0)
    end

    function AddInAuxCurrents(SType::Int)
        Lib.YMatrix_AddInAuxCurrents(SType)
    end

    """Get access to the internal Current pointer"""
    function IVector()
        IvectorPtr = Ref{Ptr{Float64}}()
        Lib.YMatrix_getIpointer(IvectorPtr)
        return convert(Ptr{ComplexF64}, IvectorPtr[])
    end

    """Get access to the internal Voltage pointer"""
    function VVector()
        VvectorPtr = Ref{Ptr{Float64}}()
        Lib.YMatrix_getVpointer(VvectorPtr)
        return convert(Ptr{ComplexF64}, VvectorPtr[])
    end

    """Get the data from the internal Current pointer"""
    function getI()::Vector{ComplexF64}
        IvectorPtr = IVector()
        return unsafe_wrap(Array, IvectorPtr, Lib.Circuit_Get_NumNodes() + 1)
    end

    """Get the data from the internal Voltage pointer"""
    function getV()::Vector{ComplexF64}
        VvectorPtr = VVector()
        return unsafe_wrap(Array, VvectorPtr, Lib.Circuit_Get_NumNodes() + 1)
    end

    function SolveSystem(NodeV)::Int
        NodeV = Ref{Ptr{Cdouble}}(pointer(NodeV))
        return Lib.YMatrix_SolveSystem(NodeV)
    end

    function SystemYChanged()::Bool
        return Lib.YMatrix_Get_SystemYChanged() != 0
    end

    function SystemYChanged(Value::Bool)
        Lib.YMatrix_Set_SystemYChanged(Value ? 1 : 0)
    end

    function UseAuxCurrents()::Bool
        return Lib.YMatrix_Get_UseAuxCurrents() != 0
    end

    function UseAuxCurrents(Value::Bool)
        Lib.YMatrix_Set_UseAuxCurrents(Value ? 1 : 0)
    end

end

