### A Pluto.jl notebook ###
# v0.19.8

#> [frontmatter]
#> title = "cap_4"
#> date = "2022-06-11"
#> description = "Data frames on julia"

using Markdown
using InteractiveUtils

# ╔═╡ 628d0de0-e98b-11ec-2b32-4d6d0a0e1d22
using DataFrames

# ╔═╡ d4e1efa1-73e4-4065-8bda-cfa3abb60544
using CSV

# ╔═╡ 25b7056d-60a0-49e8-9519-ca40ce03fb1a
function grades_array()
	name = ["Bob", "Sally", "Alice", "Hank"]
	age = [17, 18, 20, 19]
	grade_2020 = [5.0, 1.0, 8.5, 4.0]
	(; name, age, grade_2020)
end

# ╔═╡ 8dcca9e9-4dcb-48ea-9c77-1148eec1cebf
function second_row()
	name, age, grade_2020 = grades_array()
	i = 2
	row = (name[i], age[i], grade_2020[i])
end

# ╔═╡ b828ffe2-e42d-4974-a203-bbfceb542bd4
second_row()

# ╔═╡ 9f230ca5-ed24-4d70-ac04-283a73fe611b
function row_alice()
	names = grades_array().name
	i= findfirst(names .== "Alice")
end

# ╔═╡ c0e53386-f284-4348-9966-d5439679aa37
row_alice()

# ╔═╡ 2e2e2691-b0f2-4a69-a71d-31a3551825cb
function value_alice()
	grades = grades_array().grade_2020
	i = row_alice()
	grades[i]
end


# ╔═╡ f7b87852-38ee-4bfe-a96e-106017d8ed93
value_alice()

# ╔═╡ a4386674-bfec-4fcf-9882-7175849e912c
names = ["Sally", "Bob", "Alice", "Hank"]

# ╔═╡ c9aeffc1-efb1-4b46-87d3-cc1f30193ba0


# ╔═╡ b7a7298c-2110-46ef-af23-193eb0172a08
grades = [1,5,8.5,4]

# ╔═╡ 8cccab58-4cd9-4b88-84a5-d0385625f9e1
# df = DataFrame(; name = names, grades_2020 = grades)

# ╔═╡ 2983972a-fe48-4374-8c11-18da5608c04d


# ╔═╡ c6c1730b-f2d7-4beb-b166-0952fe8e2519
function grades_2020()
	name = ["Sally", "Bob", "Alice", "Hank"]
	grade_2020 = [1, 5, 8.5, 4]
	DataFrame(; name, grade_2020) 
end

# ╔═╡ a03657e8-b763-4145-9583-8403c3ada4c7
df1 = DataFrame(name = ["Malice"], grade_2020 = ["10"])

# ╔═╡ eebbad10-ed84-4bb0-aa44-4221e8c6e3db


# ╔═╡ f3eabb8a-c8ed-4cfe-bd9d-aeafadab063d
df1

# ╔═╡ 06308fc9-6465-40d2-bf6b-c90671a82e04
DataFrame(σ = ["a", "a", "a"], δ =[π, π/2,π/3])

# ╔═╡ 3dc3c3b2-80cb-4b58-b109-f558ed142181
function grades_2020(names::Vector{Int})
	df = grades_2020()
	df[names,:]
end

# ╔═╡ 0dc2efee-b59e-448f-9633-72d00a8262d6
df = grades_2020()

# ╔═╡ 25219e72-34b3-4994-aa83-4727942f6c38
grades_2020([3,4])

# ╔═╡ 49bed0f6-1a96-4175-bb34-e94ca1dc3807
# Esto es un comentario


# ╔═╡ 722494b5-5074-4e9c-bf1b-1e4d57f160ce
grades_2020()

# ╔═╡ 658031a2-8f77-47ff-9941-5aae5b0259a0
function write_grades_csv()
	path = "grades.csv"
	CSV.write(path,grades_2020())
end

# ╔═╡ 0b8454bc-eed8-4281-81d8-d18a72f2ce40
path = write_grades_csv()

# ╔═╡ d9f8d2b7-0e59-422c-88d2-183be1c74500
read(path,String)

# ╔═╡ e165b126-e463-4ca3-8243-3d557b0747f0
function grades_with_commas()
	df = grades_2020()
	df[3, :name] = "Alice,"
	df
end

# ╔═╡ 9a7fd96f-e375-42a0-a5aa-4d8cff9b6657
grades_with_commas()

# ╔═╡ b42960bd-a265-43af-916c-aa8a6cd7fb84
function write_comma_csv()
	path = "grades−commas.csv"
	CSV.write(path, grades_with_commas())
end

# ╔═╡ 5f2ae0de-e1fc-4f80-bb52-b7ee526c736e


# ╔═╡ 82f2b7f2-46c8-4297-adea-52c5a337e1fc
read(write_comma_csv(), String)

# ╔═╡ e1276bc9-d1ca-4c53-b6c2-fe2aca551eb2


# ╔═╡ c7c8debc-6526-42dd-9ddd-058c6f44f43f
#Another common way to solve this problem is to write the data to a tab-separated values (TSV) file format. This assumes that the data doesn’t contain tabs, which holds in most cases.

# ╔═╡ 64f42602-0182-475b-8d7a-7fc9f503fa47
function write_comma_tsv()
	path = "grades-comma.tsv"
	CSV.write(path, grades_with_commas(); delim = '\t')
end

# ╔═╡ 4ac64175-668a-4600-add6-5bb96c6b7c83
read(write_comma_tsv(), String)

# ╔═╡ aa2940ab-3520-4693-8e1c-2c84f5bdb2e6
# Text file formats like CSV and TSV files can also be found that use other delimiters, such as semicolons “;” spaces “ ,” or even something as unusual as “π.”

# ╔═╡ 59c61bd3-da07-4da7-9dee-64759ba4d387
function write_space_separated()
	path = "grades-space-separated.csv"
	CSV.write(path, grades_2020() ; delim=' ' )
end

# ╔═╡ e04acac7-eaac-4753-b35d-a9ef3e60a874
read(write_space_separated(),String)

# ╔═╡ 6fbcf3a8-9e60-46e1-bd71-3a57b1f3291e


# ╔═╡ 9907cbef-f118-45bf-90bf-d1ac76d999a0
data_frame = CSV.read("grades.csv",DataFrame)

# ╔═╡ 6a6d4a25-cca8-451f-8153-f767099aa1f6
my_data = """
	a,b,c,d,e
	Kim,2018−02−03,3,4.0,2018−02−03T10:00
	"""

# ╔═╡ 51b02e1f-6460-481c-9ede-adcab2b99a5d
write("my_data.csv", my_data)

# ╔═╡ a3cbc714-abe1-423f-b2e7-e048019f9e35
data_frame_2 = CSV.read("my_data.csv",DataFrame)

# ╔═╡ 5ef63275-9afc-4b09-9c82-198696fcb3d6
## index and summarize

# ╔═╡ 940ae30f-ca85-4fb4-ae61-63cae867d212
grades_2020()

# ╔═╡ 9965ccd5-8650-407b-af1e-40933f6b6450
function names_grades1()
	df = grades_2020()
	df.name
end

# ╔═╡ 82cdf9d5-bb24-4966-b6ff-8fdda1539fa8
names_grades1()

# ╔═╡ beb38366-c3d5-4536-9699-f5b880723e5d
function names_grades2()
	df = grades_2020()
	df[!, :name]
end

# ╔═╡ 3ca8049f-8dd0-4069-8ab8-8d9e15a99660


# ╔═╡ 904cf40a-c1ea-4b6f-8acd-706b49e89524
names_grades2()

# ╔═╡ 311bfe7c-7465-450e-b6be-d15de8ad03d1
Datos = grades_2020()

# ╔═╡ 4c4bc258-2431-425b-813b-af14a95a1ab3
Datos[2, : ]

# ╔═╡ 76c4145a-1273-4448-943d-2d97ed7cc5b7


# ╔═╡ 83876a8d-1940-4ff2-891f-253805ae341b


# ╔═╡ 7b1d7531-b996-456f-a990-3c83646dda2d


# ╔═╡ bdf4a58e-357e-4a19-8444-16a6ad09f860


# ╔═╡ ba9270d0-6660-41b7-8a24-35e5e3f7162b
df[2, :]

# ╔═╡ 5fdf0707-724f-48aa-9298-94291d87a1f3


# ╔═╡ 75cb15c3-47cd-441a-9766-e30db420a705


# ╔═╡ 3c882408-e61a-446f-9237-2645082260cf


# ╔═╡ 786d8198-40a9-41a9-9fa8-d7c007bfc80c


# ╔═╡ 245a10bd-6bca-4714-b226-27c3d1f56d44


# ╔═╡ a81e5b18-8580-474b-be8f-37a1ec9c7a2a


# ╔═╡ de1946fc-a245-4ebd-a202-56e459cc12c2


# ╔═╡ 7229f200-85ce-465e-966e-d4ea20d89555


