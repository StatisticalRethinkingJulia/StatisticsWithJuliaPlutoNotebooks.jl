### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 5a98d3d0-1d31-11eb-0caf-5dca48313597
using Pkg, DrWatson

# ╔═╡ 61f78d42-1d31-11eb-31f1-63eb86dabf9f
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics
end

# ╔═╡ 29db8358-1d24-11eb-166a-e1b1c886af45
md"## Listing 1.2"

# ╔═╡ af985f1c-1d23-11eb-335b-c3abd97e66ea
begin
	array1 = [(2n+1)^2 for n in 1:5]
	array2 = [sqrt(i) for i in array1]
	typeof(1:5), typeof(array1), typeof(array2)
end

# ╔═╡ d4e0542a-1d23-11eb-1ef2-3d3b86cd30cb
1:5, array1, array2

# ╔═╡ fe1c39ce-1d23-11eb-0790-7d996206bd99
md"##### Open `Live docs` and start typing or click on `sqrt`."

# ╔═╡ d3cdd15a-1d23-11eb-3e0c-91a6135d3407
sqrt

# ╔═╡ 06a876ce-1d2f-11eb-2128-e1e8c67779cb
md"## Listing 1.3"

# ╔═╡ 293b0710-1d2f-11eb-2da1-2d516ce4c85f
begin
	Text(@time begin
			data1 = Float64[]
				for _ in 1:10^6
					group = Float64[]
						for _ in 1:5*10^2
							push!(group,rand())
						end
					push!(data1,mean(group))
				end
			"98% of the means lie in the estimated range: ",
                        (quantile(data1,0.01), quantile(data1,0.99))
		end
	)
end

# ╔═╡ e1c7f0e8-1d3b-11eb-2545-53bb0fe2569a
md"##### Note that the result of the `@time ...` macro is written to the console (where you started Pluto)."

# ╔═╡ 0ade9930-1d2f-11eb-2329-334dc91bc5a9
md"## Listing 1.4"

# ╔═╡ b283773a-1d3b-11eb-21b8-89af728c6fed
@time begin
	data2 = [mean(rand(5*10^2)) for _ in 1:10^6]
        "98% of the means lie in the estimated range: ",
                        (quantile(data2,0.01),quantile(data2,0.99))
end

# ╔═╡ a95250f0-1d3b-11eb-0492-5576bc284913
md"## Listing 1.5"

# ╔═╡ f2bc632e-1d3c-11eb-0fab-b741d7d2d04f
begin
	data3 = [1,2,3]
	s = 0
	beta, gamma = 2, 1

	for i in 1:length(data3)
		global s += beta*data3[i]
		data3[i] *= -1
	end
	
	"Sum of data in external scope: ", s, data3
end

# ╔═╡ 36795a2c-1d3d-11eb-22fe-7f694a7a816c
begin

	function sumData(beta)
		s = 0
		for i in 1:length(data3)
			s += data3[i] + gamma
		end
		return s
	end
	
	"Sum of data in a function: ", s, sumData(beta/2)
end

# ╔═╡ e0d70c94-1d3d-11eb-1caf-4dc5c83c9482
md"##### As mentioned before, `begin` and `end` is a very important construct in Pluto notebooks!"

# ╔═╡ 0a6f9b48-1d3e-11eb-336f-fd577cf395ef
begin
	"This will be printed!"
end

# ╔═╡ 338544f6-1d3e-11eb-1ca7-c994c82458f5
md"##### Suppress printing of the final result by a `;` after `end`."

# ╔═╡ 20635ec6-1d3e-11eb-3ad1-b99b1fe6b4c2
begin
	"This will not be printed!"
end;

# ╔═╡ Cell order:
# ╠═29db8358-1d24-11eb-166a-e1b1c886af45
# ╠═5a98d3d0-1d31-11eb-0caf-5dca48313597
# ╠═61f78d42-1d31-11eb-31f1-63eb86dabf9f
# ╠═af985f1c-1d23-11eb-335b-c3abd97e66ea
# ╠═d4e0542a-1d23-11eb-1ef2-3d3b86cd30cb
# ╟─fe1c39ce-1d23-11eb-0790-7d996206bd99
# ╠═d3cdd15a-1d23-11eb-3e0c-91a6135d3407
# ╟─06a876ce-1d2f-11eb-2128-e1e8c67779cb
# ╠═293b0710-1d2f-11eb-2da1-2d516ce4c85f
# ╟─e1c7f0e8-1d3b-11eb-2545-53bb0fe2569a
# ╟─0ade9930-1d2f-11eb-2329-334dc91bc5a9
# ╠═b283773a-1d3b-11eb-21b8-89af728c6fed
# ╟─a95250f0-1d3b-11eb-0492-5576bc284913
# ╠═f2bc632e-1d3c-11eb-0fab-b741d7d2d04f
# ╠═36795a2c-1d3d-11eb-22fe-7f694a7a816c
# ╟─e0d70c94-1d3d-11eb-1caf-4dc5c83c9482
# ╠═0a6f9b48-1d3e-11eb-336f-fd577cf395ef
# ╟─338544f6-1d3e-11eb-1ca7-c994c82458f5
# ╠═20635ec6-1d3e-11eb-3ad1-b99b1fe6b4c2
