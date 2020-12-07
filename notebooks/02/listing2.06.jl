### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ aed9a998-1ee8-11eb-1d55-31076d75bfb6
using Pkg, DrWatson

# ╔═╡ a818b7b6-1ee8-11eb-167a-f3d0a4cb736a
md"## Listing 2.6"

# ╔═╡ 8fce84c2-1ee5-11eb-38fc-9f2c2720cb71
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
end


# ╔═╡ b7052e7e-1ee8-11eb-3f69-af0a0c82375f
begin
	A = Set([2,7,2,3])
	B = Set(1:6)
	omega = Set(1:10)
end;

# ╔═╡ 49ce4878-1ee9-11eb-03bd-59a4e141e22c
begin
	AunionB = union(A, B)
	AintersectionB = intersect(A, B)
	BdifferenceA = setdiff(B,A)
	Bcomplement = setdiff(omega,B)
	AsymDifferenceB = union(setdiff(A,B),setdiff(B,A))
end;

# ╔═╡ 5fa63066-1ee9-11eb-033f-79d6fc16652a
("A = $A, B = $B")

# ╔═╡ 49ce9e86-1ee9-11eb-1371-37dac8fbaeab
("A union B = $AunionB")

# ╔═╡ 49cf15dc-1ee9-11eb-31ba-eb7bd106c7a8
("A intersection B = $AintersectionB")

# ╔═╡ 6cc4003e-1ee9-11eb-259d-39c42a956b07
("B diff A = $BdifferenceA")

# ╔═╡ 49db80e0-1ee9-11eb-34af-515e8414ea68
("B complement = $Bcomplement")

# ╔═╡ 74f756e8-1ee9-11eb-1edb-53c58d2386d1
("A symDifference B = $AsymDifferenceB")

# ╔═╡ 49dc3514-1ee9-11eb-33af-01a3ab419dee
("The element '6' is an element of A: $(in(6,A))")

# ╔═╡ 7c6cc9da-1ee9-11eb-337f-c1e274f93d10
("Symmetric difference and intersection are subsets of the union: ",
        issubset(AsymDifferenceB,AunionB),", ", issubset(AintersectionB,AunionB))

# ╔═╡ 8c95b6f0-1ee9-11eb-0fd8-cd7a30b3ca3c
md"## End of listing 2.6"

# ╔═╡ Cell order:
# ╟─a818b7b6-1ee8-11eb-167a-f3d0a4cb736a
# ╠═aed9a998-1ee8-11eb-1d55-31076d75bfb6
# ╠═8fce84c2-1ee5-11eb-38fc-9f2c2720cb71
# ╠═b7052e7e-1ee8-11eb-3f69-af0a0c82375f
# ╠═49ce4878-1ee9-11eb-03bd-59a4e141e22c
# ╠═5fa63066-1ee9-11eb-033f-79d6fc16652a
# ╠═49ce9e86-1ee9-11eb-1371-37dac8fbaeab
# ╠═49cf15dc-1ee9-11eb-31ba-eb7bd106c7a8
# ╠═6cc4003e-1ee9-11eb-259d-39c42a956b07
# ╠═49db80e0-1ee9-11eb-34af-515e8414ea68
# ╠═74f756e8-1ee9-11eb-1edb-53c58d2386d1
# ╠═49dc3514-1ee9-11eb-33af-01a3ab419dee
# ╠═7c6cc9da-1ee9-11eb-337f-c1e274f93d10
# ╟─8c95b6f0-1ee9-11eb-0fd8-cd7a30b3ca3c
