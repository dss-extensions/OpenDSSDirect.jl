## This example shows a custom 8760-hour run. It adjusts all loads at each time step

using OpenDSSDirect

basepath = joinpath(@__DIR__, "ckt5")
include(joinpath(basepath, "../loadshape.jl"))
filename = joinpath(basepath, "Master_ckt5.dss")

@time dss("""
    clear
    compile $filename

    Solve  ! This executes a snaphot power flow solution of the circuit
""")

function scaleloads(k, basekw, basekvar)
    loadnumber = Loads.First()
    for i in 1:length(basekw)
        Loads.kW(  k * basekw[i])
        Loads.kvar(k * basekvar[i])
        loadnumber = Loads.Next()
    end
end
function run_loads(loadshape)

    nloads = Loads.Count()
    basekw = Array{Float64}(undef, nloads)
    basekvar = Array{Float64}(undef, nloads)
    loadnumber = Loads.First()
    for i in 1:length(basekw)
        basekw[i]   = Loads.kW()
        basekvar[i] = Loads.kvar()
        loadnumber = Loads.Next()
    end
    n = length(loadshape)
    result = Array{Int}(undef, n)
    for i in 1:n
        scaleloads(loadshape[i], basekw, basekvar)
        Solution.Solve()
        result[i] = Solution.Iterations()
    end
    return result
end

@time x  = run_loads(loadshape)
# @time xs = run_loads(sort(loadshape))

nothing
