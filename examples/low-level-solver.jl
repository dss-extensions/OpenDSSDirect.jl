## This example shows how to define custom solvers using the low-level
## interface in DSSCore.

using OpenDSSDirect

"""
Equivalent to `DSS.solution(:SolveNoControl)` or `ActiveCircuit.Solution.DoNormalSolution` in Pascal.
"""
function normalsolution()
    nodeVbase = abs(DSS.circuit(:AllBusVolts)) ./ DSS.circuit(:AllBusMagPu)   # KLUDGE!
    WHOLEMATRIX = 2
    NORMALSOLVE = 0
    nodeV = DSSCore.getV()
    lastVmag = zeros(length(nodeV))
    for i in 1:100
        DSSCore.ZeroInjCurr()
        DSSCore.GetSourceInjCurrents()  # sources
        DSSCore.GetPCInjCurr()  # Get the injection currents from all the power conversion devices and feeders

        # The above call could change the primitive Y matrix, so have to check
        if DSSCore.SystemYChanged()
            DSSCore.BuildYMatrixD(WHOLEMATRIX, false) 
        end

        if DSSCore.UseAuxCurrents()
            DSSCore.AddInAuxCurrents(NORMALSOLVE)
        end
        DSSCore.SolveSystem(nodeV)
        if converged(nodeV, lastVmag, nodeVbase) && i > 1
            return i
        end
    end
    return i
end

"""
Alternative `normalsolution` using Julia's built-in sparse solver.
Equivalent to `DSS.solution(:SolveNoControl)` or `ActiveCircuit.Solution.DoNormalSolution` in Pascal.
"""
function normalsolution_alt()
    nodeVbase = abs(DSS.circuit(:AllBusVolts)) ./ DSS.circuit(:AllBusMagPu)   # KLUDGE!
    WHOLEMATRIX = 2
    NORMALSOLVE = 0
    nodeV = DSSCore.getV()
    nodeI = DSSCore.getI()
    Y = DSSCore.getYsparse()
    lastVmag = zeros(length(nodeV))
    for i in 1:100
        DSSCore.ZeroInjCurr()
        DSSCore.GetSourceInjCurrents()  # sources
        DSSCore.GetPCInjCurr()  # Get the injection currents from all the power conversion devices and feeders

        # The above call could change the primitive Y matrix, so have to check
        if DSSCore.SystemYChanged()
            DSSCore.BuildYMatrixD(WHOLEMATRIX, false) 
            Y = DSSCore.getYsparse()
        end

        if DSSCore.UseAuxCurrents()
            DSSCore.AddInAuxCurrents(NORMALSOLVE)
        end
        nodeV[2:end] = Y \ nodeI[2:end]      # Use Julia's built-in solver
        if converged(nodeV, lastVmag, nodeVbase) && i > 1
            return i
        end
    end
    return i
end

"""
Equivalent to `ActiveCircuit.Solution.SolveYDirect` in Pascal.
"""
function solveYdirect()
    DSSCore.ZeroInjCurr()
    DSSCore.GetSourceInjCurrents()  # sources
    nodeV = DSSCore.getV()
    DSSCore.SolveSystem(nodeV)
end

"""
Equivalent to `ActiveCircuit.Solution.SolveSnap` in Pascal (the default solve mode).
"""
function solvesnap()
    DSS.solution(:InitSnap)
    solveYdirect()
    while true
        ## Increment the ControlIteration:
        i = DSS.solution(Val{:ControlIterations}) + 1
        DSS.solution(Val{:ControlIterations}, i) 
        result = normalsolution()
        DSS.solution(Val{:CheckControls})
        if DSS.solution(Val{:ControlActionsDone}) == 1
            return i
        end
        if i > 10
            return -1
        end
    end
    return i
end

"""
Check for convervence, and set the DSS status variable `Converged`.
"""
function converged(nodeV, lastVmag, nodeVbase, tolerance = 0.0001)
    maxerr = 0.0
    for i in 2:length(nodeV)
        Vmag = abs(nodeV[i])
        if nodeVbase[i-1] > 0.0     # if base specified, use it; otherwise go on present magnitude
            err = abs(Vmag - lastVmag[i]) / nodeVbase[i-1]
        elseif Vmag != 0.0
            err = abs(1 - lastVmag[i]/Vmag)
        else
            err = 0.0
        end
        lastVmag[i] = Vmag
        if err > maxerr
            maxerr = err 
        end
    end
    DSS.solution(Val{:Converged}, maxerr < tolerance)
    return maxerr < tolerance
end



init8500() = dss("""
    clear
    compile $(Pkg.dir())/OpenDSSDirect/examples/8500-Node/Master.dss
""")

function testnormalsolution()
    init8500()
    DSS.solution(:SolveNoControl)
    v1 = DSS.circuit(:AllBusVMag)
    init8500()
    i = normalsolution()
    v2 = DSS.circuit(:AllBusVMag)
    init8500()
    i = normalsolution_alt()
    v3 = DSS.circuit(:AllBusVMag)
    (v1, v2, v3)
end

function testsnap()
    init8500()
    DSS.solution(:Solve)
    v1 = DSS.circuit(:AllBusVMag)
    init8500()
    i = solvesnap()
    v2 = DSS.circuit(:AllBusVMag)
    (v1, v2, i)
end
