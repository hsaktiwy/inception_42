CMD=docker-compose
SRC= -f srcs/docker-compose.yml
VOLUMES= ~/data/wordpress ~/data/mariadb
VOLUMES1= ~/data/wordpress
VOLUMES2= ~/data/mariadb
GREEN = \033[0;32m
RED = \033[0;31m
YELLOW = \033[0;33m
BLUE = \033[0;34m
MAGENTA = \033[0;35m
CYAN = \033[0;36m
WHITE = \033[0;37m
NC = \033[0m

all: build run

build: clear_volumes
	@mkdir -p $(VOLUMES1)
	@mkdir -p $(VOLUMES2)
	@echo "$(GREEN)Building ...$(NC)";
	@$(CMD) $(SRC) build
	@echo "$(YELLOW)Building finished!$(NC)";

run: clear_volumes
	@mkdir -p $(VOLUMES1)
	@mkdir -p $(VOLUMES2)
	@echo "$(GREEN)Runing ...$(NC)";
	@$(CMD) $(SRC) up --build
	@echo "$(YELLOW)Runing Finished!$(NC)";

stop:
	@echo "$(GREEN)Stoping Containers ...$(NC)";
	@$(CMD) $(SRC) down 
	@echo "$(YELLOW)Stoping Containers finished$(NC)";

clear:
	@echo "$(GREEN)clearing Containers, Images, docker Volumes, Networks ...$(NC)";
	@$(CMD) $(SRC) down -v --rmi all --remove-orphans
	@echo "$(YELLOW)clearing finished!$(NC)";
clear_volumes:
	@echo "$(GREEN)Volumes ($(VOLUMES:' '=,)) clearing ...$(NC)";
	@rm -rf $(VOLUMES1) $(VOLUMES2)
	@echo "$(YELLOW)Volumes ($(VOLUMES: =,)) are cleared$(NC)";

message:
	@echo "$(RED)Fully Clearing ...$(NC)";
fclear: message clear clear_volumes
	@echo "$(MAGENTA)Fully Cleared!$(NC)";

.PHONY: clear stop build run all fclear clear_volumes