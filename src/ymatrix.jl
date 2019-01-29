module YMatrix

    using ..lib
    using ..utils

    """Return as (data, indices, indptr) that can fed into scipy.sparse.csc_matrix"""
    function getYsparse(factor=true)
        nBus = Ref(UInt32(0))
        nNz = Ref(UInt32(0))

        ColPtr = Ref{Ptr{Int32}}(0)
        RowIdxPtr = Ref{Ptr{Int32}}(0)
        cValsPtr = Ref{Ptr{Cdouble}}(0)

        lib.YMatrix_GetCompressedYMatrix(factor ? 1 : 0, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)

        if Int(nBus[]) == 0 || Int(nNz[]) == 0
            res = nothing
        else
            # return as (data, indices, indptr) that can fed into scipy.sparse.csc_matrix
            data = Array(reinterpret(ComplexF64, unsafe_wrap(Array, cValsPtr[], Int(nNz[]) * 2) |> copy))
            indices = unsafe_wrap(Array, RowIdxPtr[], Int(nNz[])) |> copy
            indptr = unsafe_wrap(Array, ColPtr[], (Int(nBus[]) + 1)) |> copy
            res = (data, indices, indptr)
        end
        lib.DSS_Dispose_PInteger(ColPtr)
        lib.DSS_Dispose_PInteger(RowIdxPtr)
        lib.DSS_Dispose_PDouble(cValsPtr)

        return res
    end

    function ZeroInjCurr()
        lib.YMatrix_ZeroInjCurr()
    end

    function GetSourceInjCurrents()
        lib.YMatrix_GetSourceInjCurrents()
    end

    function GetPCInjCurr()
        lib.YMatrix_GetPCInjCurr()
    end

    function BuildYMatrixD(BuildOps, AllocateVI)
        lib.YMatrix_BuildYMatrixD(BuildOps, AllocateVI)
    end

    function AddInAuxCurrents(SType)
        lib.YMatrix_AddInAuxCurrents(SType)
    end

    """Get access to the internal Current pointer"""
    function IVector()
        IvectorPtr = Ref{Ptr{Cdouble}}()
        lib.YMatrix_getIpointer(IvectorPtr)
        return IvectorPtr[]
    end

    """Get access to the internal Voltage pointer"""
    function VVector()
        VvectorPtr = Ref{Ptr{Cdouble}}()
        lib.YMatrix_getVpointer(VvectorPtr)
    end

    """Get the data from the internal Current pointer"""
    function getI()
        IvectorPtr = IVector()
        return unsafe_wrap(Array, IvectorPtr, (lib.Circuit_Get_NumNodes() + 1) * 2)
    end

    """Get the data from the internal Voltage pointer"""
    function getV()
        VvectorPtr = VVector()
        return unsafe_wrap(Array, VvectorPtr[], (lib.Circuit_Get_NumNodes() + 1) * 2)
    end

    function SolveSystem(NodeV)
        @warn "Not implemented. Please contact the developer"
        # TODO: implement SolveSystem
    end

    function SystemYChanged()
        return lib.YMatrix_Get_SystemYChanged()
    end

    function SystemYChanged(Value)
        lib.YMatrix_Set_SystemYChanged(Value)
    end

    function UseAuxCurrents()
        return lib.YMatrix_Get_UseAuxCurrents()
    end

    function UseAuxCurrents(Value)
        lib.YMatrix_Set_UseAuxCurrents(Value)
    end

end

