#Variables
CC=g++
LIB=.
INC=cabecera
SRC=funciones
OBJ=.
BIN=.
SRC=.
LD_FLAGS=-L $(LIB) -l libbiblioteca.a
CC_FLAGS=-Wall -g -c -I $(INC)

#Reglas
todo: $(BIN)/calculaExpresiones

#Regla para el programa principal
$(BIN)/calculaExpresiones: $(OBJ)/calculadora.o $(LIB)/libfunciones.a
	$(CC) -L ./$(LIB) $< -lbiblioteca -o $@

$(OBJ)/calculadora.o: $(SRC)/calculadora.c $(INC)/calc.h
	$(CC) $(CC_FLAGS) $<

#Regla para la creación de la biblioteca
$(LIB)/libfunciones.a: $(OBJ)/stack2.o $(OBJ)/getch.o $(OBJ)/getop.o
	$(AR) -rvs $@ $^

$(OBJ)/stack2.o: stack2.c $(INC)/calc.h
	$(CC) -I ./ -c -g $<

$(OBJ)/getch.o: $(SRC)/getch.c $(INC)/calc.h
	$(CC) $(CC_FLAGS) $<

$(OBJ)/getop.o: $(SRC)/getop.c $(INC)/calc.h
	$(CC) $(CC_FLAGS) $<



clean:
	rm -f $(OBJ)/*.o

mrproper: clean
	rm -f $(LIB)/*.a
	


