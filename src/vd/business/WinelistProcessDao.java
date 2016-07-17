package vd.business;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import vd.business.WinelistDto;
import vd.mybatis.SqlMapConfig;

public class WinelistProcessDao {

	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();  
	
	
	
	// 자료 전체 읽기
	public List<WinelistDto> selectWineAll() throws SQLException{
		
		SqlSession sqlSession = factory.openSession(); 
		List list = null;
		
		try {
			list = sqlSession.selectList("selectWineAll");
		} catch (Exception e) {
			System.out.println("selectDataAll err : " + e);
		} finally {
			if(sqlSession != null)
				sqlSession.close();
		}
		return list;
	}
	
	
	public List<WinelistDto> selectWineFilter(String filter_type) throws SQLException{

		SqlSession sqlSession = factory.openSession(); 
		List list = null;
		
		try {
			if(filter_type.equals("order_likes")){ 		// 문자열 비교는 == 로 불가능 -> .equals() 로 비교해야한다!!!
				list = sqlSession.selectList("filterWineLikes");
			}else if(filter_type.equals("order_w_name")){
				list = sqlSession.selectList("filterWineName");
			}else if(filter_type.equals("order_wine_no")){
				list = sqlSession.selectList("filterWineNo");
			}else if(filter_type.equals("order_w_vintage")){
				list = sqlSession.selectList("filterWineVintage");
			}else if(filter_type.equals("order_w_priceU")){
				list = sqlSession.selectList("filterWinePriceU");
			}else if(filter_type.equals("order_w_priceD")){
				list = sqlSession.selectList("filterWinePriceD");
			}else if(filter_type.equals("order_w_category")){
				list = sqlSession.selectList("filterWineCategory");
			}
		} catch (Exception e) {
			System.out.println("selectWineFilter err : " + e);
		} finally {
			if(sqlSession != null)
				sqlSession.close();
		}
		return list;
	}
	

	
	public List<WinelistDto> selectCategoryFilter(String filter_category) throws SQLException{

		SqlSession sqlSession = factory.openSession(); 
		List list = null;
		
		try {
			if(filter_category.equals("all")){ 		// 문자열 비교는 == 로 불가능 -> .equals() 로 비교해야한다!!!
				list = sqlSession.selectList("category_all");
			}else if(filter_category.equals("red")){
				list = sqlSession.selectList("category_red");
			}else if(filter_category.equals("white")){
				list = sqlSession.selectList("category_white");
			}else if(filter_category.equals("rose")){
				list = sqlSession.selectList("category_rose");
			}else if(filter_category.equals("sparkling")){
				list = sqlSession.selectList("category_sparkling");
			}else if(filter_category.equals("champagne")){
				list = sqlSession.selectList("category_champagne");
			}
		} catch (Exception e) {
			System.out.println("selectWineFilter err : " + e);
		} finally {
			if(sqlSession != null)
				sqlSession.close();
		}
		return list;
	}

