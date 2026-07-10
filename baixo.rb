require 'sinatra'
require 'json'

require_relative 'aluno'
require_relative 'sistema'

set :public_folder, 'public'

SISTEMA = Sistema.new

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

post '/alunos' do
  dados = JSON.parse(request.body.read)

  aluno = SISTEMA.cadastrar(
    dados["nome"],
    dados["matricula"],
    dados["nota1"].to_f,
    dados["nota2"].to_f
  )

  content_type :json
  aluno.to_json
end

get '/alunos' do
  content_type :json
  SISTEMA.alunos.to_json
end

put '/alunos/:id' do
  dados = JSON.parse(request.body.read)

  SISTEMA.atualizar(
    params[:id].to_i,
    dados["nota1"].to_f,
    dados["nota2"].to_f
  )

  "ok"
end

post '/recuperacao/:id' do
  dados = JSON.parse(request.body.read)

  SISTEMA.recuperacao(
    params[:id].to_i,
    dados["nota"].to_f
  )

  "ok"
end

get '/relatorio' do
  content_type :json
  SISTEMA.relatorio.to_json
end
