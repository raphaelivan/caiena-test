# Caiena 
[APENAS PARA FINS DE ESTUDOS]

API criada para um teste realizado pela empresa Caiena. O objetivo da API é ter um endpoint que receba o nome de alguma cidade como paramêtro, conecte-se com o [OpenWeather](https://openweathermap.org/guide) utilizando a gem [Maju](https://rubygems.org/gems/maju). Após receber os dados de previsão dos próximos dias da cidade em questão, a API enviará um twit, criando um post em uma conta específica. 


# Dependências
Neste projeto usamos a versão 3.1 do ruby e a versão 7.0 do rails. Utilizamos o Rspec como framework de testes, através da gem rspec-rails, na versão 6.0.



```sh
ruby -v ruby 3.1.2p20
rails -v 7.0.4.2
rspec -v 3.12
```


 # Docker
 Para configuração utilizando o [Docker](https://www.docker.com/), foi criado um arquivo para configuração da imagem, o DockerFile e também, um arquivo docker-compose-yml, para configuração dos containers.


Para criar a imagem, execute o comando a baixo: 
```sh
	docker build -t caiena-test .
```

Após criar a imagem, basta executar o comando abaixo que os containers serão criados, respeitando o que foi definido no arquivo docker-compose.yml

```sh
	docker compose run -p 3000:3000 --no-deps api
```


