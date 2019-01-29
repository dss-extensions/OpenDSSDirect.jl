
init8500()


@testset "Executive" begin

@test Executive.NumCommands() == 107
@test Executive.NumOptions() == 111
@test Executive.Command(2) == "Edit"
@test Executive.Option(2) == "element"
@test Executive.CommandHelp(2)[1:7] == "Edit an"
@test Executive.OptionHelp(2)[1:8] == "Sets the"
@test Executive.OptionValue(2) == "vreg4_c"

end # testset
