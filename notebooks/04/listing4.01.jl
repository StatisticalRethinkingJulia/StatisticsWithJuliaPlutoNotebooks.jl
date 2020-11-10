### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.01"

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
end

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	f(z::Int) = begin z = 0 end
	f(z::Array{Int}) = begin z[1] = 0 end
end

# ╔═╡ 572972b2-22e6-11eb-1ec4-2d53fc807d03
begin
	x1 = 1
	typeof(x1)
end

# ╔═╡ 5729a994-22e6-11eb-00b0-e525c9e271cb
isimmutable(x1)

# ╔═╡ 572a4444-22e6-11eb-351f-65750fcd0d5e
Text("Before call by value: $x1")

# ╔═╡ 57305f50-22e6-11eb-1aef-61c42e0c6363
f(x1)

# ╔═╡ 573d81bc-22e6-11eb-3b89-010224cc8027
Text("After call by value: $x1")

# ╔═╡ 573e105a-22e6-11eb-32cb-859417a95d32
begin
	x2 = [1]
	typeof(x2)
end

# ╔═╡ 574411da-22e6-11eb-2e9e-739f51ea9fc6
isimmutable(x2)

# ╔═╡ 574ff9c8-22e6-11eb-3866-817010612a7e
Text("Before call by reference: $x2")

# ╔═╡ 575094b4-22e6-11eb-25b6-fb702eec82a2
f(x2)

# ╔═╡ 575b02be-22e6-11eb-29ad-3f48f1b6eae6
Text("After call by reference: $x2")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.01"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═572972b2-22e6-11eb-1ec4-2d53fc807d03
# ╠═5729a994-22e6-11eb-00b0-e525c9e271cb
# ╠═572a4444-22e6-11eb-351f-65750fcd0d5e
# ╠═57305f50-22e6-11eb-1aef-61c42e0c6363
# ╠═573d81bc-22e6-11eb-3b89-010224cc8027
# ╠═573e105a-22e6-11eb-32cb-859417a95d32
# ╠═574411da-22e6-11eb-2e9e-739f51ea9fc6
# ╠═574ff9c8-22e6-11eb-3866-817010612a7e
# ╠═575094b4-22e6-11eb-25b6-fb702eec82a2
# ╠═575b02be-22e6-11eb-29ad-3f48f1b6eae6
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
