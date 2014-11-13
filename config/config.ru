#\ -w

use Rack::Static, :urls => {"/" => 'index.html'}, :root => "#{ENV['OPENSHIFT_ELASTICSEARCH_DIR']}/kibana"
run Rack::File.new("#{ENV['OPENSHIFT_ELASTICSEARCH_DIR']}/kibana")
