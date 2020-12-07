### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 546a0f10-1d68-11eb-042a-134a1c0d879b
using Pkg, DrWatson

# ╔═╡ 546a5c04-1d68-11eb-23bb-cb5d47d9db43
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using HTTP, JSON
end

# ╔═╡ ee516b1c-1d67-11eb-1c05-eb5995f28838
md"## Listing 1.9"

# ╔═╡ 546ad49a-1d68-11eb-1a31-c3b003680713
begin
	data = HTTP.request("GET",
		"https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt")
	shakespeare = String(data.body)
	shakespeareWords = split(shakespeare)
end

# ╔═╡ 5476c1ce-1d68-11eb-20ca-31c3a9321588
begin
	jsonWords = HTTP.request("GET",
		"https://raw.githubusercontent.com/"*
		"h-Klok/StatisticsWithJuliaPlutoNotebooks/master/data/jsonCode.json")
	parsedJsonDict = JSON.parse( String(jsonWords.body))
end

# ╔═╡ 54773480-1d68-11eb-101f-41723a16b3e7
begin
	keywords = Array{String}(parsedJsonDict["words"])
	numberToShow = parsedJsonDict["numToShow"]
	wordCount = Dict([(x,count(w -> lowercase(w) == lowercase(x), shakespeareWords))
    	for x in keywords])
end

# ╔═╡ 5483aa7e-1d68-11eb-0bff-3f6ed1803a29
sortedWordCount = sort(collect(wordCount),by=last,rev=true);

# ╔═╡ 548437b6-1d68-11eb-2dea-4d5f64b16cf3
sortedWordCount[1:numberToShow]

# ╔═╡ 5490b23c-1d68-11eb-2908-e18fb1dd0aad
md"## End of listing 1.9"

# ╔═╡ Cell order:
# ╟─ee516b1c-1d67-11eb-1c05-eb5995f28838
# ╠═546a0f10-1d68-11eb-042a-134a1c0d879b
# ╠═546a5c04-1d68-11eb-23bb-cb5d47d9db43
# ╠═546ad49a-1d68-11eb-1a31-c3b003680713
# ╠═5476c1ce-1d68-11eb-20ca-31c3a9321588
# ╠═54773480-1d68-11eb-101f-41723a16b3e7
# ╠═5483aa7e-1d68-11eb-0bff-3f6ed1803a29
# ╠═548437b6-1d68-11eb-2dea-4d5f64b16cf3
# ╟─5490b23c-1d68-11eb-2908-e18fb1dd0aad
