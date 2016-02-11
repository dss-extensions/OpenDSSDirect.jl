include("init.jl")
init8500()


@testset "parser" begin 

@show parser(:IntValue)
@show parser(:ResetDelimiters)
@show parser(:AutoIncrement)
@show parser(:AutoIncrement, parser(:AutoIncrement))
@show parser(:DblValue)
@show parser(:CmdString)
@show parser(:CmdString, parser(:CmdString))
@show parser(:NextParam)
@show parser(:StrValue)
@show parser(:WhiteSpace)
@show parser(:WhiteSpace, parser(:WhiteSpace))
@show parser(:BeginQuote)
@show parser(:BeginQuote, parser(:BeginQuote))
@show parser(:EndQuote)
@show parser(:EndQuote, parser(:EndQuote))
@show parser(:Delimiters)
@show parser(:Delimiters, parser(:Delimiters))
@show parser(:Vector)
@show parser(:Matrix)
@show parser(:SymMatrix)

end # testset