	// 와인 추가
	public boolean insertWineData(HttpServletRequest request) throws SQLException{
		boolean b = false;
		WinelistDto dto = new WinelistDto();
		SqlSession sqlSession = factory.openSession();
		
		try {
			String uploadDir ="C:/work/soujava/vindino/WebContent/winedata";
			MultipartRequest multi = new MultipartRequest(request, uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			if(multi.getFilesystemName("w_image") == null){ 				// 따로 이미지 파일이 업로드되지 않을 경우
				dto.setW_image("ready.gif");
			}else{
				dto.setW_image(multi.getFilesystemName("w_image"));
			}

			dto.setWine_no(Integer.valueOf((multi.getParameter("wine_no"))));
			dto.setW_name(multi.getParameter("w_name"));
			dto.setW_category(multi.getParameter("w_category"));
			dto.setW_variety(multi.getParameter("w_variety"));
			dto.setW_vintage(multi.getParameter("w_vintage"));
			dto.setW_region(multi.getParameter("w_region"));
			dto.setW_alcohol(multi.getParameter("w_alcohol"));
			dto.setW_color(multi.getParameter("w_color"));
			dto.setW_aromas(multi.getParameter("w_aromas"));
			dto.setW_body(multi.getParameter("w_body"));
			dto.setW_acidity(multi.getParameter("w_acidity"));
			dto.setW_bitter(multi.getParameter("w_bitter"));
			dto.setW_sweet(multi.getParameter("w_sweet"));
			dto.setW_price(Integer.valueOf((multi.getParameter("w_price"))));
			dto.setW_likes(Integer.valueOf((multi.getParameter("w_likes"))));
			
			if(sqlSession.insert("insertWineData",dto) > 0)
				b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("insertWineData err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) 
				sqlSession.close();
		}
		return b;
	}
	
	

	// 와인 추가 시 번호 자동매김
	public int currentNum(){
		int cnt = 0;
		SqlSession sqlSession = factory.openSession(); 
		
		try {
			cnt = sqlSession.selectOne("currentNum");
		} catch (Exception e) {
			System.out.println("currentNum err : " + e);
		} finally {
			if(sqlSession != null)
				sqlSession.close();
		}
		return cnt+1;
	}
	
	
	
	public WinelistDto selectWineOne(String wine_no) throws SQLException{
		SqlSession sqlSession = factory.openSession(); 
		WinelistDto dto = null;
		try {
			dto = sqlSession.selectOne("selectWineById", wine_no);
		} catch (Exception e) {
			System.out.println("selectWineOne err : " + e);
		} finally {
			if(sqlSession != null) 
				sqlSession.close();
		}
		return dto;
	}
	
	
	public boolean updateWineData(HttpServletRequest request) throws SQLException{
		boolean b = false;
		WinelistDto dto = new WinelistDto();
		SqlSession sqlSession = factory.openSession();
		
		try {
			String uploadDir ="C:/work/soujava/vindino/WebContent/winedata";
			MultipartRequest multi = new MultipartRequest(request, uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			if(multi.getFilesystemName("w_image") == null){ 				// 따로 이미지 파일이 업로드되지 않을 경우
				dto.setW_image(multi.getParameter("w_image_original"));
			}else{
				dto.setW_image(multi.getFilesystemName("w_image"));
			}

			dto.setWine_no(Integer.valueOf((multi.getParameter("wine_no"))));
			dto.setW_name(multi.getParameter("w_name"));
			dto.setW_category(multi.getParameter("w_category"));
			dto.setW_variety(multi.getParameter("w_variety"));
			dto.setW_vintage(multi.getParameter("w_vintage"));
			dto.setW_region(multi.getParameter("w_region"));
			dto.setW_alcohol(multi.getParameter("w_alcohol"));
			dto.setW_color(multi.getParameter("w_color"));
			dto.setW_aromas(multi.getParameter("w_aromas"));
			dto.setW_body(multi.getParameter("w_body"));
			dto.setW_acidity(multi.getParameter("w_acidity"));
			dto.setW_bitter(multi.getParameter("w_bitter"));
			dto.setW_sweet(multi.getParameter("w_sweet"));
			dto.setW_price(Integer.valueOf((multi.getParameter("w_price"))));
			dto.setW_likes(Integer.valueOf((multi.getParameter("w_likes"))));
			
			if(sqlSession.update("updateWineData",dto) > 0)
				b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("updateWineData err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) 
				sqlSession.close();
		}
		return b;
	}
	
	
	public boolean deleteWineData(String wine_no){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			int cou = sqlSession.delete("deleteWineData", wine_no);
			if(cou > 0) 
				b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("deleteWineData err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	

	public boolean likesWineData(String wine_no){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			int cou1 = sqlSession.update("likesWineData", wine_no);
			if(cou1 > 0) {
//				try {
//					int cou2 = sqlSession.update("likesRecommendData", wine_no);
//					if(cou2 > 0) 
//						b = true;
//				} catch (Exception e2) {
//					System.out.println("likesRecommendData err : " + e2);
//					sqlSession.rollback();
//				}
				b = true;
			}
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("likesWineData err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	
}
