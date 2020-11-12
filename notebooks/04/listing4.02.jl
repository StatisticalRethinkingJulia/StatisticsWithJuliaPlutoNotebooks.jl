### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.02"

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
end

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
md"##### Immutable:"

# ╔═╡ f9d73026-2386-11eb-2bdc-bde5f34e7694
begin
	a1 = 10
	b1 = a1
	b1 = 20
	a1
end

# ╔═╡ f9d759ca-2386-11eb-269c-2540e0b8d985
md"##### No copy:"

# ╔═╡ f9d7db52-2386-11eb-2170-3be42892f232
begin
	a2 = [10]
	b2 = a2
	b2[1] = 20
	a2
end

# ╔═╡ f9df3fa0-2386-11eb-3b6c-fd77875fc054
md"##### Copy:"

# ╔═╡ f9ea5298-2386-11eb-2ba2-3fe09f34fc4c
begin
	a3 = [10]
	b3 = copy(a3)
	b3[1] = 20
	a3
end

# ╔═╡ f9ec6ec8-2386-11eb-2d82-edb2e6c6fa76
md"##### Shallow copy:"

# ╔═╡ f9f2877c-2386-11eb-256d-19b1583fa1b0
begin
	a4 = [[10]]
	b4 = copy(a4)
	b4[1][1] = 20
	a4
end

# ╔═╡ f9f83140-2386-11eb-3c17-7b680d570db8
md"##### Deep copy:"

# ╔═╡ fa03c456-2386-11eb-0265-576e2afde307
begin
	a5 = [[10]]
	b5 = deepcopy(a5)
	b5[1][1] = 20
	a5
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.02"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╟─fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═f9d73026-2386-11eb-2bdc-bde5f34e7694
# ╟─f9d759ca-2386-11eb-269c-2540e0b8d985
# ╠═f9d7db52-2386-11eb-2170-3be42892f232
# ╟─f9df3fa0-2386-11eb-3b6c-fd77875fc054
# ╠═f9ea5298-2386-11eb-2ba2-3fe09f34fc4c
# ╟─f9ec6ec8-2386-11eb-2d82-edb2e6c6fa76
# ╠═f9f2877c-2386-11eb-256d-19b1583fa1b0
# ╟─f9f83140-2386-11eb-3c17-7b680d570db8
# ╠═fa03c456-2386-11eb-0265-576e2afde307
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
