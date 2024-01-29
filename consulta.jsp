<%@page language="java" import="java.sql.*"%>
<!-- Esta importando a biblioteca de java -->

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Consulta</title>
        <meta charset="utf-8">
    </head>
    <body>

        <%
            //Informacoes do banco de dados
            String banco = "cadastro"; 
            String endereco = "jdbc:mysql://localhost:3306/"+banco;
            String usuario = "root"; 
            String senha = ""; 

            //Driver - padrão de comunicacao 
            String driver = "com.mysql.jdbc.Driver";

            //Carrega o driver na memoria
            Class.forName( driver );

            // Criar a variavel para conectar com o banco de dados
            Connection conexao;

            //Abrir a conexao com o banco dde dados
            conexao = DriverManager.getConnection(endereco, usuario, senha);

            String sql = "SELECT * FROM usuarios";

            //Serve para executar o banco de dados
            PreparedStatement executar  =  conexao.prepareStatement(sql);

            //Criar a variavel para armazenar informacoes da consulta no banco
            ResultSet dados = executar.executeQuery();

            //Condição que irá mostrar os dados dentro do banco
            out.print("<table border=1 width='500'>");
            out.print("<tr>");
                out.print("<td>Nome</td>");
                out.print("<td>E-mail</td>");
                out.print("<td>CPF</td>");
                out.print("<td>Senha</td>");
            out.print("</tr>");
            while ( dados.next() ) {
                out.print("<tr>");
                    out.print("<td>");
                        out.print( dados.getString("nome"));
                    out.print("</td>");

                    out.print("<td>");
                        out.print( dados.getString("email"));
                    out.print("</td>");

                    out.print("<td>");
                        out.print( dados.getString("cpf"));
                    out.print("</td>");

                    out.print("<td>");
                        out.print( dados.getString("senha"));
                    out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        %>

    </body>
</html>