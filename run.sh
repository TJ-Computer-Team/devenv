git submodule update --init --recursive
bash ./coderunner/generate_subcode.sh
cd config && sudo docker compose up --build