# ╔═╡ 54d38701-8750-4284-9ee7-7191757e3490


# ╔═╡ c06a0174-101d-4ef3-ab3c-ae298f7804c1


# ╔═╡ 355d4724-2982-4f00-aa8e-cb6a63498034


# ╔═╡ 81c0ca4d-4b0c-4644-9708-473bc384a303


# ╔═╡ 4c333128-3491-4c19-bb60-7eb00761beac


# ╔═╡ e986d34d-8869-4afb-80c7-b59d667dde59


# ╔═╡ c01f8a40-0164-4eb0-b78b-b1a694cd59c6


# ╔═╡ 7729f03f-c7d5-481b-bde3-f2b424da02ce


# ╔═╡ 3a79b4af-0bb5-4dbe-ba23-9f0d0306b03a


# ╔═╡ c95bcb9c-5c2f-4841-ad39-bc9c0a86e405


# ╔═╡ 676e5639-d7b7-4a44-a506-fec3ff19e232


# ╔═╡ 47080c6e-50d1-4f79-8e79-82fdf4a2f1d1


# ╔═╡ 7c933173-c442-4dc5-95b2-4dd8d51df88d


# ╔═╡ 90e334a4-fa8e-415b-a2dd-446ff94b9e65


# ╔═╡ ecbdb80d-ea03-477e-8199-52f6c0a1f582


# ╔═╡ 4f61b0d9-22f3-4f10-9d3f-b4393b92fba0


# ╔═╡ 585fd5df-9003-4de5-ba27-f2b1aeaf68da


# ╔═╡ 3e53a649-254e-468e-a61c-6062e4ef156d


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"

