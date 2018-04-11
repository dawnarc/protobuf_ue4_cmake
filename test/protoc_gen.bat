

set dir=%cd%

set out_cpp=.

for /R %%s in (*.proto) do (
	if exist %%s protoc.exe -I=%dir% --cpp_out=%out_cpp% %%s
)
