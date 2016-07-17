package vd.business;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vd.dto.TN_Li_dto;
import vd.dto.TN_dto;
import vd.formbean.TN_bean;
import vd.mybatis.SqlMapConfig;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class TN_Dao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public boolean insertTN(HttpServletRequest request){
		boolean b = false;
		TN_dto dto= new TN_dto();
		SqlSession sqlSession = factory.openSession();		//수동
		
		
		try {
			
			String uploadDir ="C:/work/soujava/vindino/WebContent/data";
			MultipartRequest multi = new MultipartRequest(request, uploadDir,
					5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			String[] aroma = multi.getParameterValues("aroma");
			String n_aroma = "";
			for(int i =0 ; i < aroma.length; i++){
				n_aroma =n_aroma + aroma[i] + " ";
			}
			String wine_name = multi.getParameter("w_name");
			String wine_no = selectWineno(wine_name);
			dto.setN_id(multi.getParameter("n_id"));		
			dto.setN_wineno(wine_no);
			dto.setN_color(multi.getParameter("n_color"));
			dto.setN_aromas(n_aroma);
			dto.setN_body(multi.getParameter("n_body"));
			dto.setN_acidity(multi.getParameter("n_acidity"));
			dto.setN_bitter(multi.getParameter("n_bitter"));
			dto.setN_sweet(multi.getParameter("n_sweet"));
			dto.setN_points(multi.getParameter("n_points"));
			dto.setN_exprice(multi.getParameter("n_exprice"));
			dto.setN_comments(multi.getParameter("n_comments"));
			dto.setN_title(multi.getParameter("n_title"));
			dto.setN_image(multi.getFilesystemName("n_image"));
			dto.setN_core(multi.getParameter("n_core"));
			
			if(sqlSession.insert("insertTN",dto) > 0){
				b = true;
			}
			sqlSession.commit();			//나중에 실행
		}catch (Exception e) {
			System.out.println("insertTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		
		
		return b;
	}
	
	public boolean updateTN(TN_bean bean){
		boolean b = false;
		TN_dto dto= new TN_dto();
		SqlSession sqlSession = factory.openSession();		//수동
		
		
		try {
			
			String[] aroma = bean.getN_aromas();
			String n_aroma = "";
			for(int i =0 ; i < aroma.length; i++){
				n_aroma =n_aroma + aroma[i] + " ";
			}
			dto.setNote_no(bean.getNote_no());
			dto.setN_wineno("6");		//미구현
			dto.setN_color(bean.getN_color());
			dto.setN_aromas(n_aroma);
			dto.setN_body(bean.getN_body());
			dto.setN_acidity(bean.getN_acidity());
			dto.setN_bitter(bean.getN_bitter());
			dto.setN_sweet(bean.getN_sweet());
			dto.setN_points(bean.getN_points());
			dto.setN_exprice(bean.getN_exprice());
			dto.setN_comments(bean.getN_comments());
			dto.setN_title(bean.getN_title());
			dto.setN_core(bean.getN_core());
			
			if(sqlSession.update("updateTN",dto) > 0){
				b = true;
			}
			sqlSession.commit();			//나중에 실행
		}catch (Exception e) {
			System.out.println("updateTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		
		
		return b;
	}
	
	public List<TN_bean> selectAllTN(){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectAllTN");
		}catch (Exception e) {
			System.out.println("insertAllTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectDateTN(){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectDateTN");
		}catch (Exception e) {
			System.out.println("insertSortTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectLikesTN(){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectLikesTN");
		}catch (Exception e) {
			System.out.println("insertLikesTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectCategoryTN(String w_category){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectCategoryTN",w_category);
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectEmailTN(String m_email){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectEmailTN",m_email);
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectTitleTN(String n_title){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectTitleTN",n_title);
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectCommentsTN(String n_comments){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectCommentsTN",n_comments);
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public List<TN_bean> selectWineTN(String w_name){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectWineTN",w_name);
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return list;
	}
	
	public TN_dto selectTN(String note_no){
		TN_dto bean = null;
		SqlSession sqlSession = factory.openSession();		//수동
		try {
			bean =sqlSession.selectOne("selectTN",note_no);
			
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return bean;
	}
	
	public boolean updateLike(String note_no, String n_id){
		boolean b = false;
		TN_Li_dto dto = new TN_Li_dto();
		SqlSession sqlSession = factory.openSession();		//수동
		try {
			
			dto.setLi_id(n_id);
			dto.setLi_noteno(note_no);
			
			if(sqlSession.update("updateLike",note_no)>0){
				sqlSession.insert("insertLike", dto);
				b= true;	
			}
			sqlSession.commit();
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return b;
	}
	
	public boolean deleteTN(String note_no){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();		//수동
		try {
			if(sqlSession.update("deleteTN",note_no)>0){
				b= true;	
			}
			sqlSession.commit();
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		return b;
	}
	
	public List<TN_bean> selectWine(){
		List<TN_bean> list = null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			list = sqlSession.selectList("selectWine");
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		
		return list;
	}
	
	public String selectWineno(String w_name){
		String wine_no=null;
		SqlSession sqlSession = factory.openSession();		//수동
		
		try {
			wine_no = sqlSession.selectOne("selectWineno", w_name);
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
		
		return wine_no;
	}
	
	public boolean selectLikes(String n_id){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();		//수동
		String bean = null;
		
		try {
			bean = sqlSession.selectOne("selectLikes", n_id);
			if(bean != null){
				b = true;
			}
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
				
		return b;
	}
	
	public void declineLike(String note_no, String n_id){
		TN_Li_dto dto = new TN_Li_dto();
		SqlSession sqlSession = factory.openSession();		//수동
		try {
			
			dto.setLi_id(n_id);
			dto.setLi_noteno(note_no);
			
			if(sqlSession.update("declineLike",note_no)>0){
				sqlSession.delete("deleteLike", dto);	
			}
			sqlSession.commit();
		}catch (Exception e) {
			System.out.println("insertCategoryTN err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();			
		}
	}
}
