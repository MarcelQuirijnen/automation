file 'specs' do
   content "#{ (node['memory']['total'].to_f / 1024 / 1024).round(1).to_s + ' GB' }"
end
