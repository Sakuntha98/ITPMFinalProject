<%@page import="service.*"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Control Result</title>

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: #FFF5EE;
}

table, td, th {
  border: 2px solid black;
  
}

table {
  border-collapse: collapse;
  width: 75%;
}

th, td {
  text-align: left;
  padding: 15px;
}


th {
  background-color: #F4A460;
  color: black;
  text-align: left;
}
</style>
</head>
<body>
	<center>
	<h1> Code Complexity Of Variables </h1>
	<table class="table">
	<tr>
	<thead>
		<th>Line no</th>
		<th>Program statements</th>
		<th>Wvs</th>
		<th>Npdtv</th>
		<th>Ncdtv</th>
		<th>Cv</th>
	</tr>
	</thead>
	<tbody>
		<%
		Variable test1 = new Variable();
		ArrayList<Variables> arrayList1 = test1.variable(session.getAttribute("test_code").toString());
		
		for (Variables variables : arrayList1) {
			
			int Wvs =(variables.getGlobal()*Integer.parseInt(session.getAttribute("variableGlobal").toString()))+(variables.getLocal())*Integer.parseInt(session.getAttribute("variableLocal").toString());
            
            int Npdtv = variables.getGlobal()+variables.getLocal();
            
            int Cv = Wvs*((Npdtv*Integer.parseInt(session.getAttribute("variablePrimitive").toString()))+(variables.getComposite()*Integer.parseInt(session.getAttribute("variableComposite").toString())));
			
	%>
			<tr>
				<td><%=variables.getLineNumber() %></td>
				<td><%=variables.getLine() %></td>
				<td><%=Wvs %></td>
				<td><%=Npdtv %></td>
				<td><%=variables.getComposite() %></td>
				<td><%=Cv %></td>
			</tr>
			<% 
		}	
	%>
	</tbody>
	</table>
	</center>
</body>
</html>