.data #usado para inicializar variaveis imediaetamente
A: .word 27,16,20,49,39,48,38,7,5,19 #definimos os numeros contidos dentro do array e consequentemente seu tamanho

.text
la   x10, A          # Usamos o load address para armazenar o endereço do array A no registrador x10
addi x11, x0, 10     # colocamos o tamanho do array no registrador x11
addi x5,  x0, 0      # variavel  i
addi x6,  x0, 0      # variavel j
addi x7,  x0, 0      # variavel temp


Loop1:
    bge x5, x11, exit #caso a variavel i(x5) sejam maior que o tamanho do vetor(10) paramos o loop
    addi x6, x5, 0 #caso contrario a variavel j recebera o valor da variável i

#A partir daqui executamos a logica de ordenação 
Loop2:
    addi x6, x6, 1 #j++
    bge x6, x11, END #caso j seja maior que o tamanho do array(10) o loop é parado
    slli x28, x5, 2 #shifta o i para que possamos andar pelo array pelo seu endereço de memoria
    slli x29, x6, 2 #shifta o j para que possamos nos movimentar pelo array pelo seu endereço de memoria
    add x28, x28, x10 # o endereço de x10 é passado para x28 (posição i)
    add x29, x29, x10 # o endereço de x10 shiftado é passado para x29 (posição i+1)
    lw x30, 0(x28) #x30 recebe o valor que esta armazenado no endereço x28
    lw x31, 0(x29) #x31 recebe o valor que esta armazenado no endereço x29
    bge x31, x30, Loop2 #caso x31 seja maior ou igual a x30 pular para loop2 e repeteindo o processo e incrementando i e j quando necessário
    addi x7, x30, 0 #caso contrario a variavel temporaria x7 = x30
    sw x31, 0(x28) #x31 é guardada na memoria
    sw x7, 0(x29)  #x7 é guardada na posição seguinte de memoria
    jal x0, Loop2	#recomeça o loop
END:
    addi x5, x5, 1 #i++
    jal x0, Loop1 #voltamos para o loop 1

#finaliza o programa
exit:
nop