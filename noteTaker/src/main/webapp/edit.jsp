<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.factoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
<div class="container ">

		<%@include file="navbar.jsp"%>
		<h1>Edit your Note</h1>
		<br>
		<% 
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s= factoryProvider.getFactory().openSession();
		
		Note note =(Note)s.get(Note.class, noteId);
		
		
		%>
		
		<form action= "UpdateServlet" method="post">
		
		<input value ="<%=note.getId() %> " name="noteId" type="hidden"/>
			<div class="mb-3">
				<label for="title" 
				class="form-label">Note Title</label> 
				<input
					 name="title"
					 required type="text" 
					 class="form-control" 
					 id="title"
					 aria-describedby="emailHelp"
					 placeholder="enter here" 
					 value="<%=note.getTittle() %>"/>
				<div class="form-text">We'll never share your note with anyone
					else.</div>
			</div>
			<div class="mb-3">
				<label for="content">Note Content </label>
				<textarea name="content" 
							required id="content"
							placeholder="Enter Your content here" class="form-control"
							style="height: 300px">
							<%=note.getContent() %></textarea>

			</div>
			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save Your Note</button>
			</div>
		</form>
		</div>
</body>
</html>