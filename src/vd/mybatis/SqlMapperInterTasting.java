package vd.mybatis;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import vd.dto.TN_Li_dto;
import vd.dto.TN_dto;
import vd.formbean.TN_bean;

public interface SqlMapperInterTasting {
	@Insert("insert into vd_tastingnote(n_date, n_id, n_wineno, n_color, n_aromas, n_body, n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_image, n_core, n_likes) values(now(), #{n_id}, #{n_wineno}, #{n_color}, #{n_aromas}, #{n_body}, #{n_acidity}, #{n_bitter}, #{n_sweet}, #{n_points}, #{n_exprice}, #{n_comments}, #{n_title}, #{n_image}, #{n_core}, 0)")
	public int insertTN(TN_dto dto);
	
	@Insert("insert into vd_tnlikes(li_id, li_noteno) values(#{li_id}, #{li_noteno})")
	public int insertLike(TN_Li_dto dto);
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno order by note_no desc")
	public List<TN_dto> selectAllTN();
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno where note_no=#{note_no}")
	public TN_dto selectTN(String note_no);
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno order by n_date desc")
	public List<TN_dto> selectDateTN();
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno order by n_likes desc, note_no desc")
	public List<TN_dto> selectLikesTN();
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno where w_category = #{w_category} order by note_no desc")
	public List<TN_dto> selectCategoryTN(String w_category);
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno where n_id like #{n_id} order by note_no desc")
	public List<TN_dto> selectEmailTN(String m_email);
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno where n_title like #{n_title} order by note_no desc")
	public List<TN_dto> selectTitleTN(String n_title);
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno where w_name like #{w_name} order by note_no desc")
	public List<TN_dto> selectWineTN(String w_name);
	
	@Select("select w_name from vd_wine order by w_name asc")
	public  List<TN_bean> selectWine();
	
	@Select("select wine_no from vd_wine where w_name=#{w_name}")
	public  String selectWineno(String w_name);
	
	@Select("select note_no, n_date, n_id, n_wineno, n_color, n_aromas, n_body,n_acidity, n_bitter, n_sweet, n_points, n_exprice, n_comments, n_title, n_core, n_image, w_name, n_likes from vd_tastingnote inner join vd_wine on wine_no = n_wineno where n_comments like #{n_comments} order by note_no desc")
	public List<TN_dto> selectCommentsTN(String n_comments);
	
	@Select("select li_id from vd_tnlikes where li_id=#{li_id}")
	public String selectLikes(String li_id);
	
	@Update("update vd_tastingnote set n_likes= n_likes + 1 where note_no=#{note_no}")
	public int updateLike(String note_no);
	
	@Update("update vd_tastingnote set n_wineno=#{n_wineno}, n_color=#{n_color}, n_aromas=#{n_aromas}, n_body=#{n_body}, n_acidity=#{n_acidity}, n_bitter=#{n_bitter}, n_sweet=#{n_sweet}, n_points=#{n_points}, n_exprice=#{n_exprice}, n_comments=#{n_comments}, n_title=#{n_title}, n_core=#{n_core} where note_no=#{note_no}")
	public int updateTN(TN_dto dto);
	
	@Update("update vd_tastingnote set n_likes= n_likes - 1 where note_no=#{note_no}")
	public int declineLike(String note_no);
	
	@Delete("delete from vd_tastingnote where note_no=#{note_no}")
	public int deleteTN(String note_no);
	
	@Delete("delete from vd_tnlikes where li_noteno=#{li_noteno} and li_id=#{li_id}")
	public int deleteLike(TN_Li_dto dto);
}





