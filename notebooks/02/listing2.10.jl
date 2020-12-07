### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, DataFrames
	Random.seed!(1)
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.10"

# ╔═╡ ce43a8fa-1eee-11eb-326b-e777b76f16c6
begin
	numbers = 10:25
	N = 10^7
end;

# ╔═╡ 356e29c2-1eef-11eb-2488-6d87c9d7c26f
begin
	firstDigit(x) = Int(floor(x/10))
	secondDigit(x) = x%10

	numThirteen, numFirstIsOne, numSecondIsThree = 0, 0, 0

	for _ in 1:N
		X = rand(numbers)
		global numThirteen += X == 13 
		global numFirstIsOne += firstDigit(X) == 1 
		global numSecondIsThree += secondDigit(X) == 3
	end
end

# ╔═╡ 356e6696-1eef-11eb-0386-8fd3dfe0c86e
probThirteen, probFirstIsOne, probSecondIsThree =
    (numThirteen,numFirstIsOne,numSecondIsThree)./N

# ╔═╡ 356ee814-1eef-11eb-3bbe-458402f62f3c
("P(13) = ", round(probThirteen, digits=4),
	"P(1_) = ",round(probFirstIsOne, digits=4),
    "P(_3) = ", round(probSecondIsThree, digits=4),
    "P(1_)*P(_3) = ",round(probFirstIsOne*probSecondIsThree, digits=4))

# ╔═╡ ea086874-1eeb-11eb-2cb0-4186697d4294
md"## End of listing 2.10"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═ce43a8fa-1eee-11eb-326b-e777b76f16c6
# ╠═356e29c2-1eef-11eb-2488-6d87c9d7c26f
# ╠═356e6696-1eef-11eb-0386-8fd3dfe0c86e
# ╠═356ee814-1eef-11eb-3bbe-458402f62f3c
# ╟─ea086874-1eeb-11eb-2cb0-4186697d4294
