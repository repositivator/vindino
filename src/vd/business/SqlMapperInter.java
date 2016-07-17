package vd.business;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import vd.dto.LikeDto;
import vd.dto.RecommendDto;
import vd.dto.WinelistDto;

public interface SqlMapperInter {	//DataMapper.xml이 필요없음

	//vd_wine
	@Select("select w_name from vd_wine where w_name like concat('%',#{w_name},'%')")
	public List<String> selectSuggestData();
	
	@Select("select * from vd_wine where wine_no=#{wine_no}")
	public WinelistDto selectWineDetail(String wine_no);
	
	@Select("select * from vd_wine where w_name like concat('%',#{w_name},'%') order by w_likes desc")
	public List<WinelistDto> selectSearchData();
	
	@Select("Select rwine_no from vd_recommend where rwine_no=#{rwine_no} and r_memail=#{r_memail}")
	public String selectWineByUser(RecommendDto dto);
	
	@Update("update vd_wine set w_likes=#{w_likes} where wine_no=#{wine_no} and w_name=#{w_name}")
	public int updateWineLike(LikeDto like);
	
	//vd_recommend
	@Select("select * from vd_recommend")
	public List<RecommendDto> selectRecommendAll();
	
	@Select("select * from vd_recommend where r_no=#{r_no}")
	public RecommendDto selectRecommendById(String r_no);
	
	@Select("select max(r_no) as r_no from vd_recommend")
	public int selectMaxNo();
	
	@Insert("insert into vd_recommend values(#{r_no},#{r_memail},#{rwine_no},now(),1)")
	public int insertRecommendData(RecommendDto dto);
	
	@Update("update vd_recommend set r_prefer=#{r_prefer},r_date=now() where r_no={#r_no}")
	public int updateRecommendData(RecommendDto dto);
	
	@Delete("delete from vd_recommend where r_no=#{r_no}")
	public int deleteRecommendData(String r_no);
}
