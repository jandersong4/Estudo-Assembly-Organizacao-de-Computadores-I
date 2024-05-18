#SERIE DE FIBONACCI: 1,1,2,3,5,8,13... 
li x1,1
li x2,4 #variavel que recebe N
li x10,1
CasosDeEntrada:
	beq x2,x0,CondicaoDeParada0
    beq x2,x1,CondicaoDeParada1

#começamos o fibonacci iniciando as variaveis com 1
Fibonacci:
	mv x10,x1 #x10 =1
	mv x11,x1 #x11 = 1
	mv x12,x1 #x12 = 1

Calcular:
	sub x2,x2,x1 #Iniciamos a contagem em N e fazzemos esse contador ir decrementando
    mv x10,x11 #movemos para x10 o valor de x11 que devera começar com 1
    beq x2,x0,CondicaoDeParada #caso a posição do fibonacci escolhida for igual a 0 temos nossa condição de parada
    mv x10,x11 #caso contrario atribuimos o valor de x11 para x10
    add x10,x10,x12 #somamos o valor de x12 a x10
    
#fazemos as trocas entre as variaveis
#e em seguida repetimos o processo de calculo até encontrarmos a condição de parada
Trocar:
	mv x11,x12 
    mv x12,x10
    jal,x0,Calcular

CondicaoDeParada:
jal,x0,end

CondicaoDeParada0:
li x10,0
jal,x0,end

CondicaoDeParada1:
li x10,1
jal,x0,end

end: