SRC = $(wildcard src/*.c)
HEADER = $(wildcard include/babl.h)
OBJ = $(patsubst src/%.c, build/%.o, $(SRC))

NAME = bin/BabL

C_FLAGS = -Wall -Wextra -Werror -Iinclude

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME)

build/%.o: src/%.c $(HEADER)
	$(CC) $(C_FLAGS) -c $< -o $@

run: $(NAME)
	./$(NAME)

clean:
	rm -f $(NAME)

fclean: clean
	rm -f %(NAME)

re: fclean all

.PHONY: all clean fclean re
