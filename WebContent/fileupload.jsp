<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
  #f1
  {
     width:100px;
     height:50px;
     border-radius:10px;
  }
  
 form
  {
    background:linear-gradient(#66ccff 0%,#999966 100%);
    height:700px;
  }
</style>
<body>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
  <center>
    <h1><i>Select Photos And Videos that you want to Add:</i></h1>
    <h1><i>(You can Select Multiple Photos Videos)</i></h1>
    <table>
      <tr>
        <td><input id="f1" type="file" name="photo" multiple></td>
      </tr>
     </table>
    
    
    <table>
      
      <tr>
        <td><input id="f1" type="submit" name="add" value="ADD"></td>
      </tr>
    </table>
  </center>
</form>
</body>
</html>