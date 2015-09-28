[![Build Status](https://travis-ci.org/ottony/organizacao-de-atracao.svg?branch=good-tools)](https://travis-ci.org/ottony/organizacao-de-atracao)
[![Code Climate](https://codeclimate.com/github/ottony/organizacao-de-atracao/badges/gpa.svg)](https://codeclimate.com/github/ottony/organizacao-de-atracao)
[![Coverage Status](https://coveralls.io/repos/ottony/organizacao-de-atracao/badge.svg?branch=master&service=github)](https://coveralls.io/github/ottony/organizacao-de-atracao?branch=master)

# Dilek

O que é?
Uma aplicação para agenda de atrações

[Dilek]

http://dilek.herokuapp.com

## Acessar com usuário padrão
```
email: example@email.com
password: password
```

## Get Started

#### Instalar as dependencias:


```
bundle install

```

#### Confirgurar banco de dados:
 Criar config/database.yml.


Exemplo (config/database.yml.sample):

```
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

Rodar as migrations
```
bundle exec rake db:create db:migrate db:seed
```

#### Rodar os testes

```
bundle exec rspec
```

## Em Desenvolvimento

Por padrão, a aplicação não enviará emails, serão capturados pelo mailcatcher.

Para visializar os emails, basta rodar o mailcatcher e acessar http://localhost:1080


```
bundle exec mailcatcher
```

Caso deseje o envio real de emails, basta criar o arquivo config/smtp_config.yml

Exemplo (config/smtp_config.yml.sample):

```
address:              'smtp.gmail.com'
port:                 587
domain:               'localhost:3000'
user_name:            'YOUR_EMAIL'
password:             'YOUR_PASSWORD'
authentication:       'plain'
enable_starttls_auto: true
```

[Dilek]: <https://translate.google.com/?source=osdd#auto/en/dilek>
