## This example shows a custom 8760-hour run. It adjusts all loads at each time step
using OpenDSSDirect, Distributed

@everywhere begin
    using OpenDSSDirect

    basepath = joinpath(@__DIR__, "ckt5")
    include(joinpath(basepath, "../loadshape.jl"))
    filename = joinpath(basepath, "Master_ckt5.dss")

    dss("""
        clear
        compile $filename
        Solve  ! This executes a snaphot power flow solution of the circuit
    """)
    const nloads = Loads.Count()
    const basekw = Array{Float64}(undef, nloads)
    const basekvar = Array{Float64}(undef, nloads)
    function init()
        loadnumber = Loads.First()
        for i in 1:length(basekw)
            basekw[i]   = Loads.kW()
            basekvar[i] = Loads.kvar()
            loadnumber = Loads.Next()
        end
    end
    init()
    function scaleloads(k)
        loadnumber = Loads.First()
        for i in 1:length(basekw)
            Loads.kW(k * basekw[i])
            Loads.kvar(k * basekvar[i])
            loadnumber = Loads.Next()
        end
    end
    function run_loads(idx)
        println(idx)
        result = Array{Complex{Float64}}(undef, length(idx))
        for i in 1:length(idx)
            scaleloads(loadshape[idx[i]]) 
            Solution.Solve()
            result[i] = Circuit.TotalPower()
        end
        result
    end

    N = nprocs() - 1
    if N == 0
        N = 1
    end
    n = length(loadshape)
    numhours = 8760 ÷ N

end # @everywhere

@time res = pmap(run_loads, 
                 [(1 + (i-1)*numhours) : (i*numhours) for i in 1:N])
