### A Pluto.jl notebook ###
# v0.12.9

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV, Statistics
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.12"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("temperatures.csv"), copycols=true)
	brisT = data.Brisbane
	gcT = data.GoldCoast

	sigB = std(brisT)
	sigG = std(gcT)
	covBG = cov(brisT, gcT)

	meanVect = [mean(brisT) , mean(gcT)]
	covMat = [sigB^2  covBG
			  covBG   sigG^2]
end

# ╔═╡ 65fa5b06-246e-11eb-19b7-d77750e343fb
begin
	outfile = open(datadir("mvParams2.jl"), "w")
	write(outfile,"meanVect = $meanVect \ncovMat = $covMat")
	close(outfile)
	read(datadir("mvParams2.jl"), String)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.12"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═65fa5b06-246e-11eb-19b7-d77750e343fb
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
