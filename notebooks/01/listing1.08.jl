### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ f29303e2-1d66-11eb-3313-f335871e9674
using Pkg, DrWatson

# ╔═╡ f2935b8a-1d66-11eb-02e8-3dacec840928
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using LinearAlgebra, StatsBase, DataFrames
end

# ╔═╡ 7877839e-1d66-11eb-0a3c-5953d222ccbc
md"## Listing 1.8"

# ╔═╡ f293d704-1d66-11eb-36d8-4bb2f8dff940
md"##### Transition probability matrix."

# ╔═╡ f2a01cf8-1d66-11eb-3573-d91ed64fb7bc
P = [0.5 0.4 0.1;
     0.3 0.2 0.5;
     0.5 0.3 0.2];

# ╔═╡ f2a0c444-1d66-11eb-0f37-99e69755fe8f
md"##### First way."

# ╔═╡ f2a67846-1d66-11eb-022c-6f0a51c33a42
piProb1 = (P^100)[1,:]

# ╔═╡ f2b43238-1d66-11eb-3713-c5c8f2d4af76
md"##### Second way."

# ╔═╡ f2b4d63e-1d66-11eb-3d9f-65ba9b1ac506
begin
	A = vcat((P' - I)[1:2,:],ones(3)')
	b = [0 0 1]'
	piProb2 = (A\b)[:, 1]
end

# ╔═╡ f2c17bc8-1d66-11eb-0569-9b84c6b33cca
md"##### Third way."

# ╔═╡ f2c2e8fa-1d66-11eb-3421-3d76cd8c9a73
begin
	eigVecs = eigvecs(copy(P'))
	highestVec = eigVecs[:,findmax(abs.(eigvals(P)))[2]]
	piProb3 = Array{Float64}(highestVec)/norm(highestVec,1)
end

# ╔═╡ f2d180ba-1d66-11eb-216b-e3e640811323
md"##### Fourth way."

# ╔═╡ f2da9662-1d66-11eb-1f95-3da69865d370
begin
numInState = zeros(Int,3)
	state = 1
	N = 10^6
	for t in 1:N
		numInState[state] += 1
		global state = sample(1:3,weights(P[state,:]))
	end
	piProb4 = numInState/N
end

# ╔═╡ f2dbd9d2-1d66-11eb-12b9-af2d7f1f73da
DataFrame(:piProb1 => piProb1, :piProb2 => piProb2, :piProb3 => piProb3, :piProb4 => piProb4)

# ╔═╡ f2e37750-1d66-11eb-3f4e-e7b249fb2052
md"## End of listing 1.8"

# ╔═╡ Cell order:
# ╟─7877839e-1d66-11eb-0a3c-5953d222ccbc
# ╠═f29303e2-1d66-11eb-3313-f335871e9674
# ╠═f2935b8a-1d66-11eb-02e8-3dacec840928
# ╟─f293d704-1d66-11eb-36d8-4bb2f8dff940
# ╠═f2a01cf8-1d66-11eb-3573-d91ed64fb7bc
# ╟─f2a0c444-1d66-11eb-0f37-99e69755fe8f
# ╠═f2a67846-1d66-11eb-022c-6f0a51c33a42
# ╟─f2b43238-1d66-11eb-3713-c5c8f2d4af76
# ╠═f2b4d63e-1d66-11eb-3d9f-65ba9b1ac506
# ╟─f2c17bc8-1d66-11eb-0569-9b84c6b33cca
# ╠═f2c2e8fa-1d66-11eb-3421-3d76cd8c9a73
# ╟─f2d180ba-1d66-11eb-216b-e3e640811323
# ╠═f2da9662-1d66-11eb-1f95-3da69865d370
# ╠═f2dbd9d2-1d66-11eb-12b9-af2d7f1f73da
# ╟─f2e37750-1d66-11eb-3f4e-e7b249fb2052
