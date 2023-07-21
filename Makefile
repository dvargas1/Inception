GREEN := $(shell printf "\033[32m")
YELLOW := $(shell printf "\033[33m")
BLUE := $(shell printf "\033[34m")
MAGENTA := $(shell printf "\033[35m")
RESET := $(shell printf "\033[0m")

NAME = inception
SRC = ./src

all: $(NAME)

$(NAME): up
	@printf "\n$(GREEN)✨ Projeto $(NAME) criado com sucesso! ✨$(RESET)\n\n"
	@docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
	@printf "\n$(BLUE)📊 Recursos utilizados pelos containers: 📊$(RESET)\n\n"
	@docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"


mk_dir:
	@sudo mkdir /home/dvargas/data/wordpress
	@sudo mkdir /home/dvargas/data/grafana
	@sudo mkdir /home/dvargas/data/mariadb

clean_dir:
	@sudo rm -rf /home/dvargas/data/wordpress
	@sudo rm -rf /home/dvargas/data/grafana
	@sudo rm -rf /home/dvargas/data/mariadb

up:
	@cd $(SRC) && docker compose up -d
	@printf "\n$(BLUE)🚀 Inicializando o projeto $(NAME)... 🚀$(RESET)\n\n"

down: stop
	@cd $(SRC) && docker compose down
	@printf "\n$(MAGENTA)🛑 Projeto $(NAME) finalizado. 🛑$(RESET)\n\n"

stop:
	@cd $(SRC) && docker compose stop
	@printf "\n$(YELLOW)⏸️ Projeto $(NAME) pausado. ⏸️$(RESET)\n\n"

clean: down
	@docker images "src*" --format "{{.ID}}" | xargs -r docker rmi -f
	@printf "\n$(GREEN)🧹 Limpeza concluída. 🧹$(RESET)\n\n"

fclean: clean
	@docker volume ls --filter "Name=src*" --format "{{.Name}}" | xargs -r docker volume rm
	@printf "\n$(YELLOW)🗑️ Remoção de volumes concluída. 🗑️$(RESET)\n\n"

re: fclean clean_dir mk_dir all

bonus: all

.PHONY: clean_dir mk_dir up down stop clean fclean re
