package vd.business;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import vd.business.WinelistDto;

public interface SqlMapperInterWine {	//DataMapper.xml이 필요없음
	
	/*
	@Select("select * from vd_recommend")
	public List<RecommendDto> selectRecommendAll();
	
	@Select("select * from vd_recommend where r_no=#{r_no}")
	public RecommendDto selectRecommendById(String id);
	
	@Insert("insert into vd_recommend values(#{r_no},#{rmember_no},#{rwine_no},#{r_prefer},#{r_date})")
	public int insertRecommendData(RecommendDto dto);
	
	@Update("update vd_recommend set r_prefer=#{r_prefer},r_date=#{r_date} where r_no={#r_no}")
	public int updateRecommendData(RecommendDto dto);
	
	@Delete("delete from vd_recommend where r_no=#{r_no}")
	public int deleteRecommendData(RecommendDto dto);
	*/
	
	
	@Select("select * from vd_wine order by w_likes desc")
	public List<WinelistDto> selectWineAll(); //  List: java.util.List 임에 유의 (vs awt)


	@Select("select * from vd_wine order by w_likes desc")
	public List<WinelistDto> filterWineLikes(); 

	@Select("select * from vd_wine order by w_name")
	public List<WinelistDto> filterWineName(); 

	@Select("select * from vd_wine order by wine_no")
	public List<WinelistDto> filterWineNo();

	@Select("select * from vd_wine order by w_vintage")
	public List<WinelistDto> filterWineVintage();

	@Select("select * from vd_wine order by w_price desc")
	public List<WinelistDto> filterWinePriceU();

	@Select("select * from vd_wine order by w_price")
	public List<WinelistDto> filterWinePriceD();
	
	@Select("select * from vd_wine order by w_category")
	public List<WinelistDto> filterWineCategory();
	
	

	@Select("select * from vd_wine order by w_likes desc")
	public List<WinelistDto> category_all();

	@Select("select * from vd_wine where w_category='red' order by w_likes desc")
	public List<WinelistDto> category_red();
	
	@Select("select * from vd_wine where w_category='white' order by w_likes desc")
	public List<WinelistDto> category_white();
	
	@Select("select * from vd_wine where w_category='rose' order by w_likes desc")
	public List<WinelistDto> category_rose();
	
	@Select("select * from vd_wine where w_category='sparkling' order by w_likes desc")
	public List<WinelistDto> category_sparkling();
	
	@Select("select * from vd_wine where w_category='champagne' order by w_likes desc")
	public List<WinelistDto> category_champagne();
	
	
	
	@Insert("insert into vd_wine values(#{wine_no},#{w_name},#{w_image},#{w_category},"
			+ "#{w_variety},#{w_vintage},#{w_region},"
			+ "#{w_alcohol},#{w_color},#{w_aromas},#{w_body},#{w_acidity},#{w_bitter},#{w_sweet},"
			+ "#{w_price},#{w_likes})")
	public int insertWineData(WinelistDto dto);


	@Select("select max(wine_no) from vd_wine")
	public int currentNum();
	
	
	@Select("select * from vd_wine where wine_no = #{wine_no}")
	public WinelistDto selectWineById(String wine_no);

	
	@Update("update vd_wine set w_name=#{w_name},w_image=#{w_image},w_category=#{w_category},"
			+ "w_variety=#{w_variety},w_vintage=#{w_vintage},w_region=#{w_region},"
			+ "w_alcohol=#{w_alcohol},w_color=#{w_color},w_aromas=#{w_aromas},w_body=#{w_body},w_acidity=#{w_acidity},w_bitter=#{w_bitter},w_sweet=#{w_sweet},"
			+ "w_price=#{w_price},w_likes=#{w_likes} where wine_no=#{wine_no}")
	public int updateWineData(WinelistDto dto);
	
	
	@Delete("delete from vd_wine where wine_no = #{wine_no}")
	public int deleteWineData(String wine_no);
	
	
	@Update("update vd_wine set w_likes=w_likes+1 where wine_no=#{wine_no}")
	public int likesWineData(String wine_no);

	
	// 아래 좋아요 시 vd_recommend 테이블 수정하는 부분 완성 필요 : 고객정보 DTO로 받아서 처리해야함 
	@Update("update vd_recommend set w_prefer=1 where rwine_no=#{wine_no}")
	public int likesRecommendData(String wine_no);
	
	
	
}
