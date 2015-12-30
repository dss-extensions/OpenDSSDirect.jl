N = 2
addprocs(N - 1)

# Prep stuff
@everywhere begin
    N = 2
    using OpenDSSDirect
    numhours = 8760 ÷ N
    filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "ckt5", "Master_ckt5.dss")
    dss("""
        clear
        compile $filename

        New monitor.ckt5_totalizedmonitor Transformer.MDV_SUB_1 term=2 mode=1 
        New monitor.ckt5_mon element=Line.MDV201_connector terminal=1 mode=0 Residual=yes
        New monitor.ckt5_mon_p element=Line.MDV201_connector terminal=1 mode=1 Ppolar=No

        Solve  ! This executes a snaphot power flow solution of the circuit

        set mode=yearly number=$numhours
        set demand=true
        set DIVerbose=true
        set voltexceptionreport = true
    """)
end

# Split up an 8760 run, and run it on the worker processes
@time for i in 1:N-1
    @spawn dss(""" 
        set casename=ckt5_$i
        set Year=1        ! This statement resets all meters
        set hour=$((i-1) * numhours)
        solve
        closeDI
    """)
end

# The final run is on the main process
@time dss(""" 
    set casename=ckt5_$N
    set Year=1        ! This statement resets all meters
    set number=$(8760 - (N-1) * numhours)
    set hour=$((N-1) * numhours)
    solve
    closeDI
""")

