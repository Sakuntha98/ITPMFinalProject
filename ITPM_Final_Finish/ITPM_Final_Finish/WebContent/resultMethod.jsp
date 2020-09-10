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
	<h1>Code Complexity Of Methods</h1>
	<table class="table">
	<tr>
	<thead>
		<th>Line no</th>
		<th>Program statements</th>
		<th>Wmrt</th>
		<th>Npdtp</th>
		<th>Ncdtp</th>
		<th>Cm</th>
	</tr>
	</thead>
	<tbody>
	
	<%
		Method test2 = new Method();
		ArrayList<Methods> arrayList2 = test2.method(session.getAttribute("test_code").toString());
		
		for (Methods methods : arrayList2) {
			
			int Wmrt =(methods.getComposite_method()*Integer.parseInt(session.getAttribute("methodComposite").toString()))+(methods.getPrimitive_method()*Integer.parseInt(session.getAttribute("methodPrimitive").toString()));
		          
          	int Cm = Wmrt+((methods.getPrimitive_parameters()*Integer.parseInt(session.getAttribute("methodPrimitiveData").toString()))+(methods.getComposite_parameters()*Integer.parseInt(session.getAttribute("methodCompositeData").toString())));
			
			
		%>
		<tr>
			<td><%=methods.getLineNumber() %></td>
			<td><%=methods.getLine() %></td>
			<td><%=Wmrt %></td>
			<td><%=methods.getPrimitive_parameters() %></td>
			<td><%=methods.getComposite_parameters() %></td>
			<td><%=Cm %></td>
		</tr>
		<% 
		}	
		%>
	
	</tbody>
	</table>
	</center>
</body>
</html>