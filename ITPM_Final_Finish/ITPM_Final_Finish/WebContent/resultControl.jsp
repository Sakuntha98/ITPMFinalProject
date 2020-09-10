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
	<h1>Code Complexity Of Control</h1>
	<table class="table">
	<tr>
	<thead>
		<th>Line no</th>
		<th>Program statements</th>
		<th>Wtcs</th>
		<th>NC</th>
		<th>Ccspps</th>
		<th>Ccs</th>
	</tr>
	</thead>
	<tbody>
		<%
			Control test3 = new Control();
		int condition= Integer.parseInt(session.getAttribute("condition").toString());
		int loop = Integer.parseInt(session.getAttribute("loop").toString());
		int switchCase= Integer.parseInt(session.getAttribute("switchCase").toString());
		int caseOnly=Integer.parseInt(session.getAttribute("caseOnly").toString());
	ArrayList<Controls> arrayList3 = test3.control(session.getAttribute("test_code").toString(),condition,loop,switchCase,caseOnly);
	
	for (Controls control : arrayList3) {
		int total = (control.getLine_weight()*control.getNo_of_control())+control.getCspps();
%>
		<tr>
			<td><%=control.getLineNumber() %></td>
			<td><%=control.getLine() %></td>
			<td><%=control.getLine_weight() %></td>
			<td><%=control.getNo_of_control() %></td>
			<td><%=control.getCspps() %></td>
			<td><%=total %></td>
		</tr>
		<% 
	}	
%>
	</tbody>
	</table>
	</center>
</body>
</html>