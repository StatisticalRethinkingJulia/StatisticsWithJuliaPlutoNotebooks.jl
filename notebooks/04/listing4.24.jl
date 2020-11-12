### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using RDatasets, Plots, Measures
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.24"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = dataset("datasets", "iris")
	Text("Number of rows: $(nrow(data))")
end

# ╔═╡ 66321bda-250f-11eb-1fbd-df6e6c80e7cc
insertSpace(name) = begin
    i = findlast(isuppercase,name)
    name[1:i-1]*" "*name[i:end]
end

# ╔═╡ 663255dc-250f-11eb-2124-3b692cefccb8
begin
	featureNames = insertSpace.(string.(names(data)))[1:4]
	("Names of features:", featureNames)
end

# ╔═╡ 6632ece0-250f-11eb-337d-d9c2482dfc73
begin
	speciesNames = unique(data.Species)
	speciesFreqs = [sn => sum(data.Species .== sn) for sn in speciesNames]
	Text("Frequency per species: $(speciesFreqs)")
end

# ╔═╡ 66403c4c-250f-11eb-2b72-17cdf591ee90
begin
	default(msw = 0, ms = 3)

	scatters = [ 
		scatter(data[:,i], data[:,j], c=[:blue :red :green], group=data.Species, 
			xlabel=featureNames[i], ylabel=featureNames[j], legend = i==1 && j==1) 
		for i in 1:4, j in 1:4 ]

	plot(scatters..., size=(1200,800), margin = 4mm)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.24"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═66321bda-250f-11eb-1fbd-df6e6c80e7cc
# ╠═663255dc-250f-11eb-2124-3b692cefccb8
# ╠═6632ece0-250f-11eb-337d-d9c2482dfc73
# ╠═66403c4c-250f-11eb-2b72-17cdf591ee90
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
