using OpenDSSDirect

filename = joinpath(@__DIR__, "ckt5", "Master_ckt5.dss")

@time dss("""
    clear
    compile $filename

    Solve  ! This executes a snaphot power flow solution of the circuit

    set mode=yearly
    set demand=true
    set DIVerbose=true
    set voltexceptionreport = true
    set Year=1        ! This statement resets all Meters
    solve
    closeDI
""")

nothing

