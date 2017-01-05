
init8500()


@testset "Parser" begin 

@show Parser.IntValue()
@show Parser.ResetDelimiters()
@show Parser.AutoIncrement()
@show Parser.AutoIncrement(Parser.AutoIncrement())
@show Parser.DblValue()
@show Parser.CmdString()
@show Parser.CmdString(Parser.CmdString())
@show Parser.NextParam()
@show Parser.StrValue()
@show Parser.WhiteSpace()
@show Parser.WhiteSpace(Parser.WhiteSpace())
@show Parser.BeginQuote()
@show Parser.BeginQuote(Parser.BeginQuote())
@show Parser.EndQuote()
@show Parser.EndQuote(Parser.EndQuote())
@show Parser.Delimiters()
@show Parser.Delimiters(Parser.Delimiters())
@show Parser.Vector()
@show Parser.Matrix()
@show Parser.SymMatrix()

end # testset

