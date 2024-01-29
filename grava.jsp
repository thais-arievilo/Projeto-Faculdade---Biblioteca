<%@page language="java" import="java.sql.*"%>

<%
    //Criar variaveis e armazenar as informacoes digitadas pelo usuario
    String vnome = request.getParameter("txtNome");
    String vemail = request.getParameter("txtEmail");
    String vCPF = request.getParameter("txtCPF");
    String vsenha = request.getParameter("txtSenha");

    //Criar variaveis contendo informacoes do banco de dados
    String banco = "cadastro"; 
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario = "root"; 
    String senha = ""; 

    //Driver
    String driver = "com.mysql.jdbc.Driver";

    //Carrega o driver na memoria
    Class.forName( driver );

    //Criar a variavel para conectar com o banco de dados
    Connection conexao;

    //Abrir a conexao com o banco dde dados
    conexao = DriverManager.getConnection(endereco, usuario, senha);

    //Inserir no banco de dados
    String sql = "INSERT INTO usuarios (nome, email, cpf, senha) values(?,?,?,?)";

    PreparedStatement executar =  conexao.prepareStatement(sql);

    //Variaveis pela quais serao substituidos os interrogacoes
    executar.setString(1, vnome);
    executar.setString(2, vemail);
    executar.setString(3, vCPF);
    executar.setString(4, vsenha);

    //Comando para executar
    executar.execute();

    //Fechar o stm (boa pratica - abrir e fechar o stm)
    executar.close();

    //Confirmacao de que os dados foram salvos
    out.print("Dados salvos com sucesso!!");
    out.print("<br><br>");
    out.print("<a href='cadastro.html'>Voltar</a>");
%>