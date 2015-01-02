<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, ch09.update.UpdateDataBean, ch09.update.UpdateDBBean"%>

<%
	List<UpdateDataBean> memberList = null;
	UpdateDBBean dbPro = UpdateDBBean.getInstance();
	memberList = dbPro.getMembers();
%>

<table border='1'>
	<tr>
		<td>아이디
		<td>비밀번호 <%
			for (int i = 0; i < memberList.size(); i++) {
				UpdateDataBean member = (UpdateDataBean) memberList.get(i);
				String id = member.getId();
				String passwd = member.getPasswd();
		%>
	<tr>
		<td><%=id%>
		<td><%=passwd%> <%
 	}
 %>
</table>