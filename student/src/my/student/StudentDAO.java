package my.student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	String url, user, pass;
	
	public StudentDAO(){
		//�ݵ�� �����ڸ� ������ �� public �� �ٿ�����Ѵ�. ��𿡼��� ���� ���� �� �� �ְ�.
		try{		Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}		
		 url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		 user = "luffy";
		 pass
		 = "oracle";

		
	}
	public int insertStudent(String id, String name, String cname)throws SQLException{
		String sql ="insert into student values(?,?,?)";
		try {
			con=DriverManager.getConnection(url, user, pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, cname);
			int res =ps.executeUpdate();
			return res;
			}
		finally {
			if (ps!=null) ps.close();
			if(con!=null) con.close(); // ��Ƽ�����忡���� �ڿ� �����ϸ� ���� �Ŵϱ�, try �� ���� �����Ŀ� finally �� ����.
			
		}
		}
	public List listStudent() throws SQLException {
		String sql = "select * from student";
		try{
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List listStudent = makeList(rs);
			return listStudent;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List makeList(ResultSet rs) throws SQLException{
		List list = new ArrayList();
		while(rs.next()){
			StudentDTO dto = new StudentDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setCname(rs.getString("cname"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteStudent(String id) throws SQLException {
		String sql = "delete from student where id =?";
		try{
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			int res = ps.executeUpdate();
	
			
			
			return res;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}






