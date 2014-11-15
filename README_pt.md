OpenShift Elasticsearch Cartridge
=================================
Este cartucho disponibiliza uma aplicação Elasticsearch para a plataforma Getup Cloud OpenShift.

Para criar sua aplicação Elasticsearch, primeiro vcê precisa registrar-se na Getup.
Acesse http://getupcloud.com/#/sign-up e faça seu cadastro.
Você recebe gratuitamente 750hs para testar a plataforma.

Para criar sua app Elasticsearch, execute no terminal:

    rhc app-create <app> http://reflector-getupcloud.getup.io/github/getupcloud/openshift-cartridge-elasticsearch

Se deseja criar um cluster Elasticsearch, inclua a opção `--scaling` no comando:

    rhc app-create <app> http://reflector-getupcloud.getup.io/github/getupcloud/openshift-cartridge-elasticsearch --scaling

Adicionando nodes ao cluster
============================
Para adicionar novos nodes ao cluster, simplesmente adicione gears a sua aplicação:

    rhc cartridge-scale -a <app> getup-elasticsearch <número total de gears>

Plugins
=======
Para instalar plugins, edite o arquivo `plugins.txt` e publique as alterações. O arquivo possui alguns exemplos prontos, basta descomentar as linhas desejadas.

    cd elasticsearch
    vim plugins.txt
    git commit -a -m 'Incluindo plugin XYZ'
    git push

Você ainda pode instalar plugins a partir de arquivos zip. Basta colocá-los no diretorio `plugin/`, comitar e publicar.

Configuração
============
As configurações são construidas durante o deploy, iniciando com o conteúdo do arquivo `config/elasticsearch.yml.erb`, concatenado com os arquivos encontrados em `/config` (com exceção de `logging.yml` e `elasticsearch.in.sh`). Arquivos com extensão `.erb` serão pre-processados usango o comando `ruby erb`.

Kibana & Nginx
==============
Graças ao [@popox](https://github.com/popox) agora temos suporte ao Kibana! Basta apontar seu navegador para `/kibana` e _voilà_! Tanto o ES quanto o Kibana são servidos a partir do nginx. Você pode configurar o nginx editando o arquivo `nginx.conf.erb` na raiz do repositório git.

Créditos
========
Baseado no trabalho inicial de https://github.com/ncdc/openshift-elasticsearch-cartridge.

Licença
=======
Este projeto é licenciado sob [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).
