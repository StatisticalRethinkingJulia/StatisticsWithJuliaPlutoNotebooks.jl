### A Pluto.jl notebook ###
# v0.12.8

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.08"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
data = CSV.read(datadir("purchaseData.csv"), copycols = true)

# ╔═╡ 9504fbf4-2441-11eb-2269-59ab4e930570
begin
	newCol = DataFrame(Validated=ones(Int, size(data,1)))
	newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
	newData = DataFrame(Name=["JOHN", "ASHELY","MARYANNA"], 
						Job=["Lawyer", "Doctor","Lawyer"])
end

# ╔═╡ 95053800-2441-11eb-1ad6-e7f9cf8f1440
begin
	data1 = hcat(data, newCol)
	first(data1, 3)
end

# ╔═╡ 9505e3fc-2441-11eb-29de-b73f5d680690
begin
	data2 = vcat(data1, newRow, cols=:union) 
	last(data2, 3)
end

# ╔═╡ 9513dd5e-2441-11eb-1aa1-2351da214449
begin
	data3 = join(data2, newData, on=:Name)
	data3
end

# ╔═╡ 95146f26-2441-11eb-0e37-337a3ffc09c2
begin
	select!(data3,[:Name,:Job])
	data3
end

# ╔═╡ 951fe570-2441-11eb-3ebd-539c016899b4
begin
	unique!(data3,:Job)
	data3
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.08"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═9504fbf4-2441-11eb-2269-59ab4e930570
# ╠═95053800-2441-11eb-1ad6-e7f9cf8f1440
# ╠═9505e3fc-2441-11eb-29de-b73f5d680690
# ╠═9513dd5e-2441-11eb-1aa1-2351da214449
# ╠═95146f26-2441-11eb-0e37-337a3ffc09c2
# ╠═951fe570-2441-11eb-3ebd-539c016899b4
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
