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
	<h1>Code Complexity Of Inheritance</h1>
	<table class="table">
	<tr>
	<thead>
		<th>Count</th>
		<th>Class Name</th>
		<th>No of direct inheritances</th>
		<th>No of indirect inheritances</th>
		<th>Total inheritances</th>
		<th>Ci</th>
	</tr>
	</thead>
	<tbody>
		<%
				Inheritan test4 = new Inheritan();
		ArrayList<Inheritance> arrayList4 = test4.inheritance(session.getAttribute("test_code").toString());
		
		for (Inheritance inheritance : arrayList4) {
			int total = inheritance.getDirect()+inheritance.getIndirect();
			
			int Ci=total;
			if(Ci==0){
				Ci=Integer.parseInt(session.getAttribute("Inheritance").toString());
			}else if(Ci==1){
                Ci=Integer.parseInt(session.getAttribute("Inheritance1").toString());
            }else if(Ci==2){
                Ci=Integer.parseInt(session.getAttribute("Inheritance2").toString());
            }else if(Ci==3){
                Ci=Integer.parseInt(session.getAttribute("Inheritance3").toString());
            }else if(Ci>4){
                Ci=Integer.parseInt(session.getAttribute("Inheritance4").toString());
            }
	%>
			<tr>
				<td><%=inheritance.getLineNumber() %></td>
				<td><%=inheritance.getClassName() %></td>
				<td><%=inheritance.getDirect() %></td>
				<td><%=inheritance.getIndirect() %></td>
				<td><%=total %></td>
				<td><%=Ci %></td>
			</tr>
			<% 
		}	
	%>
	</tbody>
	</table>
	</center>
</body>
</html>