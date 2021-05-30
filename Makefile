# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fhelena <fhelena@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/26 13:14:25 by fhelena           #+#    #+#              #
#    Updated: 2021/05/30 13:18:36 by fhelena          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Target Files
NAME			=
LIB				= libft.a

# Directories
SRC_DIR			= src
INC_DIR			= include
LIB_DIR			= libft
BLD_DIR			= build
OBJ_DIR			= $(BLD_DIR)/objs
DEP_DIR			= $(BLD_DIR)/deps

-include		$(SRC_DIR)/$(SRC_DIR).mk

# Files
SRCS			= $(SRC)
OBJS			= $(SRCS:%.c=$(OBJ_DIR)/%.o)
DEPS			= $(SRCS:%.c=$(DEP_DIR)/%.d)

# Programs
SHELL			= /bin/bash
CC				= gcc
MKDIR			= -mkdir -p
MAKE			= -make -C
RM				= -rm -rf

# Flags
CFLAGS			= -Wall -Wextra -Werror
DEPFLAGS		= -MT $@ -MMD -MP -MF $(DEP_DIR)/$*.d
INCFLAGS		= -I $(INC_DIR) -I $(LIB_DIR)/$(INC_DIR)
LDFLAGS			= -L $(LIB_DIR)
LDLIBS			= -lft

# ANSI Escape Sequences
R_CLEAN			= \033[K
C_RESET			= \033[00m
COLOR_G			= \033[32m
COLOR_Y			= \033[33m

## all:			Call targets 'libft' and ''
PHONY			+= all
all:			libft $(NAME)
	printf "$(COLOR_G)PASS:$(C_RESET)\t$(NAME)\n"

## libft:		Build libft.a
PHONY			+= libft
libft:
	$(MAKE) $(LIB_DIR)

## .:	Build
$(NAME):		$(OBJS)
	printf "\r$(R_CLEAN)Linking: -> $@\n\t$(subst $(subst ,, ),\n\t,$^)\n"
	$(CC) $(CFLAGS) $(INCFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

## *.o:			Assemble an object file from same name *.c file
$(OBJ_DIR)/%.o:	%.c $(DEP_DIR)/%.d $(LIB_DIR)/$(LIB)
	$(MKDIR) $(@D) $(dir $(DEPS))
	printf "\r$(R_CLEAN)Assembling: $< -> $@"
	$(CC) $(CFLAGS) $(INCFLAGS) -o $@ -c $< $(DEPFLAGS)

$(DEPS):

## help:		Show help message
PHONY			+= help
help:			Makefile
	@IFS=$$'\n' ; \
	help_lines=(`sed -n 's/^##//p' $<`); \
	printf "%-10s %s\n%-10s %s\n" "Target" "Help" "----------" "------------"; \
	for help_line in $${help_lines[@]}; do \
		IFS=$$':' ; help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | tr -d ' '` ; \
		help_info=`echo $${help_split[1]} | sed -e 's/^[[:space:]]*//'` ; \
		printf "$(COLOR_Y)%-10s $(C_RESET)%s\n" $$help_command $$help_info; \
	done

## clean:		Remove object files and dependency files
PHONY			+= clean
clean:
	$(MAKE) $(LIB_DIR) clean
	$(RM) $(BLD_DIR)
	@printf "$(COLOR_G)PASS:$(C_RESET)\tmake clean\t[$(NAME)]\n"

## fclean:		Call target 'clean' and remove executable files
PHONY			+= fclean
fclean:			clean
	$(MAKE) $(LIB_DIR) fclean
	$(RM) $(NAME)
	@printf "$(COLOR_G)PASS:$(C_RESET)\tmake fclean\t[$(NAME)]\n"

## re:			Call targets 'fclean' and 'all'
PHONY			+= re
re:				fclean all

## V=1:			Enable verbose output
$(V).SILENT:

-include		$(wildcard $(DEPS))

.PHONY:			$(PHONY)
