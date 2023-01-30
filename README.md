# Taskly_app

## Curso DRF Udemy

### Curso realizado pela Udemy, com enfoque em Django Rest Framework, no desenvolvimento de uma api com funcionalidades similares ao aplicativo já existente Trello. Basicamente, o projeto consiste numa aplicação, na qual usuários serão designados a times, e esses times terão suas listas de tarefas, com várias tarefas (tasks). Dentre os tópicos abordados até agora, vale ressaltar:
- Autenticação OAuth2 com social django;
- Organização das entidades (usuários, times e tasks) em apps separados;
- Utilização de actions nas viewsets, possibilitando um menu de seleção e urls que realizam alguma ação;
- Utilização de signals;
- Utilização de background tasks;
- Aprofundamento no conceito de permissions e autenticação com Django;
### Proximos passos:
- Criação de testes;
- Refino da documentação/referências;
### Recursos implementados pelo autor:
- Aplicação Dockerizada
### Acredito que o grande valor desse curso, para meu aprendizado, foi a utilização de signal, actions, e principalmente as background tasks.
### O primeiro, consiste em funções do sistema que são executadas após algo acontecer, por exemplo, após salvar uma task como concluída no banco de dados, o sistema automaticamente atribui os pontos ao time, e checa se a task list à qual a mesma foi atribuída está completa também.
### O segundo, cria um novo botão na interface do DRF, que realiza uma ação (como entrar num time), porém seu maior valor está em criar uma url à qual poderão ser realizadas post requests, por exemplo, para executar determinada ação
### O último consiste em tasks que rodarão periodicamente no sistema (calcular a quantidade de tasks concluidadas de cada time a cada 10 segundos). Embora nessa aplicação não tenha muito sentido essa checagem, esse tipo de task é muito utilizado no mercado. Infelizmente a biblioteca que o instrutor utiliza nas aulas não tem suporte para Django 4.0, foi necessário utilizar a biblioteca celery no lugar.

## Como rodar:
### Para rodar a aplicação, será necessario ter o docker instalado em sua máquina, em qualquer versão.
### Renomeie o arquivo .env-exemplo para .env, e coloque seus dados pessoais no mesmo.
### A solução padrão de armazenamento de imagens criará uma pasta para salvá-las dentro da pasta do projeto, mas é possível utilizar o google cloud, porém, como o projeto foi passado para o docker, o gerenciamento de imagens e static files do projeto foi migrado para os volumes do docker, e assim persistidos.
### O último passo antes de rodar a aplicação, é construir as imagens, volumes, e rodar os containers, para isso, rode os seguintes comandos no terminal da raíz do projeto:
```
docker build .
docker-compose build
docker-compose up
```
### Com isso, o programa estará rodando num servidor local, e executando as background tasks. As vezes, ao utilizar o último comando pela primeira vez, dê erro, apenas cancele no terminal e rode de novo o último
### Ao parar a aplicação, é uma boa prática utilizar o seguinte comando para encerrar os containers:
```
docker-compose down
```
### Ao rodar a aplicação, utilize o seguinte comando, em outro terminal, para criar um superuser:
```
docker-compose run --rm app sh -c "python manage.py createsuperuser"
```
### O recomendado é criar dois usuários com esse comando: admin/root ou como desejar chamar o administrador do site, e o management, responsável pelo gerenciamento do JWT authentication. Para isso, entre no endpoint /admin, logue com o root, va na aba DJANGO OAUTH TOOLKIT, em applications, add new application. Nessa aba, salve o client id e client secret, pois o último sera encriptografado após a criação da aplicação. designe, em user, o usuário management, client type confidential, Authorization grant type Resource owner password-based.
## Endpoints:

- http://127.0.0.1:8000/api/accounts/users/ - lista todas as contas e perfis
- http://127.0.0.1:8000/api/accounts/users/{id}/ - perfil da pessoa com id tal
- http://127.0.0.1:8000/api/team/teams/ - lista todos os times
- http://127.0.0.1:8000/api/team/teams/{id} - página de um time específico
- http://127.0.0.1:8000/api/team/teams/{id}/join/ - join em um time com o id especificado (mesma lógica para leave/kick)
- http://127.0.0.1:8000/api/task/tasks/ - lista as tasks do seu time
- http://127.0.0.1:8000/api/task/tasks/{id}/update_task_status/ - utilizado para marcar uma task como completa/nao completa
- http://127.0.0.1:8000/api/task/tasklists/{id}/ - mostra a tasklist com o id específico - acessado a partir do time/task
- http://127.0.0.1:8000/api/task/attachments/{id}/ - só acessado a partir das tasks, mostra o attachment (anexo) da mesma
- http://127.0.0.1:8000/admin/ - página do admin da página
## Testando aplicação:
### Para testar a aplicação, pode simplesmente rodá-la no navegador, porém, para ações complexas, é recomendado usar um programa, por exemplo Postman, para enviar requests, no root do projeto, há um arquivo chamado taskly api.postman_collection.json, com alguns testes prontos, apenas dê um import dentro do postman.