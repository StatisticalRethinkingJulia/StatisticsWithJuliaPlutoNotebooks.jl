### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, DataFrames
	Random.seed!(1)
end;

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.12"

# ╔═╡ ab1ec376-1f63-11eb-3eb3-d7f282f2ad65
begin
	N = 10^5
	prob1 = 0.7
	eps0, eps1 = 0.1, 0.05
end

# ╔═╡ faad978c-1f63-11eb-189c-bf9767f58cae
flipWithProb(bit,prob) = rand() < prob ? xor(bit,1) : bit

# ╔═╡ faade49e-1f63-11eb-3c17-5f937cb796ca
begin
	TxData = rand(N) .< prob1
	RxData = [x == 0 ? flipWithProb(x,eps0) : flipWithProb(x,eps1) for x in TxData]

	numTx1 = 0
	totalRx1 = 0
	for i in 1:N
	   if RxData[i] == 1
			global totalRx1 += 1
			global numTx1 += TxData[i]
		end
	end
end

# ╔═╡ faae7008-1f63-11eb-2811-914bae0ac42d
monteCarlo = numTx1/totalRx1

# ╔═╡ fabb6902-1f63-11eb-1a72-c3d127ec17c2
analytic = ((1-eps1)*0.7)/((1-eps1)*0.7+0.3*eps0)

# ╔═╡ fabbef8a-1f63-11eb-2122-3791b9449669
Text("Monte Carlo: $monteCarlo Analytic: $analytic")

# ╔═╡ ea086874-1eeb-11eb-2cb0-4186697d4294
md"## End of listing 2.12"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═ab1ec376-1f63-11eb-3eb3-d7f282f2ad65
# ╠═faad978c-1f63-11eb-189c-bf9767f58cae
# ╠═faade49e-1f63-11eb-3c17-5f937cb796ca
# ╠═faae7008-1f63-11eb-2811-914bae0ac42d
# ╠═fabb6902-1f63-11eb-1a72-c3d127ec17c2
# ╠═fabbef8a-1f63-11eb-2122-3791b9449669
# ╟─ea086874-1eeb-11eb-2cb0-4186697d4294
