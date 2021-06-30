//Programa:Assistente virtual - TESTE 1
//VERSÃO: v1

//Desenvolvido por PEDRO ROSEMBERG MARKETING E TECNOLOGIA SA℠    [36.339.282/0001-01]
//Código de Uso Exclusivo de ´Pedro Rosemberg da Silva Oliveira´.
//Todos os direitos reservados. Copyright ©2021. All rights reserved.
//Propriedade Intelectual e de Software.


// 1 - JÁ FAZ: 
		// a. Retorna e armazena nº de Protocolo do atendimento | b. Possibilidade ed alterar os dados (nome, sobrenome, celular ou telefone e e-mail)
		// c. Informa e armazena o nome do atendente disponível | c. Possibilita a escolha de um setor e informa ao atendente qual setor foi escolhido pelo usuário

// 2 - FALTA INCLUIR
		// a. Atendimento em horário comercial | b. Envio de histórico, protocolo e dados coletados para o e-mail do usuário com cópia ao atendente
		// c. Informa qual canal/origem do usuário (telegram, site, whatsapp ou e-mail) | d. armazena os dados do usuário em bancoo de dado
		// e. pede altorização para coletar, tratar e armazenas os dados do usuário (primeira coisa) -> cria um link do diretório onde os dados do usuáraaio estão e envia para ele para que ele possa consultá-las [Exemplo na linha de baixo]
			
			//Ex.:       	  	 http://everplus.rosemberg.com.br/user51654984651/26-06-2021/01-52-53/ip-sha1&ssl
			//Detalhamento =	protocolo//link/nick_do_email+protocolo_de_atendimento/data/hora/ip-tipos_de_identificacao_no_diretorio
					//porta1A	http://everplus.rosemberg.com.br/pedrorosembergdev3633928200010110332519686/29-06-2021/01-56-20/ip-sha1&ssl&ete.phpx
 
programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> t
	inclua biblioteca Calendario --> c
	inclua biblioteca Internet --> i
	inclua biblioteca ServicosWeb --> w
	
	funcao inicio()
	{
		logico sim,no //Entrada auxiliar
		sim=verdadeiro //Entrada auxiliar - Não utilizada
		no=falso //Entrada auxiliar - Não utilizada
		inteiro contador=0
			//Define o que irá ser exibido, seus valores e demais detalhes relacionados ao setores da instituição
		inteiro setor,comercial=1,secretaria=2,marketing=3,financeiro=4,ouvidoria=5
		cadeia setores[][]={{"comercial"},{"secretaria"},{"marketing"},{"financeiro"},{"ouvidoria"}}
			//Define as configurações dos atendentes que estão on-line
		cadeia atendentes[][]={{"Olivia"},{"Fernando"},{"Paulo"},{"Ricardo"},{"Larissa"}}
		cadeia avalie[][]={{"Ruim"}}
		const inteiro lista=0
		inteiro atendente,avaliacao
		cadeia n_avaliacao[][]={{"1","Péssimo"},{"2","Ruim"},{"3","Regular"},{"4","Bom"},{"5","Ótimo"}}
		atendente=Util.sorteia(1,5)
			//Define o sexo/gênero do usuário para melhorar o diálogo
		inteiro masculino=1,feminino=2,neutro=3,outro=3,protocolo
			//Define as strings do usuário para que possamos identificá-lo(a)
		cadeia  nome,sobrenome,telefone,celular,email,vinculo,comentario
		protocolo=u.sorteia(10000,999999999)
				escreva("Bem vindo(a) ao EveryPlus Chat" + "\n")
				u.aguarde(2000)
				escreva("\n" + "Anote o seu número de Protocolo: " + protocolo + "\n")
				u.aguarde(2500)
					//Identificação
					escreva("\n")
			escreva ("Olá! É muito bom ter você comigo!" + "\n" + "Para que possamos você possa ter uma experiência completa, insira seu nome abaixo" + "\n" + "Nome: ")
				leia(nome)
			escreva ("E qual o seu sobrenome?" + "\n" + "Sobrenome: ")
				leia(sobrenome)
					//Celular ou Telefone
			escreva("\n" + "Muito prazer! " + "\n" + "E para que possamos manter o contato com você, qual o seu celular ou telefone?" + "\n" + "Celular ou Telefone (Inclua apenas os números com DDI e DDD): ")
				leia(celular)
					//E-mail	
			escreva("\n" + "Os dados foram salvos com sucesso!" + "\n" + "Agora inclua o seu e-mail, por favor. Será através dele que iremos te identificar em nosso sistema." + "\n" + "E-mail: ")
				leia(email)
			inteiro confirmacao,confirmacao2,menu
				//Confirmação dos dados
			escreva("\n" + "Você confirma os dados informados?" + "\n")
			escreva("\n" + "Nome completo: " + nome + " " + sobrenome + "\n" + "Celular ou Telefone: " + celular + "\n" + "E-mail: " + email + "\n")
			escreva("\n" + "Digite: " + "\n" + "1-Sim ou 2-Não" + "\n") //Pedido de confirmação dos dados coletados
				leia(confirmacao)
				Util.aguarde(900)		
					se (confirmacao!=1){ //Período de confirmação dos dados
						faca{
							escreva("Qual informação você quer alterar?" + "\n" + "Digite: " + "\n" + "0-Confirmar" + "\n" + "1 - Nome" + "\n" + "2 - Sobrenome" + "\n" + "3 - Celular" + "\n" + "4 - E-mail" + "\n" + "Digite: ")
							leia(menu)
							escolha (menu)
							{
								caso 1: //Atualiza o NOME
									escreva ("Coloque seu nome atualizado: ")
									leia(nome)
										pare
								caso 2: //Atualiza o Sobrenome
									escreva("Coloque o seu sobrenome atualizado: ")
									leia(sobrenome)
										pare
								caso 3: //Atualiza o Celular/Telefone
									escreva("Coloque o seu número de telefone ou celular atualizado (não se esqueça de incluir o DDD e DDI): ")
									leia(celular)
										pare
								caso 4: //Atualiza o E-MAIL
									escreva("Coloque o seu e-mail atualizado: ")
									leia(email)
										pare
								caso contrario:
										pare
							}
						}enquanto (menu!=0)
					}senao{}
			Util.aguarde(900)
			escreva("Agora que finalizamos sua identificação, qual setor você gostaria de conversar?" + "\n" + "\n" + "Escolha o setor: " + "\n" + "1 - Comercial" + "\n" + "2 - Secretaaria Acadêmica" + "\n" + "3 - Marketing" + "\n"  + "4 - Financeiro" + "\n" + "5 - Ouvidoria" + "\n" + "\n")
			leia(setor) //Leitura de qual setor a pessoa quer falar
				Util.aguarde(1200)
			faca{
				escolha (setor)
				{
					caso 1: //Setor comercial
						escreva ("\n" + "Você está sendo redirecionado para o atendimento Comercial." + "\n" + "Em breve, um atendente irá entrar em nossa conversa. Mantenha essa aba aberta, por favor." + "\n")
							setor=1
						pare
					caso 2: //Secretaria Acadêmica
						escreva ("\n" + "Você está sendo redirecionado para o atendimento da Secretaria Acadêmica." + "\n" + "Em breve, um um atendente irá entrar em nossa conversa. Mantenha essa aba aberta, por favor." + "\n")
							setor=2
						pare
					caso 3: //Marketing e Comunicação
						escreva ("\n" + "Você está sendo redirecionado para o setor de Marketing e Comunicação." + "\n" + "Em breve, um um atendente irá entrar em nossa conversa. Mantenha essa aba aberta, por favor." + "\n")
							setor=3
						pare
					caso 4: //Financeiroatendentes[atendente-1][lista]
						escreva ("\n" + "Você está sendo redirecionado para o atendimento Financeiro." + "\n" + "Em breve, um um atendente irá entrar em nossa conversa. Mantenha essa aba aberta, por favor." + "\n")
							setor=4
						pare
					caso 5: //Ouvidoria
						escreva ("\n" + "Você está sendo redirecionado para a Ouvidoria." + "\n" + "Em breve, um um atendente irá entrar em nossa conversa. Mantenha essa aba aberta, por favor." + "\n")
							setor=5
						pare
					caso contrario: //Pede o retorno da entrada dos dados, já que não foram inseridos
						escreva("\n" + "Entrada não reconhecida." + "\n" + nome + ", favor selecionar uma opção." + "\n" + "1 - Comercial" + "\n" + "2 - Secretaaria Acadêmica" + "\n" + "3 - Marketing" + "\n"  + "4 - Financeiro" + "\n" + "5 - Ouvidoria" + "\n")
						leia(setor)
						pare
				}	}enquanto (setor>5 ou setor<1)
								u.aguarde(2000)	
								escreva("\n" + "\n" + atendentes[atendente-1][lista] + " entrou na conversa..." + "\n")
								escreva ("\n" + atendentes[atendente-1][lista] + " diz: " + "\n" + "\n" + "Olá, " + nome + "!" + " Vi que você solicitou atendimento para o setor " + setores[setor-1][lista] + "." + "\n")
								escreva("Caso não tenha anotado o seu número de protocolo, é " + protocolo + ". Em que posso ajudar?" + "\n")
								leia(comentario)
								escreva("Enviando...")
									u.aguarde(3000)
								escreva("Oops!" + "\n" + "\n" + "Parece que a sua rede caiu..." + "\n" + "\n" + "Iremos te retornar em breve!" + "\n" + "\n" + "\n" + "Chat encerrado " + "\n" + "\n")
								escreva("Avalie o nosso atendimento: ")
								leia(avaliacao)

								//cadeia => n_avaliacao
								//inteiro -> avaliacao
								//índices => 1 a 5
								
}} 
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 7652; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */