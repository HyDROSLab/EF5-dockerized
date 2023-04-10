@ECHO OFF
docker run -it -v %cd%\data:/data:ro -v %cd%\conf:/conf:ro -v %cd%\results:/results:rw ef5-container
pause