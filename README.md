[![Build Status](https://travis-ci.org/ottony/organizacao-de-atracao.svg?branch=good-tools)](https://travis-ci.org/ottony/organizacao-de-atracao)
[![Code Climate](https://codeclimate.com/github/ottony/organizacao-de-atracao/badges/gpa.svg)](https://codeclimate.com/github/ottony/organizacao-de-atracao)
[![Coverage Status](https://coveralls.io/repos/ottony/organizacao-de-atracao/badge.svg?branch=master&service=github)](https://coveralls.io/github/ottony/organizacao-de-atracao?branch=master)

# Dilek

http://dilek.herokuapp.com

## Acessar com usuário padrão
```
#!shell

email: example@email.com
password: password
```

## Get Started

#### Confirgurar banco de dados:
 Criar config/database.yml.


Exemplo (config/database.yml.sample):

```
#!yml
default: &default
  adapter: sqlite3
  pool: 5
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

test:
  <<: *default
  database: db/test.sqlite3

```

#### Instalar as dependencias:


```
#!ruby

bundle install

```

#### Rodar os teste

```
#!ruby

bundle exec rspec
```

## Em Desenvolvimento

Por padrão, a aplicação não enviará emails, serão capturados pelo mailcatcher.

Para visializar os emails, basta rodar o mailcatcher e acessar http://localhost:1080


```
#!shell

bundle exec mailcatcher
```

Caso deseje o envio real de emails, basta criar o arquivo config/smtp_config.yml

Exemplo (config/smtp_config.yml.sample):

```
#!yml

address:              'smtp.gmail.com'
port:                 587
domain:               'localhost:3000'
user_name:            'YOUR_EMAIL'
password:             'YOUR_PASSWORD'
authentication:       'plain'
enable_starttls_auto: true
```
