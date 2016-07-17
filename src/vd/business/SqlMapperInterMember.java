package vd.business;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import vd.dto.MemberDto;



public interface SqlMapperInterMember {
	//sql의 갯수만큼 추상메소드를 만든다.

	@Select("select m_email from vd_member where m_email=#{m_email}")
	public MemberDto checkEmail(String id);
	
	@Select("select m_email,m_passwd from vd_member where m_email=#{m_email} and m_passwd=#{m_passwd}")
	public MemberDto loginCheck(MemberDto dto);
	
	@Select("select m_email from vd_member where m_email=#{m_email}")
	public MemberDto selectDataById(String m_email);
	
	@Insert("insert into vd_member(m_date,m_email,m_passwd,m_name,m_phone,m_gen,m_birth) values(now(),#{m_email},#{m_passwd},#{m_name},#{m_phone},#{m_gen},#{m_birth})")
	public int memberInsert(MemberDto dto);
	
	@Update("update vd_member set m_passwd=#{m_passwd},m_name=#{m_name},m_phone=#{m_phone},m_gen=#{m_gen},m_birth=#{m_birth} where m_email=#{m_email}")
	public int updateData(MemberDto dto);
	
	@Select("select m_email from vd_member where m_email=#{m_email} and m_passwd=#{m_passwd}")
	public MemberDto checkPasswd(MemberDto dto);
	
	@Delete("delete from vd_member where m_email=#{m_email}")
	public int memberDelete(String m_email);
	
	
}
