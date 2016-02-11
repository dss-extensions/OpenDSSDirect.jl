include("init.jl")
init8500()


@testset "executive" begin 

@test executive(:NumCommands) == 104
@test executive(:NumOptions) == 105
@test executive(:Command, "2") == "Edit"
@test executive(:Option, "2") == "element"
@test executive(:CommandHelp, "2")[1:7] == "Edit an"
@test executive(:OptionHelp, "2")[1:8] == "Sets the"
@test executive(:OptionValue, "2") == "vreg4_c"

end # testset

