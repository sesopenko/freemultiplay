set REL_PATH=..\
set ABS_PATH=

rem // Save current directory and change to target ddirectory
pushd %REL_PATH%

rem // Save value of CD variable (current directory)
set ABS_PATH=%CD%

rem // Restore original directory
popd

docker run -it --mount type=bind,source=%ABS_PATH%,target=/app grpc/go protoc -I=/app --go_out=/app /app/protobuff/game_server.proto