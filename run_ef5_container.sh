#!/usr/bin/env bash
# init
function pause(){
   read -p "$*"
}

docker run -it -v $(pwd)/data:/data:ro -v $(pwd)/conf:/conf:ro -v $(pwd)/results:/results:rw ef5-container
pause 'Press any key to continue...'