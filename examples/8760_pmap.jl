## At the command line, use `julia -p 4` to add 4 worker processes.
##

using OpenDSSDirect, Distributed

# Prep stuff
@everywhere begin
    N = nprocs() - 1
    using OpenDSSDirect
    numhours = 8760 ÷ N
    filename = joinpath(@__DIR__, "ckt5", "Master_ckt5.dss")
    dss("""
        clear
        compile $filename
        Solve  ! This executes a snaphot power flow solution of the circuit
        set mode=yearly number=$numhours
    """)
end

@everywhere function runpart(i)
    if i == N   # last one may not have the same number of hours
        dss("set number=$(8760 - (N-1) * numhours)")
    end
    dss(""" 
        set casename=ckt5_$i
        set demand=true
        set DIVerbose=true
        set voltexceptionreport = true
        set Year=1        ! This statement resets all Meters
        set hour=$((i-1) * numhours)
        solve
        closeDI
    """)
end



@time res = pmap(runpart, 1:N)

