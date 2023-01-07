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
- Refino do sistema de autenticação e de background tasks;
- Deploy do projeto;
### Acredito que o grande valor desse curso, para meu aprendizado, foi a utilização de signal, actions, e principalmente as background tasks.
### O primeiro, consiste em funções do sistema que são executadas após algo acontecer, por exemplo, após salvar uma task como concluída no banco de dados, o sistema automaticamente atribui os pontos ao time, e checa se a task list à qual a mesma foi atribuída está completa também.
### O segundo, cria um novo botão na interface do DRF, que realiza uma ação (como entrar num time), porém seu maior valor está em criar uma url à qual poderão ser realizadas post requests, por exemplo, para executar determinada ação
### O último consiste em tasks que rodarão periodicamente no sistema (calcular a quantidade de tasks concluidadas de cada time a cada 10 segundos). Embora nessa aplicação não tenha muito sentido essa checagem, esse tipo de task é muito utilizado no mercado. Infelizmente a biblioteca que o instrutor utiliza nas aulas não tem suporte para Django 4.0, foi necessário utilizar a biblioteca celery no lugar.

## Como rodar:

### Inicialize o ambiente virtual, ative-o, e instale os requisitos do arquivo requirements.txt
```pip install -r requirements.txt```

### Deve ser criado um schema no mysql chamado "taskly_api", para isso, copie o código do arquivo database.sql, e cole no workbench ou onde preferir
```
cd src
./manage.py makemigrations
./manage.py migrate
```
### Renomeie o arquivo .env-exemplo para .env, e coloque seus dados pessoais no mesmo.
### A solução padrão de armazenamento de imagens criará uma pasta para salvá-las dentro da pasta do projeto, mas é possível utilizar o google cloud, para isso, preciso criar uma conta no google cloud storage e conectá-la, por meio do arquivo gerado, à aplicação, além de comentar, no final de setting.py, a parte que gera o caminho na pasta do arquivo, e descomentar a parte sobre o google cloud. No google cloud, será necessário criar um bucket, e uma conta de serviço, a qual gerará uma key, um arquivo que deverá ser posto dentro de src, e seu nome copiado em "service_account.Credentials.from_service_account_file('aqui dentro')", nas settings.
### O último passo antes de rodar a aplicação, é criar um servidor redis na máquina, para as background tasks, e ele precisa rodar o sistema operacional linux para isso. Se estiver utilizando windows, como eu, é so baixar o WSL2, da microsoft, e rodar os seguintes comando num terminal linux (os passos a seguir são iguais para linux e windows):
```
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
sudo apt-get install redis

sudo service redis-server start
```
### Pronto, agora, para rodar o programa, abra 3 terminais, e execute os seguintes comandos, de dentro da pasta src (é recomendado criar um superuser antes, para poder interagir com a mesma):
```
./manage.py runserver

celery -A taskful_api beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler

celery -A taskful_api worker -l info -P gevent
# Nesse último, a flag -P gevent só é necessária no windows, e não no linux
```
### Com isso, o programa estará rodando num servidor local, e executando as background tasks.

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