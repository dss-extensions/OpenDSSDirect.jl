println("nthreads:", Threads.nthreads())

@testset "ctx_threads" begin

master_filename = normpath(joinpath(dirname(@__FILE__), "../examples/ckt5/Master_ckt5.dss"))

Basic.AllowChangeDir(false)

engines = [Basic.NewContext() for _=1:5]

losses = zeros(5)
mults = zeros(5)
@time Threads.@threads for idx in 1:length(engines)
    e = engines[idx]
    dss(e, "redirect '$master_filename'")
    Solution.LoadMult(e, 1.0 + 0.5 * idx / length(engines))
    Solution.Mode(e, OpenDSSDirect.Lib.SolveModes_Daily)
    Solution.Number(e, 1)
    local this_losses = 0;
    for n in 1:100
        Solution.Solve(e)
        this_losses += real(Circuit.Losses(e))
    end
    mults[idx] = Solution.LoadMult(e)
    losses[idx] = this_losses
end

losses_main = zeros(5)
mults_main = zeros(5)
@time for idx in 1:length(engines)
    dss("redirect '$master_filename'")
    Solution.LoadMult(1.0 + 0.5 * idx / length(engines))
    Solution.Mode(OpenDSSDirect.Lib.SolveModes_Daily)
    Solution.Number(1)
    local this_losses = 0;
    for n in 1:100
        Solution.Solve()
        this_losses += real(Circuit.Losses())
    end
    mults_main[idx] = Solution.LoadMult()
    losses_main[idx] = this_losses
end

# Must match exactly!
@test mults_main == mults
@test losses_main == losses

end