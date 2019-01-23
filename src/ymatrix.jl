module YMatrix

    using ..lib
    using ..utils

    """Return as (data, indices, indptr) that can fed into scipy.sparse.csc_matrix"""
    function getYsparse(factor=True)
        # TODO: implement getysparse
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
        # TODO: implement IVector()
    end

    """Get access to the internal Voltage pointer"""
    function VVector()
        # TODO: implement VVector()
    end

    """Get the data from the internal Current pointer"""
    function getI()
        # TODO: implement getI()
    end

    """Get the data from the internal Voltage pointer"""
    function getV()
        # TODO: implement getV()
    end

    function SolveSystem(NodeV)
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

