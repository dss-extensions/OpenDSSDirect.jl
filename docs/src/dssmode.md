
# DSS REPL Mode

OpenDSSDirect also includes a custom REPL mode for entering OpenDSS commands directly.
This is similar to the Help (`?`) and Shell (`;`) modes.
Use the right parenthesis (`)`) to enter DSS mode.
Hit backspace on a blank line to exit. Here is an example:

```julia
julia> using OpenDSSDirect

DSS> compile C:\\portableapps\\home\\.julia\\v0.7\\OpenDSSDirect\\examples\\8500-Node\\Master.dss

DSS> solve

DSS> summary
Status = NOT Solved
Solution Mode = Snap
Number = 100
Load Mult = 1.000
Devices = 6103
Buses = 4876
Nodes = 8541
Control Mode =STATIC
Total Iterations = 23
Control Iterations = 2
Max Sol Iter = 15

 - Circuit Summary -

Year = 0
Hour = 0
Max pu. voltage = 1.0991
Min pu. voltage = 0.91736
Total Active Power:   12.0047 MW
Total Reactive Power: 1.47117 Mvar
Total Active Losses:   1.21824 MW, (10.15 %)
Total Reactive Losses: 2.79839 Mvar
Frequency = 60 Hz
Mode = Snap
Control Mode = STATIC
Load Model = PowerFlow
```

The DSS mode also has help. Hit `?` at the `DSS>` prompt, and enter options or commands you want help on.

```julia
DSS> clear

DSS help?> clear
Clear all circuits currently in memory.

DSS help?> solve
Perform the solution of the present solution mode. You can set any option that you can set with the Set command (see Set). The Solve command is virtually synonymous with the Set command except that a solution is performed after the options are processed.
```

