#Nome: Janderson
#Matricula: 2020054544
#O objetivo é conseguir fazer o calculo de capacitancia C = Q/V.
#Para fazer esse calculo teremos representando cada variavel os respectivos registradores
# C = Q/V
# Capacitancia C = x10
# Carga Q = x11
# Tensão Eletrica V = x12

#Para testar o programa irei atribuir um valor a cada variavel.
#A variavel de capacitancia (C) será iniciada com o valor 0

li x10, 5 #C
li x11, 10 #Q
li x12, 0 #V

#Temos os seguintes casos possíveis
# C =?
# C = ? Q=0 V= dontcare (zera tudo)
# C = ? Q =valor V=valor
# C= ? Q = valor V = 0 (zera tudo)

#C = valor Q = valor V = ?
#C = valor Q = ? V = valor

#C = 0 Q=0 V=0 (zera tudo)

#testes para descobrir se pelo menos 2 variaveis são diferentes de 0
#caso x10 seja Zero então temos C = 0 , logo faremos a conta Q/V para descobrir o valor de C
#caso X11 seja Zero então consequentemente temos os valores de todas as variaveis zeradas como informado no TP
#não precisamos testar V igual a 0 pois como as duas anteriores são 0 o V tbm será pois teremos Q/V e como 0 dividido por qualquer numero é igual a 0 não faz diferença
#caso C ou Q não sejam 0 faremos as operações para encontrar seus valores

TesteVariaveis1:
    bne x10, x0, TesteVariaveis2
    bne x11, x0, TesteVariaveis3
    jal zerador
    
jal x0,end

#Temos x10!= 0
#se Q = 0 fazemos C*V (calculo carga)
#se V = 0 fazemos Q/C (calculo tensao)
TesteVariaveis2:
	beq x11,x0,CalculoCarga
	beq x12,x0,CalculoTensao
    
#Temos C=0 Q=valor e V=0
TesteVariaveis3:
	beq x12, x0, zerador
    jal CalculoCapacitancia
    
	

 #temos x10 =0, então faremos Q/V
CalculoCapacitancia:
	div x10,x11,x12
	jal x0,end


CalculoCarga: #Q = C*V
	mul x11,x10,x12
    jalr x0,x1,0
    
CalculoTensao: #V=Q/C
	div x12,x11,x10
	jal x0, end
    
 zerador:	# função na qual os condicionais levarão quando tiver mais de uma variável = 0
    mv x10, x0		# atribui zero à todas variáveis 
    mv x11, x0
    mv x12, x0
    jal x0,end
    
end: