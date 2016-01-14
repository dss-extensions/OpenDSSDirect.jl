## At the command line, use `julia -p 3` to add 3 worker processes for a total of 4.
##

using OpenDSSDirect.DSS

# Prep stuff
@everywhere begin
    N = nprocs() - 1
    using OpenDSSDirect.DSS
    numhours = 8760 ÷ N
    filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "ckt5", "Master_ckt5.dss")
    dss("""
        clear
        compile $filename

        Solve  ! This executes a snaphot power flow solution of the circuit
    """)

function runpart(i)
    if i == N   # last one may not have the same number of hours
        dss("set number=$(8760 - (N-1) * numhours)")
    end
    dss(""" 
        set casename=ckt5_$i
        set mode=yearly number=$numhours
        set demand=true
        set DIVerbose=true
        set voltexceptionreport = true
        set Year=1        ! This statement resets all meters
        set hour=$((i-1) * numhours)
        solve
        closeDI
    """)
end

end

@time res = pmap(runpart, 1:N)

