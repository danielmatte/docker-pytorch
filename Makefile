# COMMANDS
DOCKER_COMMAND=docker
NVIDIA_DOCKER_COMMAND=nvidia-docker
GPU_DOCKER_FILE=Dockerfile
SVC=pytorch
VERSION_GPU=latest-gpu
REGISTRY_URL=dfreitas


build-gpu bg:
	@echo "[build] Building gpu docker image..."
	@$(DOCKER_COMMAND) build -t $(REGISTRY_URL)/$(SVC):$(VERSION_GPU) -f $(GPU_DOCKER_FILE) .
run-gpu rg:
	@echo "[run] Running gpu docker image..."
	@$(NVIDIA_DOCKER_COMMAND) run -it --rm --userns=host --ipc=host --volume=$(shell pwd)/..:$(shell pwd)/.. --workdir=$(shell pwd) $(REGISTRY_URL)/$(SVC):$(VERSION_GPU)
upload-gpu ug:
	@echo "[upload] Uploading gpu docker image..."
	@$(DOCKER_COMMAND) push $(REGISTRY_URL)/$(SVC)
clean c:
	@echo "[clean] Cleaning docker images..."
	@$(DOCKER_COMMAND) rmi -f $(REGISTRY_URL)/$(SVC):$(VERSION_GPU)