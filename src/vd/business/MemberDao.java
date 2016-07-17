package vd.business;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vd.dto.MemberDto;
import vd.mybatis.SqlMapConfig;

public class MemberDao {
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public MemberDto selectDataPart(String m_email){
		SqlSession sqlSession = factory.openSession();
		MemberDto dto = null;
		try {
			dto =  sqlSession.selectOne("selectDataById",m_email);
		} catch (Exception e) {
			System.out.println("selectDataPart err : " + e);
		}finally{
			if(sqlSession!=null) sqlSession.close();	//select는 commit이나 rollback이 없다.
			
		}
		return dto;
	}
	
	public boolean memberUpdate(MemberDto dto){
		boolean b=false;
		SqlSession sqlSession = factory.openSession();
		try {
			if(sqlSession.update("updateData",dto)>0) b =true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("memberUpdate err : " + e);
		}finally{
			if(sqlSession !=null) sqlSession.close();
		}
		return b;
	}
	
	public boolean memberInsert(MemberDto dto){	//void,boolean 다 가능
		boolean b = false;
		//SqlSession sqlSession = factory.openSession(true);	//auto commit. rollback이 안되서 비추
		SqlSession sqlSession = factory.openSession();	//수동으로열어준다. commit이 필요하다.
		try{
			if(sqlSession.insert("memberInsert", dto) > 0) b =true;
			sqlSession.commit(); 	//commit을 해준다.sqlSession.rollback();도 있다
		}catch(Exception e){
			System.out.println("memberInsert err : " + e);
			sqlSession.rollback();
		}finally{
			if(sqlSession !=null) sqlSession.close(); 	//닫아준다
		}
		return b;
	}
	
	public boolean memberDelete(String m_email){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			int cou = sqlSession.delete("memberDelete",m_email);
			if(cou > 0){ b = true;
			sqlSession.commit();
			}
		} catch (Exception e) {
			System.out.println("memberDelete err : " + e);
			sqlSession.rollback();
		}finally{
			if(sqlSession !=null) sqlSession.close(); 	//닫아준다
		}
		return b;
	}
	
	public boolean checkEmail(String email){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			MemberDto bean2 = sqlSession.selectOne("checkEmail",email);
			if(bean2!=null){
				b=true;
			}
		} catch (Exception e) {
			System.out.println("checkEmail err "+ e);
		}finally{
			if(sqlSession !=null) sqlSession.close(); 
		}
		return b;
	}
	
	public boolean checkPasswd(String m_email,String m_passwd){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			MemberDto dto = new MemberDto();
			dto.setM_email(m_email);
			dto.setM_passwd(m_passwd);
			MemberDto bean2 = sqlSession.selectOne("checkPasswd",dto);
			if(bean2!=null){
				b=true;
			}
		} catch (Exception e) {
			System.out.println("checkPasswd err : "+e);
		}finally{
			if(sqlSession !=null) sqlSession.close(); 
		}
		return b;
	}
	
	public boolean loginCheck(String m_email,String m_passwd){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			MemberDto dto = new MemberDto();
			dto.setM_email(m_email);
			dto.setM_passwd(m_passwd);
			MemberDto bean2 = sqlSession.selectOne("loginCheck",dto);
			if(bean2!=null){
				b=true;
			}
		} catch (Exception e) {
			System.out.println("loginCheck err "+ e);
		}finally{
			if(sqlSession !=null) sqlSession.close(); 
		}
		return b;
	}
	
}
