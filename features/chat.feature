Funcionalidade: Assistente de Ensino (Chat)
  Como um estudante
  Eu quero interagir com o chat do assistente de ensino
  Para tirar dúvidas sobre o conteúdo das aulas de forma rápida e contextualizada

  Cenário: Enviar uma dúvida com resposta contextualizada
    Dado que o estudante está autenticado na plataforma
    E acessou o módulo da disciplina de "Engenharia de Software"
    Quando ele digita a mensagem "O que é um requisito não funcional?" no campo de chat
    E clica no botão "Enviar"
    Então o sistema deve exibir a pergunta no histórico da conversa
    E o assistente deve responder com a definição e exemplos de requisitos não funcionais
    E o tempo de resposta deve ser inferior a 5 segundos

  Cenário: Tentar enviar uma mensagem vazia
    Dado que o estudante está com a janela do chat aberta
    Quando ele tenta enviar o formulário com o campo de texto vazio
    Então o sistema não deve registrar o envio da mensagem
    E deve exibir uma indicação visual de que o campo não pode estar em branco
    E o foco do cursor deve permanecer no campo de entrada

  Cenário: Interromper a geração de uma resposta longa
    Dado que o estudante enviou a pergunta "Explique o ciclo de vida Scrum em detalhes"
    E o assistente iniciou a transmissão da resposta em tempo real
    Quando o estudante clica no botão "Parar geração"
    Então o assistente deve cessar a geração de texto imediatamente
    E a mensagem parcial gerada até aquele instante deve permanecer visível no histórico
    E o campo de entrada de texto deve ser reabilitado para novas mensagens

  Cenário: Envio offline de dúvida com sincronização automática em segundo plano
    Dado que o estudante está autenticado e com o chat aberto
    E o dispositivo perdeu o acesso à internet
    Quando ele envia a mensagem "Como funciona o polimorfismo?"
    Então o sistema deve registrar a mensagem em uma fila local (outbox) e exibi-la imediatamente com o status "Aguardando conexão"
    E o campo de digitação deve permanecer liberado para novas mensagens
    E quando a conectividade for restabelecida
    Então o sistema deve disparar o reenvio automático da fila na ordem cronológica
    E atualizar o status para "Entregue" sem exigir intervenção manual do estudante