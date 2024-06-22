<details>

<summary>Como testar a solução desenvolvida com firebase</summary>


* Tenha uma conta no Firebase e crie um projeto.
* No console do Firebase, adicione o seu aplicativo Flutter e siga as instruções para adicionar o Firebase ao seu projeto Flutter.
* No console do Firebase, habilite o método de autenticação que deseja utilizar (por exemplo, e-mail/senha.
* No diretório raiz do seu projeto Flutter, crie um arquivo chamado .env. Este arquivo não deve ser versionado (adicionado ao .gitignore) para manter as variáveis sensíveis seguras.
* No Firebase Console, obtenha as informações necessárias como a URL base (_url), o recurso (_resource) e a chave de API (_apiKey).
* Adicione essas informações ao arquivo .env. Por exemplo:

```
API_URL=https://identitytoolkit.googleapis.com/v1/
API_RESOURCE=accounts:
API_KEY=your_api_key_here
```

* No arquivo pubspec.yaml, adicione o pacote flutter_dotenv na seção dependencies: Execute flutter pub get para instalar o pacote.
* No AuthProvider, importe o pacote flutter_dotenv e carregue as variáveis do arquivo .env
* Substitua as variáveis _url, _resource e _apiKey diretamente pelo uso das variáveis carregadas do .env
* Após integrar as variáveis do Firebase no AuthProvider, teste as funcionalidades de cadastro (signUp) e login (signIn) para garantir que o processo de autenticação está funcionando corretamente com as variáveis corretas do Firebase.
* Chame o método signUp do AuthProvider passando um e-mail e senha válidos e verifique se a mensagem de sucesso Usuário cadastrado com sucesso! é exibida após um cadastro bem-sucedido.
* Chame o método signIn do AuthProvider passando o e-mail e senha do usuário cadastrado e verifique se a mensagem de sucesso Usuário cadastrado com sucesso! é exibida após um login bem-sucedido.

</details>

<details>

<summary>Como testar o consumo de uma API externa</summary>

FALTA

</details>

<details>

<summary>Como testar a solução com o package</summary>

### Como usar o package cepService

* Adicione às dependências do seu projeto no arquivo pubspec.yaml

```
 my_cep_pk:
    git:
      url: https://github.com/layanenu/my_cep_pk.git
      ref: main
```

* Para baixar as dependências rode o comando `flutter pub get`
* Importe o arquivo package onde irá utilizar as funções contidas no package.


### Testando o package cepService na aplicacão my_cep

* Comece clonando o projeto
  
```
git clone https://github.com/layanenu/my_cep.git
```

* Instale as dependências do projeto

```
flutter pub get
```

* Execute a aplicação em um simulador android ou ios
* Depois de fazer signup e signin, busque um endereço através do cep
* Deve buscar corretamente o endereço 
* Deve salvar o endereço no armazenamento local do dispositivo
* Ao sair e retornar ao app, o último endereço buscado deve estar salvo pois o package possui a função de busca de endereço e armazenamento do último endereço buscado


</details>
