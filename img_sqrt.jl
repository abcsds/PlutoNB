### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 3761094c-0971-11eb-1f89-09a58fcc6d0a
using Images, FileIO

# ╔═╡ 4d203fb4-0971-11eb-3baa-a709907ea99a
img = load("./img/zebras.jpg")

# ╔═╡ 2421839c-0972-11eb-2a30-8bd65598590f
Gray.(img)

# ╔═╡ 4fc9c16a-0971-11eb-2d22-b975723c214b
RGB.(sqrt.(Gray.(img)))

# ╔═╡ 51a7f08a-0972-11eb-2fdb-874ed8028e67
[rand(Gray{Float64}, 20, 20) rand(Gray{Float64}, 20, 20)]

# ╔═╡ Cell order:
# ╠═3761094c-0971-11eb-1f89-09a58fcc6d0a
# ╠═4d203fb4-0971-11eb-3baa-a709907ea99a
# ╠═2421839c-0972-11eb-2a30-8bd65598590f
# ╠═4fc9c16a-0971-11eb-2d22-b975723c214b
# ╠═51a7f08a-0972-11eb-2fdb-874ed8028e67
