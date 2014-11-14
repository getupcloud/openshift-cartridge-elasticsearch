[Versão Português](https://github.com/getupcloud/openshift-elasticsearch-cartridge/blob/master/README_pt.md)

OpenShift Elasticsearch Cartridge
=================================
This cartridge provides an Elasticsearch cluster as a standalone application with a kibana dashboard served and accessible by targetting the index page `/index.html`.

In order to create your application, first you need to register at Getup Cloud.
Go to http://getupcloud.com/#/sign-up and signup for free.
You receive a free 750h trial to test our services.

To create your Elasticsearch app, run:

    rhc app-create <app> http://reflector-getupcloud.getup.io/github/getupcloud/openshift-cartridge-elasticsearch

If you want to create a Elasticsearch cluster, append the flag `--scaling`:

    rhc app-create <app> http://reflector-getupcloud.getup.io/github/getupcloud/openshift-cartridge-elasticsearch --scaling

Adding additional cluster nodes
===============================
To add more nodes to the cluster, simply add more gears:

    rhc cartridge-scale -a <app> getup-elasticsearch <number of total gears you want>


Plugins
=======
To install Elasticsearch plugins, edit the `plugins.txt` file, commit, and push your changes.

    cd elasticsearch
    vim plugins.txt
    git commit -a -m 'Incluindo plugin XYZ'
    git push

You can also install plugins from a .zip file. Simply place it inside dir `plugins/`, git add, commit and push.

Configuration
=============

Configuration is build on-the-fly and starts with contents from file
config/elasticsearch.yml.erb, concatenated with any other file found in that
same dir (except for logging.yml and elasticsearch.in.sh). Files ending with
.erb will be pre-processed using ruby's erb command.

Credits
=======
Based on initial work from https://github.com/ncdc/openshift-elasticsearch-cartridge.

License
=======
This project is licensed under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).
