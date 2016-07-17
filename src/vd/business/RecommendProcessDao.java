package vd.business;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vd.dto.RecommendDto;
import vd.dto.WinelistDto;
import vd.formbean.LikeFormBean;
import vd.mybatis.SqlMapConfig;

public class RecommendProcessDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//Suggestion
	
	public List<String> selectSuggestData(String w_name){
		SqlSession sqlSession = factory.openSession();	//작업 단위를 열어줌
		List<String> list = null;
		try {
			//System.out.println(w_name);
			list = sqlSession.selectList("selectSuggestData", w_name);
		} catch (Exception e) {
			System.out.println("selectSearchData err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	//Wine result data
/*	
	public List<WinelistDto> selectWineAll(){ //return value is many
		SqlSession sqlSession = factory.openSession();
		List<WinelistDto> list = null;
		try {
			list = sqlSession.selectList("selectWineAll");
		} catch (Exception e) {
			System.out.println("selectDataAll err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}	*/
	
	public WinelistDto selectWineDetail(String wine_no){
		SqlSession sqlSession = factory.openSession();
		WinelistDto dto = null;
		try {
			dto = sqlSession.selectOne("selectWineDetail", wine_no);
		} catch (Exception e) {
			System.out.println("selectWineDetail err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return dto;
	}
	
	public List<WinelistDto> selectSearchData(String w_name){
		SqlSession sqlSession = factory.openSession();	//작업 단위를 열어줌
		List<WinelistDto> list = null;
		try {
			//System.out.println(w_name);
			list = sqlSession.selectList("selectSearchData", w_name);
		} catch (Exception e) {
			System.out.println("selectSearchData err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	//Wine like
	
	public boolean updateLike(LikeFormBean like){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();	//작업단위를 염
		try {
			if(sqlSession.update("updateWineLike", like) > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("updateLike err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public String selectWineByUser(RecommendDto dto){
		String wine_no = "";
		return wine_no;
	}
	
	//Recommend data
	
	public RecommendDto selectRecommendPart(String r_no){
		SqlSession sqlSession = factory.openSession();	//작업 단위를 열어줌
		RecommendDto dto = null;
		try {
			dto = sqlSession.selectOne("selectRecommendById", r_no);
		} catch (Exception e) {
			System.out.println("selecetRecommendPart err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return dto;
	}
	
	public boolean insertRecommend(RecommendDto dto){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			//maxCode
			int r_no = sqlSession.selectOne("selectMaxNo");
			r_no += 1;
			dto.setR_no(r_no);
			//System.out.println(r_no);
			
			//insert
			if(sqlSession.update("insertRecommendData", dto) > 0) b= true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("insertRecommend err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public boolean updateRecommend(RecommendDto dto){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			if(sqlSession.update("updateRecommendData", dto) > 0) b= true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("updateRecommend err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public boolean deleteRecommend(String r_no){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			if(sqlSession.update("deleteRecommendData", r_no) > 0) b= true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("deleteRecommend err: " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
}
