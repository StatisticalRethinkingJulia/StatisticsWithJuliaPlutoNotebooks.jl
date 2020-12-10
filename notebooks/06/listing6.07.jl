### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, DataFrames, CSV, CategoricalArrays
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.07"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("purchaseData.csv"), DataFrame; delim=",")
	#data = CSV.read("../data/purchaseData.csv", copycols = true)

end;

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
Text("Levels of Grade: $(levels(data.Grade))")

# ╔═╡ 5aab575a-3b25-11eb-3b51-afcaba4f247b
Text("Data points: $(nrow(data))")

# ╔═╡ 5ad4b776-3b25-11eb-26e5-3baf22b283ac
begin
	n = sum(.!(ismissing.(data.Grade)))
	Text("Non-missing data points: $n")
end

# ╔═╡ 5ad52f76-3b25-11eb-2b38-b7776e775586
begin
	data2 = dropmissing(data[:,[:Grade]],:Grade)

	gradeInQuestion = "E"
	indicatorVector = data2.Grade .== gradeInQuestion
	numSuccess = sum(indicatorVector)
	phat = numSuccess/n
	serr = sqrt(phat*(1-phat)/n)

	alpha = 0.05
	confidencePercent = 100*(1-alpha)
	zVal = quantile(Normal(),1-alpha/2)
	confInt = (phat - zVal*serr, phat + zVal*serr)
end

# ╔═╡ 5ae331a2-3b25-11eb-29bb-2da08e7c872d
Text("Out of $n non-missing observations $numSuccess are at level $gradeInQuestion.")

# ╔═╡ 5ae3bbd4-3b25-11eb-21e5-bf074b4ff547
Text("Hence a point estimate for the proportion of grades at level $gradeInQuestion is $phat.")

# ╔═╡ 5aef015a-3b25-11eb-2b29-3f4ba5c59a2c
Text("A $confidencePercent% confidence interval for the proprotion of level $gradeInQuestion is:\n$confInt.")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.07"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═5aab575a-3b25-11eb-3b51-afcaba4f247b
# ╠═5ad4b776-3b25-11eb-26e5-3baf22b283ac
# ╠═5ad52f76-3b25-11eb-2b38-b7776e775586
# ╠═5ae331a2-3b25-11eb-29bb-2da08e7c872d
# ╠═5ae3bbd4-3b25-11eb-21e5-bf074b4ff547
# ╠═5aef015a-3b25-11eb-2b29-3f4ba5c59a2c
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