[compat]
CSV = "~0.10.4"
DataFrames = "~1.3.4"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings"]
git-tree-sha1 = "873fb188a4b9d76549b81465b1f75c82aaf59238"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.4"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "9be8be1d8a6f44b96482c8af52238ea7987da3e3"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.45.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "fb5f5316dd3fd4c5e7c30a24d50643b73e37cd40"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.10.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "daa21eb85147f72e41f6352a57fccea377e310a9"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.4"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "129b104185df66e408edd6625d480b7f9e9823a0"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.18"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "61feba885fac3a407465726d0c330b3055df897f"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.1.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "db8481cf5d6278a121184809e9eb1628943c7704"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.13"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "5ce79ce186cc678bbb5c5681ca3379d1ddae11a1"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.7.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═25b7056d-60a0-49e8-9519-ca40ce03fb1a
# ╠═8dcca9e9-4dcb-48ea-9c77-1148eec1cebf
# ╠═b828ffe2-e42d-4974-a203-bbfceb542bd4
# ╠═9f230ca5-ed24-4d70-ac04-283a73fe611b
# ╠═c0e53386-f284-4348-9966-d5439679aa37
# ╠═2e2e2691-b0f2-4a69-a71d-31a3551825cb
# ╠═f7b87852-38ee-4bfe-a96e-106017d8ed93
# ╠═628d0de0-e98b-11ec-2b32-4d6d0a0e1d22
# ╠═a4386674-bfec-4fcf-9882-7175849e912c
# ╠═c9aeffc1-efb1-4b46-87d3-cc1f30193ba0
# ╠═b7a7298c-2110-46ef-af23-193eb0172a08
# ╠═8cccab58-4cd9-4b88-84a5-d0385625f9e1
# ╠═2983972a-fe48-4374-8c11-18da5608c04d
# ╠═c6c1730b-f2d7-4beb-b166-0952fe8e2519
# ╠═0dc2efee-b59e-448f-9633-72d00a8262d6
# ╠═a03657e8-b763-4145-9583-8403c3ada4c7
# ╠═eebbad10-ed84-4bb0-aa44-4221e8c6e3db
# ╠═f3eabb8a-c8ed-4cfe-bd9d-aeafadab063d
# ╠═06308fc9-6465-40d2-bf6b-c90671a82e04
# ╠═3dc3c3b2-80cb-4b58-b109-f558ed142181
# ╠═25219e72-34b3-4994-aa83-4727942f6c38
# ╠═49bed0f6-1a96-4175-bb34-e94ca1dc3807
# ╠═d4e1efa1-73e4-4065-8bda-cfa3abb60544
# ╠═722494b5-5074-4e9c-bf1b-1e4d57f160ce
# ╠═658031a2-8f77-47ff-9941-5aae5b0259a0
# ╠═0b8454bc-eed8-4281-81d8-d18a72f2ce40
# ╠═d9f8d2b7-0e59-422c-88d2-183be1c74500
# ╠═e165b126-e463-4ca3-8243-3d557b0747f0
# ╠═9a7fd96f-e375-42a0-a5aa-4d8cff9b6657
# ╠═b42960bd-a265-43af-916c-aa8a6cd7fb84
# ╠═5f2ae0de-e1fc-4f80-bb52-b7ee526c736e
# ╠═82f2b7f2-46c8-4297-adea-52c5a337e1fc
# ╠═e1276bc9-d1ca-4c53-b6c2-fe2aca551eb2
# ╠═c7c8debc-6526-42dd-9ddd-058c6f44f43f
# ╠═64f42602-0182-475b-8d7a-7fc9f503fa47
# ╠═4ac64175-668a-4600-add6-5bb96c6b7c83
# ╠═aa2940ab-3520-4693-8e1c-2c84f5bdb2e6
# ╠═59c61bd3-da07-4da7-9dee-64759ba4d387
# ╠═e04acac7-eaac-4753-b35d-a9ef3e60a874
# ╠═6fbcf3a8-9e60-46e1-bd71-3a57b1f3291e
# ╠═9907cbef-f118-45bf-90bf-d1ac76d999a0
# ╠═6a6d4a25-cca8-451f-8153-f767099aa1f6
# ╠═51b02e1f-6460-481c-9ede-adcab2b99a5d
# ╠═a3cbc714-abe1-423f-b2e7-e048019f9e35
# ╠═5ef63275-9afc-4b09-9c82-198696fcb3d6
# ╠═940ae30f-ca85-4fb4-ae61-63cae867d212
# ╠═9965ccd5-8650-407b-af1e-40933f6b6450
# ╠═82cdf9d5-bb24-4966-b6ff-8fdda1539fa8
# ╠═beb38366-c3d5-4536-9699-f5b880723e5d
# ╠═3ca8049f-8dd0-4069-8ab8-8d9e15a99660
# ╠═904cf40a-c1ea-4b6f-8acd-706b49e89524
# ╠═311bfe7c-7465-450e-b6be-d15de8ad03d1
# ╠═4c4bc258-2431-425b-813b-af14a95a1ab3
# ╠═76c4145a-1273-4448-943d-2d97ed7cc5b7
# ╠═83876a8d-1940-4ff2-891f-253805ae341b
# ╠═7b1d7531-b996-456f-a990-3c83646dda2d
# ╠═bdf4a58e-357e-4a19-8444-16a6ad09f860
# ╠═ba9270d0-6660-41b7-8a24-35e5e3f7162b
# ╠═5fdf0707-724f-48aa-9298-94291d87a1f3
# ╠═75cb15c3-47cd-441a-9766-e30db420a705
# ╠═3c882408-e61a-446f-9237-2645082260cf
# ╠═786d8198-40a9-41a9-9fa8-d7c007bfc80c
# ╠═245a10bd-6bca-4714-b226-27c3d1f56d44
# ╠═a81e5b18-8580-474b-be8f-37a1ec9c7a2a
# ╠═de1946fc-a245-4ebd-a202-56e459cc12c2
# ╠═7229f200-85ce-465e-966e-d4ea20d89555
# ╠═54d38701-8750-4284-9ee7-7191757e3490
# ╠═c06a0174-101d-4ef3-ab3c-ae298f7804c1
# ╠═355d4724-2982-4f00-aa8e-cb6a63498034
# ╠═81c0ca4d-4b0c-4644-9708-473bc384a303
# ╠═4c333128-3491-4c19-bb60-7eb00761beac
# ╠═e986d34d-8869-4afb-80c7-b59d667dde59
# ╠═c01f8a40-0164-4eb0-b78b-b1a694cd59c6
# ╠═7729f03f-c7d5-481b-bde3-f2b424da02ce
# ╠═3a79b4af-0bb5-4dbe-ba23-9f0d0306b03a
# ╠═c95bcb9c-5c2f-4841-ad39-bc9c0a86e405
# ╠═676e5639-d7b7-4a44-a506-fec3ff19e232
# ╠═47080c6e-50d1-4f79-8e79-82fdf4a2f1d1
# ╠═7c933173-c442-4dc5-95b2-4dd8d51df88d
# ╠═90e334a4-fa8e-415b-a2dd-446ff94b9e65
# ╠═ecbdb80d-ea03-477e-8199-52f6c0a1f582
# ╠═4f61b0d9-22f3-4f10-9d3f-b4393b92fba0
# ╠═585fd5df-9003-4de5-ba27-f2b1aeaf68da
# ╠═3e53a649-254e-468e-a61c-6062e4ef156d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002