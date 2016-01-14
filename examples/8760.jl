using OpenDSSDirect

filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "ckt5", "Master_ckt5.dss")

@time dss("""
    clear
    compile $filename

    Solve  ! This executes a snaphot power flow solution of the circuit

    set mode=yearly
    set demand=true
    set DIVerbose=true
    set voltexceptionreport = true
    set casename=ckt5
    set Year=1        ! This statement resets all meters
    solve
    closeDI
""")

